const express = require('express');
const router = express.Router();
const { getPrioridadesUS, getEstadosUS } = require('../controllers/common.controller');
const { verificarToken } = require('../middlewares/auth.middleware'); 

// Ahora sí existen estas dos rutas por separado
router.get('/prioridades-us', verificarToken, getPrioridadesUS);
router.get('/estados-us', verificarToken, getEstadosUS);

module.exports = router;