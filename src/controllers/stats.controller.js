/*
Métricas por alumno actualizadas para contemplar ID 5 como DONE.
*/

const { Tarea, Usuario, EstadoTarea, UserStory, Proyecto } = require('../models');
const { fn, col, literal, Op } = require('sequelize');

const getProyectoStats = async (req, res) => {
    try {
        const { id } = req.params;

        // 1. Avance detallado
        const avancePorUS = await Tarea.findAll({
            where: { proyecto_id: id },
            attributes: [
                [col('userStory.titulo'), 'us_titulo'],
                [col('estado_detalle.nombre'), 'estado'],
                // Agregamos el ID del estado para que el frontend pueda validar mejor
                [col('estado_detalle.id'), 'estado_id'], 
                [fn('COUNT', col('Tarea.id')), 'cantidad']
            ],
            include: [
                { model: UserStory, as: 'userStory', attributes: [] },
                { model: EstadoTarea, as: 'estado_detalle', attributes: [] }
            ],
            group: ['userStory.id', 'estado_detalle.id', 'userStory.titulo', 'estado_detalle.nombre'],
            raw: true
        });

        // 2. Participación: Ponderación VIVA vs HISTÓRICA
        const porUsuario = await Tarea.findAll({
            where: { proyecto_id: id },
            attributes: [
                [col('responsable.nombre'), 'nombre'],
                [col('responsable.apellido'), 'apellido'],
                
                // --- CORRECCIÓN AQUÍ: Cambiamos != 4 por != 5 ---
                // CARGA VIVA LOCAL (Pendientes en este proyecto)
                [literal(`SUM(CASE WHEN estado_id != 5 THEN prioridad_id ELSE 0 END)`), 'carga_viva'],
                
                // CARGA HISTÓRICA LOCAL (Todo en este proyecto)
                [literal(`SUM(prioridad_id)`), 'carga_historica'],
                
                // CARGA VIVA EXTERNA (Pendientes en otros proyectos ACTIVOS)
                [
                    literal(`(
                        SELECT COALESCE(SUM(t.prioridad_id), 0)
                        FROM tareas AS t
                        INNER JOIN proyectos AS p ON t.proyecto_id = p.id
                        WHERE t.responsable_id = Tarea.responsable_id
                        AND t.proyecto_id != ${id}
                        AND t.estado_id != 5
                        AND t.deleted_at IS NULL
                        AND p.deleted_at IS NULL
                    )`), 
                    'carga_viva_externa'
                ]
            ],
            include: [{ model: Usuario, attributes: [], as: 'responsable' }],
            group: ['responsable.id', 'responsable.nombre', 'responsable.apellido', 'Tarea.responsable_id'], 
            raw: true
        });

        res.json({
            success: true,
            data: { avanceUS: avancePorUS, participacion: porUsuario }
        });

    } catch (error) {
        console.error("Error en estadísticas v1.1.1 (ID 5 Fix):", error);
        res.status(500).json({ success: false, error: error.message });
    }
};

module.exports = { getProyectoStats };