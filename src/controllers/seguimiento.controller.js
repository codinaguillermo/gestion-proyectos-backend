const { Seguimiento, Usuario, Proyecto, Escuela, Especialidad, Materia, sequelize } = require('../models');
const { Op } = require('sequelize');

/**
 * @función crearSeguimiento
 * @propósito Registra una nueva calificación cuantitativa (1 al 10) y observación pedagógica asociada a una materia específica, incluyendo la fecha manual y el año lectivo.
 * @alimenta SeguimientoModal.vue (Formulario de carga de notas)
 * @retorna {Object} JSON con { success: true, data: Objeto de seguimiento creado } o estado de error.
 */
exports.crearSeguimiento = async (req, res) => {
    try {
        const { proyecto_id, alumno_id, materia_id, desempeno, observacion, fecha_evaluacion, anio_lectivo } = req.body;
        const docente = req.user || req.usuario; 
        
        if (!docente || !docente.id) {
            return res.status(401).json({ success: false, error: "Sesión inválida." });
        }

        if (Number(docente.rol_id) !== 1 && Number(docente.rol_id) !== 2) {
            return res.status(403).json({ success: false, error: "No tienes permisos de docente." });
        }

        if (!materia_id) return res.status(400).json({ success: false, error: "La materia es obligatoria." });
        if (!fecha_evaluacion) return res.status(400).json({ success: false, error: "La fecha de evaluación es obligatoria." });
        if (!anio_lectivo) return res.status(400).json({ success: false, error: "El año lectivo es obligatorio." });

        const valorNota = parseFloat(desempeno);
        if (isNaN(valorNota) || valorNota <= 0 || valorNota > 10) {
            return res.status(400).json({ success: false, error: "La calificación cuantitativa debe ser un valor estricto entre 1 y 10." });
        }

        const nuevo = await Seguimiento.create({
            proyecto_id, 
            alumno_id, 
            docente_id: docente.id, 
            materia_id, 
            anio_lectivo: Number(anio_lectivo), 
            desempeno: valorNota, 
            observacion, 
            fecha_evaluacion
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
        const { desempeno, observacion, fecha_evaluacion, anio_lectivo } = req.body;
        
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
            fecha_evaluacion,
            ...(anio_lectivo && { anio_lectivo: Number(anio_lectivo) })
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
 * Función auxiliar interna para construir las restricciones de fecha y año lectivo.
 * Mapea las fechas de los cuatrimestres ajustándolas al año lectivo seleccionado.
 */
const construirFiltroPeriodo = async (query) => {
    const { anio_lectivo, cuatrimestre, fecha_desde, fecha_hasta } = query;
    let where = {};

    if (anio_lectivo) {
        where.anio_lectivo = Number(anio_lectivo);
    }

    let desde = fecha_desde;
    let hasta = fecha_hasta;

    // Si se especifica un cuatrimestre, buscamos sus rangos y adaptamos el año al anio_lectivo seleccionado
    if (cuatrimestre) {
        const ConfigModel = sequelize.models.configuracion || sequelize.models.Configuracion;
        if (ConfigModel) {
            const cfgInicio = await ConfigModel.findOne({ where: { nombre: `cuatrimestre_${cuatrimestre}_inicio` } });
            const cfgFin = await ConfigModel.findOne({ where: { nombre: `cuatrimestre_${cuatrimestre}_fin` } });
            
            const anioBase = anio_lectivo || new Date().getFullYear();

            if (cfgInicio && cfgInicio.valor) {
                // Reemplazamos el año de la configuración por el año lectivo consultado (ej: 2025-07-21)
                const partesInicio = cfgInicio.valor.split('-'); // [YYYY, MM, DD]
                desde = `${anioBase}-${partesInicio[1]}-${partesInicio[2]}`;
            }
            if (cfgFin && cfgFin.valor) {
                const partesFin = cfgFin.valor.split('-'); // [YYYY, MM, DD]
                hasta = `${anioBase}-${partesFin[1]}-${partesFin[2]}`;
            }
        }
    }

    if (desde && hasta) {
        where.fecha_evaluacion = {
            [Op.between]: [desde, hasta]
        };
    } else if (desde) {
        where.fecha_evaluacion = { [Op.gte]: desde };
    } else if (hasta) {
        where.fecha_evaluacion = { [Op.lte]: hasta };
    }

    return where;
};

/**
 * @función obtenerEstadisticasProyecto
 * @propósito Calcula los promedios generales cuantitativos individuales para el monitor de rendimiento, con soporte opcional de filtrado por año y cuatrimestre.
 * @alimenta Monitor de Desempeño en ProyectoConfigView.
 * @retorna {Object} JSON con { success: true, data: Array de objetos con promedios disgregados por alumno }
 */
exports.obtenerEstadisticasProyecto = async (req, res) => {
    try {
        const { proyectoId } = req.params;
        
        // Construir el filtro dinámico basado en query params (anio_lectivo, cuatrimestre, fechas)
        const filtroPeriodo = await construirFiltroPeriodo(req.query);

        const seguimientos = await Seguimiento.findAll({
            where: { 
                proyecto_id: proyectoId,
                ...filtroPeriodo
            },
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
 * Propósito: Obtiene el historial de calificaciones de un alumno filtrado opcionalmente por período lectivo o cuatrimestre. 
 * Si proyectoId es 'todos', retorna el historial completo de todas las evaluaciones.
 * 
 * Alimenta a: seguimiento.routes.js (endpoint GET /historial/:proyectoId/:alumnoId)
 * 
 * @param {Object} req - Objeto de petición HTTP (espera proyectoId y alumnoId en params, y opcionalmente anio_lectivo, cuatrimestre en query).
 * @param {Object} res - Objeto de respuesta HTTP.
 * @returns {JSON} success: true y data: array con el historial encontrado.
 */
exports.obtenerHistorialAlumno = async (req, res) => {
    try {
        const { proyectoId, alumnoId } = req.params;

        let whereClause = { alumno_id: Number(alumnoId) };
        
        if (proyectoId !== 'todos') {
            whereClause.proyecto_id = Number(proyectoId);
        }

        // Incorporar el filtro dinámico de año y cuatrimestre / fechas
        const filtroPeriodo = await construirFiltroPeriodo(req.query);
        whereClause = { ...whereClause, ...filtroPeriodo };

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
            order: [['fecha_evaluacion', 'DESC']]
        });

        res.json({ success: true, data: historial });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
};