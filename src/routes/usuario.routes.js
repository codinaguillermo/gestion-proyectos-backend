const express = require('express');
const router = express.Router();
const usuarioController = require('../controllers/usuario.controller');
const { verificarToken } = require('../middlewares/auth.middleware');
const upload = require('../middlewares/upload.middleware');

/**
 * Propósito: Definir los puntos de entrada (endpoints) para la gestión de usuarios y perfiles.
 * Quién la llama: El servidor principal (app.js) mediante app.use('/api/usuarios', ...).
 * Retorna: Router de Express con las rutas configuradas.
 */

// 1. Crear usuario (Público o Admin/Docente según configuración de app.js)
router.post('/', usuarioController.crearUsuario);

// 2. Listar usuarios (Requiere token, incluye filtros de búsqueda en el controlador)
router.get('/', verificarToken, usuarioController.listarUsuarios);

// 3. Obtener un usuario específico por su ID
router.get('/:id', verificarToken, usuarioController.obtenerUsuarioPorId);

// 4. Actualizar usuario (Ruta unificada)
// Procesa tanto datos de texto como el archivo 'avatar' si viene en la petición.
// Alimenta a: usuarioController.actualizarUsuario
router.put('/:id', verificarToken, upload.single('avatar'), usuarioController.actualizarUsuario);

module.exports = router;