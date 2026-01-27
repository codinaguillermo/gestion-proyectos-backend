const express = require('express');
const router = express.Router();
const tareaController = require('../controllers/tarea.controller');

// OJO AQUÍ: Importamos con llaves y en español, igual que en proyectos
const { verificarToken } = require('../middlewares/auth.middleware');

// Protegemos las rutas
router.use(verificarToken);

// Definimos las rutas
router.post('/', tareaController.crearTarea);
router.get('/proyecto/:proyecto_id', tareaController.obtenerTareasProyecto);

module.exports = router;