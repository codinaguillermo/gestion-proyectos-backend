const express = require('express');
const router = express.Router();
const tareaController = require('../controllers/tarea.controller');

//Importamos con llaves y en español, igual que en proyectos
const { verificarToken } = require('../middlewares/auth.middleware');

// Protegemos las rutas
router.use(verificarToken);

// Definimos las rutas
// Crear Tarea
router.post('/', tareaController.crearTarea);
// PUT: Editar Tarea (Ej: http://localhost:3000/api/tareas/2)
router.put('/:id', tareaController.actualizarTarea);
// DELETE: Borrar Tarea
router.delete('/:id', tareaController.eliminarTarea);

router.get('/proyecto/:proyecto_id', tareaController.obtenerTareasProyecto);
//router.get('/config/maestras', authMiddleware, tareaController.obtenerTablasMaestras);
router.get('/config/maestras', verificarToken, tareaController.obtenerTablasMaestras);

module.exports = router;