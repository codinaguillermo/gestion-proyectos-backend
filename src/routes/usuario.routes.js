const express = require('express');
const router = express.Router();
const usuarioController = require('../controllers/usuario.controller');
const { verificarToken } = require('../middlewares/auth.middleware');
const upload = require('../middlewares/upload.middleware');

/**
 * IMPORTANTE: El orden de las rutas es jerárquico. 
 */

// 1. Crear usuario
router.post('/', upload.single('avatar'), usuarioController.crearUsuario);

// 2. Listar usuarios
router.get('/', verificarToken, usuarioController.listarUsuarios);

// --- RUTAS ESPECÍFICAS (ARRIBA) ---

/**
 * Corregido: Se cambió obtenerListadoProyectosAlumno por obtenerListadoProyectosUsuario
 */
router.get('/:id/proyectos-asignados', verificarToken, usuarioController.obtenerListadoProyectosUsuario);

// --- RUTAS GENÉRICAS (ABAJO) ---

// 3. Obtener un usuario específico por su ID
router.get('/:id', verificarToken, usuarioController.obtenerUsuarioPorId);

// 4. Actualizar usuario
router.put('/:id', verificarToken, upload.single('avatar'), usuarioController.actualizarUsuario);

module.exports = router;