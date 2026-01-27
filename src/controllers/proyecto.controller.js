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
    obtenerProyectos
};