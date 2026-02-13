const express = require('express');
const router = express.Router();
const usuarioController = require('../controllers/usuario.controller');
const { verificarToken } = require('../middlewares/auth.middleware');

// 1. Crear usuario (Admin/Docente o Público según tu necesidad)
router.post('/', usuarioController.crearUsuario);

// 2. Listar usuarios (Con filtros de búsqueda)
router.get('/', verificarToken, usuarioController.listarUsuarios);

// 3. Actualizar usuario (Ruta unificada con ID)
// Esta ruta sirve tanto para "Mi Perfil" como para "Editar Alumno"
router.put('/:id', verificarToken, usuarioController.actualizarUsuario);

router.get('/:id', usuarioController.obtenerUsuarioPorId);

module.exports = router;