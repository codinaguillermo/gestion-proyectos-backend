const express = require('express');
const router = express.Router();
const proyectoController = require('../controllers/proyecto.controller');
const { verificarToken } = require('../middlewares/auth.middleware');

// 1. Proteger todas las rutas
router.use(verificarToken);

// 2. Definir las rutas de gestión de proyectos
router.get('/:id', proyectoController.obtenerProyectoPorId);
router.post('/', proyectoController.crearProyecto);
router.get('/', proyectoController.obtenerProyectos);
router.put('/:id', proyectoController.actualizarProyecto);
router.delete('/:id', proyectoController.eliminarProyecto);

// ============================================================================
// --- RUTAS NUEVAS v2.6.0/2.9.1: CONTROL OPERATIVO DE CALIFICACIONES ---------
// ============================================================================

/**
 * GET    /api/proyectos/:id/calificaciones -> Obtener historial cronológico.
 * POST   /api/proyectos/:id/calificaciones -> Registrar un nuevo hito de calificación.
 * PUT    /api/proyectos/:id/calificaciones/:calificacionId -> Editar una calificación existente.
 * DELETE /api/proyectos/:id/calificaciones/:calificacionId -> Eliminar una calificación.
 */
router.get('/:id/calificaciones', proyectoController.obtenerCalificacionesProyecto);
router.post('/:id/calificaciones', proyectoController.registrarCalificacionProyecto);
router.put('/:id/calificaciones/:calificacionId', proyectoController.actualizarCalificacionProyecto);
router.delete('/:id/calificaciones/:calificacionId', proyectoController.eliminarCalificacionProyecto);

// REGLA DE ORO: Exportar el router
module.exports = router;