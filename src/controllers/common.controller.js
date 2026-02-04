const { PrioridadUS, EstadoUS } = require('../models');

const getMaestrosUS = async (req, res) => {
    try {
        const [prioridades, estados] = await Promise.all([
            PrioridadUS.findAll({ order: [['peso', 'ASC']] }),
            EstadoUS.findAll()
        ]);
        res.json({ prioridades, estados });
    } catch (error) {
        res.status(500).json({ mensaje: "Error" });
    }
};

// IMPORTANTE: El nombre aquí debe coincidir con el que usás en la ruta
module.exports = { 
    getMaestrosUS 
};