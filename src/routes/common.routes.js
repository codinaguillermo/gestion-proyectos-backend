const express = require('express');
const router = express.Router();
// Importamos todo lo que necesitamos del controlador common
const commonCtrl = require('../controllers/common.controller');
const { verificarToken } = require('../middlewares/auth.middleware'); 

// Usamos el objeto commonCtrl para llamar a las funciones
router.get('/prioridades-us', verificarToken, commonCtrl.getPrioridadesUS);
router.get('/estados-us', verificarToken, commonCtrl.getEstadosUS);

// Estas son las que necesita Alejandra para el Modal
router.get('/escuelas', verificarToken, commonCtrl.listarEscuelas);
router.get('/roles', verificarToken, commonCtrl.listarRoles);

module.exports = router;