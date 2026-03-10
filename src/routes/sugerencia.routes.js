const express = require('express');
const router = express.Router();
const sugerenciaController = require('../controllers/sugerencia.controller'); 
const { verificarToken } = require('../middlewares/auth.middleware');

router.get("/", verificarToken, sugerenciaController.obtenerSugerencias);
router.post("/", verificarToken, sugerenciaController.crearSugerencia);
router.put("/:id/responder", verificarToken, sugerenciaController.responderSugerencia);

module.exports = router;