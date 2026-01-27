const { Proyecto } = require('../models');

const crearProyecto = async (req, res) => {
    try {
        const { nombre, descripcion } = req.body;

        if (!nombre) {
            return res.status(400).json({ mensaje: "El nombre es obligatorio" });
        }

        // Usamos req.usuario.id que viene del Token
        const nuevoProyecto = await Proyecto.create({
            nombre,
            descripcion,
            docente_owner_id: req.usuario.id,
            estado: 'ABIERTO' // Forzamos el estado inicial válido
        });

        return res.status(201).json({
            mensaje: "Proyecto creado exitosamente",
            proyecto: nuevoProyecto
        });

    } catch (error) {
        console.error(error);
        return res.status(500).json({ mensaje: "Error al crear proyecto", error: error.message });
    }
};

// ACTUALIZAR PROYECTO
const actualizarProyecto = async (req, res) => {
    try {
        const { id } = req.params;
        const { nombre, descripcion, estado } = req.body;

        const proyecto = await Proyecto.findByPk(id);
        if (!proyecto) {
            return res.status(404).json({ mensaje: "Proyecto no encontrado" });
        }

        // Seguridad simple: Solo el dueño puede editar (opcional, pero recomendado)
        if (proyecto.docente_owner_id !== req.usuario.id) {
            return res.status(403).json({ mensaje: "No tienes permiso para editar este proyecto" });
        }

        await Proyecto.update({ nombre, descripcion, estado }, { where: { id } });

        return res.json({ mensaje: "Proyecto actualizado" });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ mensaje: "Error al actualizar" });
    }
};

// ELIMINAR PROYECTO
const eliminarProyecto = async (req, res) => {
    try {
        const { id } = req.params;

        const proyecto = await Proyecto.findByPk(id);
        if (!proyecto) return res.status(404).json({ mensaje: "No encontrado" });

        if (proyecto.docente_owner_id !== req.usuario.id) {
            return res.status(403).json({ mensaje: "No tienes permiso" });
        }

        await Proyecto.destroy({ where: { id } });
        return res.json({ mensaje: "Proyecto eliminado" });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ mensaje: "Error al eliminar" });
    }
};

const obtenerProyectos = async (req, res) => {
    try {
        const proyectos = await Proyecto.findAll({
            where: { docente_owner_id: req.usuario.id }
        });
        return res.json(proyectos);
    } catch (error) {
        console.error(error);
        return res.status(500).json({ mensaje: "Error al leer proyectos" });
    }
};

// EXPORTACIÓN CLAVE
module.exports = {
    crearProyecto,
    obtenerProyectos,
    actualizarProyecto,
    eliminarProyecto
};