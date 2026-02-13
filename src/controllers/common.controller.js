const { PrioridadUS, EstadoUS, Escuela, Rol } = require('../models');

// Función para Prioridades
const getPrioridadesUS = async (req, res) => {
    try {
        const prioridades = await PrioridadUS.findAll({ order: [['id', 'ASC']] });
        res.json(prioridades); 
    } catch (error) {
        res.status(500).json({ mensaje: "Error cargando prioridades" });
    }
};

// Función para Estados
const getEstadosUS = async (req, res) => {
    try {
        const estados = await EstadoUS.findAll();
        res.json(estados); 
    } catch (error) {
        res.status(500).json({ mensaje: "Error cargando estados" });
    }
};

// Función para Escuelas
const listarEscuelas = async (req, res) => {
    try {
        const escuelas = await Escuela.findAll({
            attributes: ['id', 'nombre_corto', 'nombre_largo'],
            order: [['nombre_corto', 'ASC']]
        });
        res.json(escuelas);
    } catch (error) {
        console.error("Error escuelas:", error);
        res.status(500).json({ error: 'Error al obtener escuelas' });
    }
};

// Función para Roles
const listarRoles = async (req, res) => {
    try {
        const roles = await Rol.findAll({
            attributes: ['id', 'nombre']
        });
        res.json(roles);
    } catch (error) {
        console.error("Error roles:", error);
        res.status(500).json({ error: 'Error al obtener roles' });
    }
};

// EXPORTACIÓN ÚNICA (Para evitar errores de "undefined" en las rutas)
module.exports = { 
    getPrioridadesUS,
    getEstadosUS,
    listarEscuelas,
    listarRoles
};