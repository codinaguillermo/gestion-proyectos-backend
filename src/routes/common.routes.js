const express = require('express');
const router = express.Router();
// Importamos la función del controlador
const { getMaestrosUS } = require('../controllers/common.controller');
// CORRECCIÓN CLAVE: Tu middleware exporta 'verificarToken', no 'authMiddleware'
const { verificarToken } = require('../middlewares/auth.middleware'); 

// Definimos la ruta usando los nombres correctos
router.get('/maestros-us', verificarToken, getMaestrosUS);

module.exports = router;