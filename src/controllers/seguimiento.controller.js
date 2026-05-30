const { Seguimiento, Usuario, Proyecto, Escuela, Especialidad, Materia } = require('../models');

/**
 * función crearSeguimiento
 * propósito Registra una nueva observación pedagógica individual asociada a una materia específica.
 * alimenta SeguimientoModal.vue (Formulario de carga de notas de concepto cualitativas)
 * retorna {Object} JSON con { success: true, data: Objeto de seguimiento creado } o estado de error.
 */
exports.crearSeguimiento = async (req, res) => {
    try {
        const { proyecto_id, alumno_id, materia_id, desempeno, observacion } = req.body;
        const docente = req.user || req.usuario; 
        
        if (!docente || !docente.id) {
            return res.status(401).json({ success: false, error: "Sesión inválida." });
        }

        if (Number(docente.rol_id) !== 1 && Number(docente.rol_id) !== 2) {
            return res.status(403).json({ success: false, error: "No tienes permisos de docente." });
        }

        if (!materia_id) {
            return res.status(400).json({ success: false, error: "La materia es obligatoria para asentar el seguimiento." });
        }

        const nuevo = await Seguimiento.create({
            proyecto_id,
            alumno_id,
            docente_id: docente.id,
            materia_id, // Nuevo campo incorporado
            desempeno,
            observacion
        });

        res.status(201).json({ success: true, data: nuevo });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
};

/**
 * función obtenerEstadisticasProyecto
 * propósito Calcula los promedios generales e individuales para el monitor de rendimiento, incluyendo contexto de materias.
 * alimenta Monitor de Desempeño en ProyectoConfigView y gráficos adaptados con filtros por materia.
 * retorna {Object} JSON con { success: true, data: Array de objetos con promedios disgregados por alumno }
 */
exports.obtenerEstadisticasProyecto = async (req, res) => {
    try {
        const { proyectoId } = req.params;
        const seguimientos = await Seguimiento.findAll({
            where: { proyecto_id: proyectoId },
            include: [
                { model: Usuario, as: 'alumno', attributes: ['nombre', 'apellido'] },
                { model: Materia, as: 'materia', attributes: ['id', 'nombre'], required: false } // Relación incorporada para filtrado dinámico
            ]
        });

        const agrupado = seguimientos.reduce((acc, seg) => {
            const id = seg.alumno_id;
            if (!acc[id]) {
                acc[id] = { 
                    alumno: `${seg.alumno.nombre} ${seg.alumno.apellido}`, 
                    totalPuntos: 0, 
                    cantidad: 0 
                };
            }
            acc[id].totalPuntos += seg.desempeno;
            acc[id].cantidad += 1;
            return acc;
        }, {});

        res.json({ success: true, data: Object.values(agrupado).map(a => ({
            alumno: a.alumno,
            promedio: parseFloat((a.totalPuntos / a.cantidad).toFixed(2)),
            cantidad: a.cantidad
        }))});
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
};

/**
 * función obtenerHistorialAlumno
 * propósito Obtiene el historial cronológico y detallado de seguimientos cualitativos de un alumno, incluyendo la materia calificada.
 * alimenta DetalleSeguimientoModal.vue (Vistas de rendimiento, filtros por asignatura y renderizado de PDF)
 * retorna {Object} JSON con { success: true, data: Array de seguimientos ordenados por fecha con blindaje completo de joins }
 */
exports.obtenerHistorialAlumno = async (req, res) => {
    try {
        const { proyectoId, alumnoId } = req.params;

        const historial = await Seguimiento.findAll({
            where: { 
                proyecto_id: Number(proyectoId), 
                alumno_id: Number(alumnoId) 
            },
            include: [
                { 
                    model: Usuario, 
                    as: 'docente', 
                    attributes: ['apellido'],
                    required: false 
                },
                {
                    model: Materia,
                    as: 'materia', // Debe coincidir con el alias definido en la relación del modelo Seguimiento
                    attributes: ['id', 'nombre'],
                    required: false
                },
                { 
                    model: Proyecto, 
                    as: 'proyecto', 
                    attributes: ['nombre'],
                    required: false,
                    include: [{ 
                        model: Escuela, 
                        attributes: ['nombre_largo'],
                        required: false 
                    }]
                },
                { 
                    model: Usuario, 
                    as: 'alumno', 
                    attributes: ['nombre', 'apellido', 'curso', 'division'],
                    required: false,
                    include: [{ 
                        model: Especialidad, 
                        as: 'especialidad_detalle', 
                        attributes: ['nombre'],
                        required: false 
                    }]
                }
            ],
            order: [['created_at', 'DESC']]
        });

        res.json({ success: true, data: historial });
    } catch (error) {
        console.error("ERROR EN CONTROLADOR:", error.message);
        res.status(500).json({ success: false, error: error.message });
    }
};