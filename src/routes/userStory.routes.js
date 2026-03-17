const express = require('express');
const router = express.Router();
const userStoryController = require('../controllers/userStory.controller');
const { verificarToken } = require('../middlewares/auth.middleware'); 
// Traemos al "patovica" de proyectos
const { verificarAccesoProyecto } = require('../middlewares/autorizacion.middleware');

// 1. EL TOKEN ES OBLIGATORIO PARA TODO
router.use(verificarToken);

/**
 * POST /
 * El proyecto_id viene en el body. El middleware lo valida antes de crear.
 */
router.post('/', verificarAccesoProyecto, userStoryController.crearUserStory);

/**
 * GET /proyecto/:proyectoId
 * Aquí el proyecto es explícito en la URL. Si no es su proyecto, ni entra.
 */
router.get('/proyecto/:proyectoId', verificarAccesoProyecto, userStoryController.obtenerUserStoriesPorProyecto);

/**
 * GET, PUT, DELETE /:id
 * OJO: Aquí no pasamos verificarAccesoProyecto porque el ID es de la USER STORY, no del PROYECTO.
 * La seguridad de estas 3 rutas YA LA TENÉS dentro del controlador (el código que pegamos recién).
 */
router.get('/:id', userStoryController.obtenerUserStoryPorId);
router.put('/:id', userStoryController.actualizarUserStory);
router.delete('/:id', userStoryController.eliminarUserStory);

module.exports = router;