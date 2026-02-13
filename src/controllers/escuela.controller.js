const { Escuela } = require('../models');

const listarEscuelas = async (req, res) => {
    try {
        const escuelas = await Escuela.findAll({
            order: [['nombre_corto', 'ASC']]
        });
        res.json(escuelas);
    } catch (error) {
        res.status(500).json({ error: 'Error al listar escuelas' });
    }
};

const crearEscuela = async (req, res) => {
    try {
        const { nombre_corto, nombre_largo, cue, direccion } = req.body;
        const nuevaEscuela = await Escuela.create({ nombre_corto, nombre_largo, cue, direccion });
        res.status(201).json(nuevaEscuela);
    } catch (error) {
        res.status(500).json({ error: 'Error al crear escuela' });
    }
};

const actualizarEscuela = async (req, res) => {
    try {
        const { id } = req.params;
        const escuela = await Escuela.findByPk(id);
        if (!escuela) return res.status(404).json({ mensaje: 'Escuela no encontrada' });
        
        await escuela.update(req.body);
        res.json({ mensaje: 'Escuela actualizada' });
    } catch (error) {
        res.status(500).json({ error: 'Error al actualizar' });
    }
};

module.exports = { listarEscuelas, crearEscuela, actualizarEscuela };