const express = require('express');
const router = express.Router();
const userStoryController = require('../controllers/userStory.controller');
// Asumo que tienes un middleware de auth, si no, lo quitamos luego
const { verificarToken } = require('../middlewares/auth.middleware'); 

// Prefijo: /api/user-stories
router.post('/', verificarToken, userStoryController.crearUserStory);
router.get('/proyecto/:proyectoId', verificarToken, userStoryController.obtenerUserStoriesPorProyecto);
router.delete('/:id', verificarToken, userStoryController.eliminarUserStory);

module.exports = router;