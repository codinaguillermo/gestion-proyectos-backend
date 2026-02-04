const express = require('express');
const router = express.Router();
const tareaController = require('../controllers/tarea.controller'); // <-- SOLO UNA VEZ
const { verificarToken } = require('../middlewares/auth.middleware');

// 1. Proteger todas las rutas
router.use(verificarToken);

// 2. Rutas del CRUD de Tareas / US
router.post('/', tareaController.crearTarea);
router.get('/proyecto/:proyecto_id', tareaController.obtenerTareasProyecto);
router.put('/:id', tareaController.actualizarTarea);
router.delete('/:id', tareaController.eliminarTarea);

// 3. Rutas de utilidades
//router.get('/diccionarios', tareaController.obtenerTablasMaestras);
router.get('/config/maestras', tareaController.obtenerTablasMaestras);
router.post('/:id/horas', tareaController.registrarAvanceHoras);

module.exports = router;