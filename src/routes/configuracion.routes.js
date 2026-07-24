const express = require('express');
const router = express.Router();
const { obtenerAnioLectivo, actualizarAnioLectivo, obtenerTodas } = require('../controllers/configuracion.controller');
const { verificarToken, esAdmin } = require('../middlewares/auth.middleware');

router.get('/anio-lectivo', verificarToken, obtenerAnioLectivo);
router.put('/anio-lectivo', verificarToken, esAdmin, actualizarAnioLectivo);
router.get('/', verificarToken, esAdmin, obtenerTodas);

module.exports = router;