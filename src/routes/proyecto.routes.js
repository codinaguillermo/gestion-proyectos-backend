const express = require('express');
const router = express.Router();
const proyectoController = require('../controllers/proyecto.controller');
const { verificarToken } = require('../middlewares/auth.middleware');

// 1. Proteger todas las rutas
router.use(verificarToken);

// 2. Definir las rutas usando las funciones del controlador
router.get('/:id', verificarToken, proyectoController.obtenerProyectoPorId);
router.post('/', proyectoController.crearProyecto);
router.get('/', proyectoController.obtenerProyectos);
router.put('/:id', proyectoController.actualizarProyecto);
router.delete('/:id', verificarToken, proyectoController.eliminarProyecto);

// ============================================================================
// --- RUTAS NUEVAS v2.6.0: CONTROL OPERATIVO DE CALIFICACIONES DE PROYECTOS --
// ============================================================================

/**
 * GET /api/proyectos/:id/calificaciones -> Obtener historial cronológico de notas de un proyecto.
 * POST /api/proyectos/:id/calificaciones -> Registrar un nuevo hito de calificación académica.
 */
router.get('/:id/calificaciones', proyectoController.obtenerCalificacionesProyecto);
router.post('/:id/calificaciones', proyectoController.registrarCalificacionProyecto);

module.exports = router;