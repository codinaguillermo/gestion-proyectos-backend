const express = require('express');
const router = express.Router();
const usuarioController = require('../controllers/usuario.controller');

// Importamos el Middleware (Asegúrate que la ruta '../middlewares/auth.middleware' sea correcta ahora)
const authMiddleware = require('../middlewares/auth.middleware');

// Ruta Pública
router.post('/', usuarioController.crearUsuario);

// --- RUTA NUEVA ---
// GET /api/usuarios (Protegida con authMiddleware)
router.get('/', authMiddleware, usuarioController.listarUsuarios);

module.exports = router;
