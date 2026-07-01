const { Seguimiento, Usuario, Proyecto, Escuela, Especialidad, Materia } = require('../models');

/**
 * @función crearSeguimiento
 * @propósito Registra una nueva calificación cuantitativa (1 al 10) y observación pedagógica asociada a una materia específica, incluyendo la fecha manual.
 * @alimenta SeguimientoModal.vue (Formulario de carga de notas)
 * @retorna {Object} JSON con { success: true, data: Objeto de seguimiento creado } o estado de error.
 */
exports.crearSeguimiento = async (req, res) => {
    try {
        const { proyecto_id, alumno_id, materia_id, desempeno, observacion, fecha_evaluacion } = req.body;
        const docente = req.user || req.usuario; 
        
        if (!docente || !docente.id) {
            return res.status(401).json({ success: false, error: "Sesión inválida." });
        }

        if (Number(docente.rol_id) !== 1 && Number(docente.rol_id) !== 2) {
            return res.status(403).json({ success: false, error: "No tienes permisos de docente." });
        }

        if (!materia_id) return res.status(400).json({ success: false, error: "La materia es obligatoria." });
        if (!fecha_evaluacion) return res.status(400).json({ success: false, error: "La fecha de evaluación es obligatoria." });

        const valorNota = parseFloat(desempeno);
        if (isNaN(valorNota) || valorNota <= 0 || valorNota > 10) {
            return res.status(400).json({ success: false, error: "La calificación cuantitativa debe ser un valor estricto entre 1 y 10." });
        }

        const nuevo = await Seguimiento.create({
            proyecto_id, alumno_id, docente_id: docente.id, materia_id, desempeno: valorNota, observacion, fecha_evaluacion
        });

        res.status(201).json({ success: true, data: nuevo });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
};

/**
 * @función actualizarSeguimiento
 * @propósito Modifica un registro de calificación individual existente, permitiendo corregir errores de carga manual.
 * @alimenta DetalleSeguimientoModal.vue (Flujo de edición de notas)
 * @retorna {Object} JSON con { success: true, data: Objeto actualizado } o estado de error.
 */
exports.actualizarSeguimiento = async (req, res) => {
    try {
        const { id } = req.params;
        const { desempeno, observacion, fecha_evaluacion } = req.body;
        
        const seguimiento = await Seguimiento.findByPk(id);
        if (!seguimiento) return res.status(404).json({ success: false, error: "Registro no encontrado." });

        const valorNota = parseFloat(desempeno);
        if (isNaN(valorNota) || valorNota <= 0 || valorNota > 10) {
            return res.status(400).json({ success: false, error: "La calificación cuantitativa debe ser un valor estricto entre 1 y 10." });
        }

        if (!fecha_evaluacion) return res.status(400).json({ success: false, error: "La fecha de evaluación es obligatoria." });

        await seguimiento.update({
            desempeno: valorNota,
            observacion,
            fecha_evaluacion
        });

        res.json({ success: true, data: seguimiento });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
};

/**
 * @función eliminarSeguimiento
 * @propósito Elimina de la base de datos un registro de seguimiento individual mal cargado.
 * @alimenta DetalleSeguimientoModal.vue (Flujo de eliminación de notas)
 * @retorna {Object} JSON con { success: true, mensaje: Confirmación } o estado de error.
 */
exports.eliminarSeguimiento = async (req, res) => {
    try {
        const { id } = req.params;
        const seguimiento = await Seguimiento.findByPk(id);
        if (!seguimiento) return res.status(404).json({ success: false, error: "Registro no encontrado." });

        await seguimiento.destroy();
        res.json({ success: true, mensaje: "Registro eliminado correctamente." });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
};

/**
 * @función obtenerEstadisticasProyecto
 * @propósito Calcula los promedios generales cuantitativos individuales para el monitor de rendimiento.
 * @alimenta Monitor de Desempeño en ProyectoConfigView.
 * @retorna {Object} JSON con { success: true, data: Array de objetos con promedios disgregados por alumno }
 */
exports.obtenerEstadisticasProyecto = async (req, res) => {
    try {
        const { proyectoId } = req.params;
        const seguimientos = await Seguimiento.findAll({
            where: { proyecto_id: proyectoId },
            include: [
                { model: Usuario, as: 'alumno', attributes: ['nombre', 'apellido'] },
                { model: Materia, as: 'materia', attributes: ['id', 'nombre'], required: false }
            ]
        });

        const agrupado = seguimientos.reduce((acc, seg) => {
            const id = seg.alumno_id;
            if (!acc[id]) {
                acc[id] = { alumno: `${seg.alumno.nombre} ${seg.alumno.apellido}`, totalPuntos: 0, cantidad: 0 };
            }
            acc[id].totalPuntos += Number(seg.desempeno);
            acc[id].cantidad += 1;
            return acc;
        }, {});

        res.json({ success: true, data: Object.values(agrupado).map(a => ({
            alumno: a.alumno, promedio: parseFloat((a.totalPuntos / a.cantidad).toFixed(2)), cantidad: a.cantidad
        }))});
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
};

/**
 * Propósito: Obtiene el historial de calificaciones de un alumno. 
 * Si proyectoId es 'todos', retorna el historial completo de todas las evaluaciones 
 * registradas para el alumno, independientemente del proyecto al que pertenezca.
 * Si se recibe un ID específico, filtra el historial solo para ese proyecto.
 * 
 * Alimenta a: seguimiento.routes.js (endpoint GET /historial/:proyectoId/:alumnoId)
 * 
 * @param {Object} req - Objeto de petición HTTP (espera proyectoId y alumnoId en params).
 * @param {Object} res - Objeto de respuesta HTTP.
 * @returns {JSON} success: true y data: array con el historial encontrado.
 */
exports.obtenerHistorialAlumno = async (req, res) => {
    try {
        const { proyectoId, alumnoId } = req.params;

        // Construimos el filtro dinámicamente según el parámetro recibido
        let whereClause = { alumno_id: Number(alumnoId) };
        
        // Si no se solicita 'todos', aplicamos el filtro por proyecto para mantener compatibilidad
        if (proyectoId !== 'todos') {
            whereClause.proyecto_id = Number(proyectoId);
        }

        const historial = await Seguimiento.findAll({
            where: whereClause,
            include: [
                { model: Usuario, as: 'docente', attributes: ['apellido'], required: false },
                { model: Materia, as: 'materia', attributes: ['id', 'nombre'], required: false },
                { 
                    model: Proyecto, as: 'proyecto', attributes: ['nombre'], required: false,
                    include: [{ model: Escuela, attributes: ['nombre_largo'], required: false }]
                },
                { 
                    model: Usuario, as: 'alumno', attributes: ['nombre', 'apellido', 'curso', 'division'], required: false,
                    include: [{ model: Especialidad, as: 'especialidad_detalle', attributes: ['nombre'], required: false }]
                }
            ],
            // Ordenamos por fecha de creación para ver la línea de tiempo más reciente primero
            order: [['created_at', 'DESC']]
        });

        res.json({ success: true, data: historial });
    } catch (error) {
        // En caso de error, retornamos el mensaje correspondiente para el debugging
        res.status(500).json({ success: false, error: error.message });
    }
};