const { PrioridadUS, EstadoUS } = require('../models');

// Función para Prioridades
const getPrioridadesUS = async (req, res) => {
    try {
        const prioridades = await PrioridadUS.findAll({ order: [['id', 'ASC']] });
        res.json(prioridades); // Enviamos el array directo
    } catch (error) {
        res.status(500).json({ mensaje: "Error cargando prioridades" });
    }
};

// Función para Estados
const getEstadosUS = async (req, res) => {
    try {
        const estados = await EstadoUS.findAll();
        res.json(estados); // Enviamos el array directo
    } catch (error) {
        res.status(500).json({ mensaje: "Error cargando estados" });
    }
};

module.exports = { 
    getPrioridadesUS,
    getEstadosUS
};