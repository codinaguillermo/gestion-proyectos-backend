const { Tarea, Proyecto, Usuario } = require('../models');

const crearTarea = async (req, res) => {
    try {
        const { titulo, descripcion, tipo, prioridad, proyecto_id, responsable_id, padre_id } = req.body;

        // 1. Validaciones básicas
        if (!titulo || !proyecto_id) {
            return res.status(400).json({ mensaje: "Faltan datos: titulo y proyecto_id son obligatorios" });
        }

        // 2. Crear la Tarea
        const nuevaTarea = await Tarea.create({
            titulo,
            descripcion,
            tipo,          // EPIC, STORY, TASK
            prioridad,
            proyecto_id,
            responsable_id,
            padre_id,      // Puede ser null
            estado: 'BACKLOG' // Valor por defecto
        });

        return res.status(201).json({
            mensaje: "Tarea creada con éxito",
            tarea: nuevaTarea
        });

    } catch (error) {
        console.error("Error creando tarea:", error);
        return res.status(500).json({ mensaje: "Error al crear la tarea", error: error.message });
    }
};

const obtenerTareasProyecto = async (req, res) => {
    try {
        const { proyecto_id } = req.params;

        const tareas = await Tarea.findAll({
            where: { 
                proyecto_id,
                padre_id: null 
            },
            include: [
                { model: Usuario, as: 'responsable', attributes: ['id', 'nombre'] },
                { model: Tarea, as: 'subtareas' } // Los hijos vendrán aquí dentro
            ]
});

        return res.json(tareas);

    } catch (error) {
        console.error(error);
        return res.status(500).json({ mensaje: "Error al obtener tareas" });
    }
};

// EXPORTACIÓN BLINDADA
module.exports = {
    crearTarea,
    obtenerTareasProyecto
};