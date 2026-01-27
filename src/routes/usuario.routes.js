const express = require('express');
const router = express.Router();
const usuarioController = require('../controllers/usuario.controller');

// --- CORRECCIÓN AQUÍ ---
// 1. Usamos llaves { } para extraer la función
// 2. Usamos el nombre correcto 'verificarToken'
const { verificarToken } = require('../middlewares/auth.middleware');

// Ruta Pública (Crear usuario)
router.post('/', usuarioController.crearUsuario);

// --- RUTA NUEVA ---
// GET /api/usuarios (Protegida)
// 3. Pasamos la función 'verificarToken', no el objeto
router.get('/', verificarToken, usuarioController.listarUsuarios);

module.exports = router;