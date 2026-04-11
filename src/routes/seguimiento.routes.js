const express = require('express');
const router = express.Router();
const seguimientoController = require('../controllers/seguimiento.controller');
const { verificarToken } = require('../middlewares/auth.middleware');

/**
 * Rutas de Seguimiento Pedagógico (v2.2.0)
 * Propósito: Mapear los endpoints a las funciones del controlador.
 * Alimenta a: app.js
 */

// Todas las rutas requieren token
router.use(verificarToken);

// Endpoints
router.post('/', seguimientoController.crearSeguimiento);
router.get('/stats/:proyectoId', seguimientoController.obtenerEstadisticasProyecto);
router.get('/historial/:proyectoId/:alumnoId', seguimientoController.obtenerHistorialAlumno);

// REGLA DE ORO: Exportar el router
module.exports = router;