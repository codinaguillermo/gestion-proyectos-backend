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

// ACTUALIZAR TAREA (PUT)
const actualizarTarea = async (req, res) => {
    try {
        const { id } = req.params;
        const { titulo, descripcion, estado, prioridad } = req.body;

        // 1. Verificar si existe
        const tarea = await Tarea.findByPk(id);
        if (!tarea) {
            return res.status(404).json({ mensaje: "Tarea no encontrada" });
        }

        // 2. Actualizar
        // update devuelve un array con el número de filas afectadas
        await Tarea.update(
            { titulo, descripcion, estado, prioridad },
            { where: { id } }
        );

        // 3. Devolver la tarea actualizada
        const tareaActualizada = await Tarea.findByPk(id);
        
        return res.json({
            mensaje: "Tarea actualizada",
            tarea: tareaActualizada
        });

    } catch (error) {
        console.error(error);
        return res.status(500).json({ mensaje: "Error al actualizar tarea" });
    }
};

// ELIMINAR TAREA (DELETE)
const eliminarTarea = async (req, res) => {
    try {
        const { id } = req.params;

        // 1. Verificar existencia
        const tarea = await Tarea.findByPk(id);
        if (!tarea) {
            return res.status(404).json({ mensaje: "Tarea no encontrada" });
        }

        // 2. Eliminar
        await Tarea.destroy({ where: { id } });

        return res.json({ mensaje: "Tarea eliminada correctamente" });

    } catch (error) {
        console.error(error);
        return res.status(500).json({ mensaje: "Error al eliminar tarea" });
    }
};

// EXPORTACIÓN BLINDADA
module.exports = {
    crearTarea,
    obtenerTareasProyecto,
    actualizarTarea, 
    eliminarTarea
};