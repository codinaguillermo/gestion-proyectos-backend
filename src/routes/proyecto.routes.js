// src/routes/proyecto.routes.js
const express = require('express');
const router = express.Router();
const proyectoController = require('../controllers/proyecto.controller');
const authMiddleware = require('../middlewares/auth.middleware');

// Crear (POST)
router.post('/', authMiddleware, proyectoController.crearProyecto);

// --- AGREGAR ESTO ---
// Listar mis proyectos (GET)
router.get('/', authMiddleware, proyectoController.listarMisProyectos);

module.exports = router;