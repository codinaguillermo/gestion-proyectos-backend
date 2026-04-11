const { Seguimiento, Usuario, Proyecto, Escuela,Especialidad } = require('../models');

/**
 * crearSeguimiento: Registra una nueva observación pedagógica.
 * Alimenta a: SeguimientoModal.vue
 * Retorna: Objeto de seguimiento creado.
 */
exports.crearSeguimiento = async (req, res) => {
    try {
        const { proyecto_id, alumno_id, desempeno, observacion } = req.body;
        const docente = req.user || req.usuario; 
        
        if (!docente || !docente.id) {
            return res.status(401).json({ success: false, error: "Sesión inválida." });
        }

        if (Number(docente.rol_id) !== 1 && Number(docente.rol_id) !== 2) {
            return res.status(403).json({ success: false, error: "No tienes permisos de docente." });
        }

        const nuevo = await Seguimiento.create({
            proyecto_id,
            alumno_id,
            docente_id: docente.id,
            desempeno,
            observacion
        });

        res.status(201).json({ success: true, data: nuevo });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
};

/**
 * obtenerEstadisticasProyecto: Calcula promedios para el gráfico de barras.
 * Alimenta a: Monitor de Desempeño en ProyectoConfigView.
 * Retorna: Array con promedios por alumno.
 */
exports.obtenerEstadisticasProyecto = async (req, res) => {
    try {
        const { proyectoId } = req.params;
        const seguimientos = await Seguimiento.findAll({
            where: { proyecto_id: proyectoId },
            include: [{ model: Usuario, as: 'alumno', attributes: ['nombre', 'apellido'] }]
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
 * obtenerHistorialAlumno: Obtiene historial detallado con contexto institucional.
 * Alimenta a: DetalleSeguimientoModal.vue (Previsualización y PDF).
 * Retorna: Lista cronológica con datos de docente, proyecto y escuela.
 */
/**
 * obtenerHistorialAlumno: Obtiene historial con blindaje de joins.
 * Propósito: Evitar que la falta de un dato anidado (como especialidad) rompa la consulta.
 */
/**
 * obtenerHistorialAlumno: Versión de máxima compatibilidad.
 * Propósito: Traer seguimientos aunque fallen las relaciones secundarias.
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
                        as: 'especialidad_detalle', // Tu alias de index.js
                        attributes: ['nombre'],
                        required: false 
                    }]
                }
            ],
            order: [['created_at', 'DESC']]
        });

        res.json({ success: true, data: historial });
    } catch (error) {
        // Este console.log te avisó del error, ahora debería dar success
        console.error("ERROR EN CONTROLADOR:", error.message);
        res.status(500).json({ success: false, error: error.message });
    }
};