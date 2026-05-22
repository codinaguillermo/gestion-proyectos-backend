const { PrioridadUS, EstadoUS, Escuela, Rol, Especialidad, HitoEvaluacion } = require('../models');

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

// NUEVA Función para Especialidades
const listarEspecialidades = async (req, res) => {
    try {
        const especialidades = await Especialidad.findAll({
            attributes: ['id', 'nombre'],
            order: [['nombre', 'ASC']]
        });
        res.json(especialidades);
    } catch (error) {
        console.error("Error especialidades:", error);
        res.status(500).json({ error: 'Error al obtener especialidades' });
    }
};

// ============================================================================
// --- FUNCIONES NUEVAS v2.6.0: CONTROL DE HITOS INSTITUCIONALES --------------
// ============================================================================

/**
 * Propósito: Recuperar el listado completo de hitos y conceptos de evaluación admisibles.
 * Quién la alimenta: Invocada desde las rutas comunes para poblar selectores en las vistas de evaluación.
 * Qué datos retorna: Array de objetos que contienen el 'id' y el 'nombre' del hito institucional.
 */
const listarHitosEvaluacion = async (req, res) => {
    try {
        const hitos = await HitoEvaluacion.findAll({
            attributes: ['id', 'nombre'],
            order: [['id', 'ASC']]
        });
        return res.json(hitos);
    } catch (error) {
        console.error("ERROR EN listarHitosEvaluacion:", error);
        return res.status(500).json({ error: 'Error al obtener la lista de hitos de evaluación' });
    }
};

// EXPORTACIÓN ÚNICA
module.exports = { 
    getPrioridadesUS,
    getEstadosUS,
    listarEscuelas,
    listarRoles,
    listarEspecialidades,
    // EXPORTACIÓN v2.6.0: Habilitada para el ruteador común del ecosistema
    listarHitosEvaluacion
};