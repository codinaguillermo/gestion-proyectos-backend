const express = require('express');
const router = express.Router();
// Importamos todo lo que necesitamos del controlador common
const commonCtrl = require('../controllers/common.controller');
const { verificarToken } = require('../middlewares/auth.middleware'); 
const notaRoutes = require('./nota.routes');

// Usamos el objeto commonCtrl para llamar a las funciones
router.get('/prioridades-us', verificarToken, commonCtrl.getPrioridadesUS);
router.get('/estados-us', verificarToken, commonCtrl.getEstadosUS);

router.get('/escuelas', verificarToken, commonCtrl.listarEscuelas);
router.get('/roles', verificarToken, commonCtrl.listarRoles);

// Para el combo de especialidades en el modal de alumnos
router.get('/especialidades', commonCtrl.listarEspecialidades);

// ============================================================================
// --- RUTAS NUEVAS v2.6.0: ENDPOINTS MAESTROS DE EVALUACIÓN ------------------
// ============================================================================
router.get('/hitos-evaluacion', verificarToken, commonCtrl.listarHitosEvaluacion);

router.use('/notas-docentes', notaRoutes);

module.exports = router;