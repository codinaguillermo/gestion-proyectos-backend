const { Tarea, Usuario, EstadoTarea, UserStory } = require('../models');
const { fn, col, literal } = require('sequelize');

const getProyectoStats = async (req, res) => {
    try {
        const { id } = req.params;

        // 1. Avance detallado: User Story + Estado
        const avancePorUS = await Tarea.findAll({
            where: { proyecto_id: id },
            attributes: [
                [col('userStory.titulo'), 'us_titulo'],
                [col('estado_detalle.nombre'), 'estado'],
                [fn('COUNT', col('Tarea.id')), 'cantidad']
            ],
            include: [
                { model: UserStory, as: 'userStory', attributes: [] },
                { model: EstadoTarea, as: 'estado_detalle', attributes: [] }
            ],
            group: ['userStory.id', 'estado_detalle.id', 'userStory.titulo', 'estado_detalle.nombre'],
            raw: true
        });

        // 2. Participación: Carga LOCAL vs EXTERNA
        const porUsuario = await Tarea.findAll({
            where: { proyecto_id: id },
            attributes: [
                [fn('COUNT', col('Tarea.id')), 'tareas'],
                [col('responsable.nombre'), 'nombre'],
                [
                    literal(`(
                        SELECT COUNT(*)
                        FROM tareas AS t
                        WHERE t.responsable_id = Tarea.responsable_id
                        AND t.proyecto_id != ${id}
                        AND t.deleted_at IS NULL
                    )`), 
                    'tareas_externas'
                ]
            ],
            include: [{
                model: Usuario,
                attributes: [],
                as: 'responsable' 
            }],
            // Agregamos Tarea.responsable_id al GROUP BY para cumplir con ONLY_FULL_GROUP_BY
            group: ['responsable.id', 'responsable.nombre', 'Tarea.responsable_id'], 
            raw: true
        });

        res.json({
            success: true,
            data: {
                avanceUS: avancePorUS,
                participacion: porUsuario
            }
        });

    } catch (error) {
        console.error("Error detallado en estadísticas:", error);
        res.status(500).json({ 
            success: false, 
            error: error.message 
        });
    }
};

module.exports = { getProyectoStats };