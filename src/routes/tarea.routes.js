const express = require('express');
const router = express.Router();
const tareaController = require('../controllers/tarea.controller'); 
const { verificarToken } = require('../middlewares/auth.middleware');
// IMPORTANTE: Traemos el nuevo patovica
const { verificarAccesoProyecto } = require('../middlewares/autorizacion.middleware');

// 1. Proteger todas las rutas con el Token (Saber quién es)
router.use(verificarToken);

/**
 * GET /api/tareas
 * Solo Admin debería ver el listado global. 
 * Si un alumno entra acá, el controlador debería filtrar por su ID o rebotarlo.
 */
router.get('/', tareaController.obtenerTodasLasTareas);

/**
 * POST /api/tareas
 * Aquí validamos acceso porque el proyecto_id viene en el body
 */
router.post('/', verificarAccesoProyecto, tareaController.crearTarea);

/**
 * GET /api/tareas/proyecto/:proyecto_id
 * El proyecto_id viene en la URL (:proyecto_id), el middleware lo caza de ahí.
 */
router.get('/proyecto/:proyecto_id', verificarAccesoProyecto, tareaController.obtenerTareasProyecto);

/**
 * GET /api/tareas/:id
 * NOTA: Aquí no podemos usar verificarAccesoProyecto directo porque no tenemos el proyecto_id 
 * en la URL. El chequeo se hace DENTRO del controlador obtenerTareaPorId.
 */
router.get('/:id', tareaController.obtenerTareaPorId); 

/**
 * PUT /api/tareas/:id
 * Validamos con el proyecto_id que debe viajar en el body.
 */
router.put('/:id', verificarAccesoProyecto, tareaController.actualizarTarea);

/**
 * DELETE /api/tareas/:id
 * El borrado también requiere validar el proyecto_id.
 */
router.delete('/:id', verificarAccesoProyecto, tareaController.eliminarTarea);

// 3. Rutas de utilidades
router.get('/config/maestras', tareaController.obtenerTablasMaestras);

// El registro de avance también debería estar protegido
router.post('/:id/avance', tareaController.registrarAvanceHoras);

module.exports = router;