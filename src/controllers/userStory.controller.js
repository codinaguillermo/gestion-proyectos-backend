const { UserStory, Proyecto, PrioridadUS, EstadoUS, Tarea } = require('../models');

// --- CREAR USER STORY ---
const crearUserStory = async (req, res) => {
    try {
        const { proyecto_id, titulo, descripcion, prioridad_id, estado_id } = req.body;

        const proyecto = await Proyecto.findByPk(proyecto_id);
        if (!proyecto) {
            return res.status(404).json({ mensaje: "Proyecto no encontrado" });
        }

        const nuevaUS = await UserStory.create({
            proyecto_id,
            titulo,
            descripcion,
            condiciones,
            prioridad_id,
            estado_id: estado_id || 1 // Pendiente por defecto
        });

        return res.status(201).json(nuevaUS);
    } catch (error) {
        console.error("Error al crear User Story:", error);
        return res.status(500).json({ mensaje: "Error al crear User Story", detalle: error.message });
    }
};

// --- OBTENER USER STORIES POR PROYECTO ---
// src/controllers/userStory.controller.js

// src/controllers/userStory.controller.js

const obtenerUserStoriesPorProyecto = async (req, res) => {
    try {
        const { proyectoId } = req.params;
        
        const stories = await UserStory.findAll({
            where: { proyecto_id: proyectoId },
            attributes: [
                'id', 
                'titulo', 
                'descripcion', 
                'condiciones', // <-- 1. ASEGURATE que en la DB se llame así
                'prioridad_id', 
                'estado_id', 
                'proyecto_id'
            ],
            include: [
                { model: PrioridadUS, as: 'prioridad_detalle' },
                { model: EstadoUS, as: 'estado_detalle' },
                { model: Tarea, as: 'tareas' }
            ],
            order: [['id', 'ASC']] 
        });
        
        return res.json(stories);
    } catch (error) {
        return res.status(500).json({ mensaje: "Error", detalle: error.message });
    }
};

// --- ELIMINAR USER STORY ---
const eliminarUserStory = async (req, res) => {
    try {
        const { id } = req.params;
        console.log("🗑️ Solicitud para eliminar US ID:", id);

        // Primero borramos las tareas asociadas para evitar conflictos de FK
        await Tarea.destroy({ where: { us_id: id } });

        // Ahora borramos la US
        const resultado = await UserStory.destroy({ where: { id } });

        if (resultado === 0) {
            return res.status(404).json({ mensaje: "No se encontró la User Story" });
        }

        return res.json({ mensaje: "User Story eliminada correctamente" });
    } catch (error) {
        console.error("❌ ERROR AL ELIMINAR US:", error);
        return res.status(500).json({ 
            mensaje: "Error al eliminar la US", 
            detalle: error.message 
        });
    }
};

// --- ACTUALIZAR USER STORY ---
const actualizarUserStory = async (req, res) => {
    try {
        const { id } = req.params;
        const { titulo, descripcion, condiciones, prioridad_id, estado_id } = req.body;

        const us = await UserStory.findByPk(id);
        if (!us) {
            return res.status(404).json({ mensaje: "User Story no encontrada" });
        }

        // Actualizamos los campos, incluyendo las nuevas condiciones
        await us.update({
            titulo,
            descripcion,
            condiciones,
            prioridad_id,
            estado_id
        });

        return res.json({ mensaje: "User Story actualizada correctamente", us });
    } catch (error) {
        console.error("Error al actualizar US:", error);
        return res.status(500).json({ mensaje: "Error al actualizar la US", detalle: error.message });
    }
};

// ACTUALIZÁ TUS EXPORTS
module.exports = {
    crearUserStory,
    obtenerUserStoriesPorProyecto,
    actualizarUserStory,
    eliminarUserStory 
};