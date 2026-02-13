const express = require('express');
const router = express.Router();
const tareaController = require('../controllers/tarea.controller'); 
const { verificarToken } = require('../middlewares/auth.middleware');

// 1. Proteger todas las rutas
router.use(verificarToken);

// 2. Rutas del CRUD de Tareas / US
/**
 * GET /api/tareas
 * Alimenta: El listado global de tareas para calcular la carga de trabajo de los alumnos.
 * Retorna: Array de todas las tareas con sus prioridades y estados.
 */
router.get('/', tareaController.obtenerTodasLasTareas);

/**
 * POST /api/tareas
 * Alimenta: Creación de nuevas tareas desde el Backlog.
 */
router.post('/', tareaController.crearTarea);

/**
 * GET /api/tareas/proyecto/:proyecto_id
 * Alimenta: El visor de tareas de un proyecto específico.
 */
router.get('/proyecto/:proyecto_id', tareaController.obtenerTareasProyecto);

router.put('/:id', tareaController.actualizarTarea);
router.delete('/:id', tareaController.eliminarTarea);

// 3. Rutas de utilidades

/**
 * GET /api/tareas/config/maestras
 * Alimenta: El configService para obtener diccionarios de la DB (Prioridades con pesos, Estados, etc).
 */
router.get('/config/maestras', tareaController.obtenerTablasMaestras);

/**
 * PATCH /api/tareas/:id/log-horas
 * Alimenta: tareaService.registrarHoras en el frontend.
 * Nota: Se cambió a PATCH y la ruta a /log-horas para coincidir con el service actual.
 */
router.patch('/:id/log-horas', tareaController.registrarAvanceHoras);

module.exports = router;