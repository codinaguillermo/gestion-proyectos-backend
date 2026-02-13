const express = require('express');
const router = express.Router();
const { 
    listarEscuelas, 
    crearEscuela, 
    actualizarEscuela 
} = require('../controllers/escuela.controller');

// CAMBIO AQUÍ: Importamos el nombre real de la función
const { verificarToken } = require('../middlewares/auth.middleware');

// Listar: Usamos verificarToken
router.get('/', verificarToken, listarEscuelas);

// Crear y Editar: 
// OJO: Como no tenés adminDocenteMiddleware en el archivo que me pasaste,
// por ahora usamos solo verificarToken para que el servidor ARRANQUE.
router.post('/', verificarToken, crearEscuela);
router.put('/:id', verificarToken, actualizarEscuela);

module.exports = router;