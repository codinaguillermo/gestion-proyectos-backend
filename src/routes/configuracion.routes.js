const express = require('express');
const router = express.Router();
const { 
  obtenerAnioLectivo, 
  actualizarAnioLectivo, 
  obtenerTodas, 
  actualizarConfiguracion 
} = require('../controllers/configuracion.controller');
const { verificarToken, esAdmin } = require('../middlewares/auth.middleware');

router.get('/anio-lectivo', verificarToken, obtenerAnioLectivo);
router.put('/anio-lectivo', verificarToken, esAdmin, actualizarAnioLectivo);
router.get('/', verificarToken, esAdmin, obtenerTodas);
router.put('/:id', verificarToken, esAdmin, actualizarConfiguracion);

module.exports = router;