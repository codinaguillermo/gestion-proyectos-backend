const express = require('express');
const router = express.Router();
const proyectoController = require('../controllers/proyecto.controller');
const { verificarToken } = require('../middlewares/auth.middleware');

// 1. Proteger todas las rutas
router.use(verificarToken);

// 2. Definir las rutas usando las funciones del controlador
// Si proyectoController.crearProyecto es undefined, aquí explota.
router.post('/', proyectoController.crearProyecto);
router.get('/', proyectoController.obtenerProyectos);

module.exports = router;