const express = require('express');
const router = express.Router();
const notaController = require('../controllers/nota.controller');
const { verificarToken } = require('../middlewares/auth.middleware');

router.get('/', verificarToken, notaController.listarMisNotas);
router.post('/', verificarToken, notaController.crearNota);
router.patch('/:id/estado', verificarToken, notaController.cambiarEstado);

module.exports = router;