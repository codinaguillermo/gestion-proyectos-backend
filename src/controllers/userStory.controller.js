const { UserStory, Proyecto } = require('../models');

// --- CREAR USER STORY ---
const crearUserStory = async (req, res) => {
    try {
        const { proyecto_id, titulo, descripcion, prioridad } = req.body;

        // Verificamos que el proyecto exista
        const proyecto = await Proyecto.findByPk(proyecto_id);
        if (!proyecto) {
            return res.status(404).json({ mensaje: "Proyecto no encontrado" });
        }

        const nuevaUS = await UserStory.create({
            proyecto_id,
            titulo,
            descripcion,
            prioridad
        });

        return res.status(201).json(nuevaUS);
    } catch (error) {
        console.error("Error al crear User Story:", error);
        return res.status(500).json({ mensaje: "Error al crear User Story", detalle: error.message });
    }
};

// --- OBTENER USER STORIES POR PROYECTO ---
const obtenerUserStoriesPorProyecto = async (req, res) => {
    try {
        const { proyectoId } = req.params;
        const stories = await UserStory.findAll({
            where: { proyecto_id: proyectoId },
            order: [['prioridad', 'ASC']]
        });
        return res.json(stories);
    } catch (error) {
        console.error("Error al obtener User Stories:", error);
        return res.status(500).json({ mensaje: "Error al obtener User Stories" });
    }
};

module.exports = {
    crearUserStory,
    obtenerUserStoriesPorProyecto
};