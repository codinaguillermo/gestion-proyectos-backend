const express = require('express');
const router = express.Router();
const statsController = require('../controllers/stats.controller');

// CORRECCIÓN AQUÍ: Importamos la función exacta usando llaves { }
const { verificarToken } = require('../middlewares/auth.middleware'); 

// GET /api/stats/proyecto/:id
// Ahora pasamos 'verificarToken', que sí es una función válida
router.get('/proyecto/:id', verificarToken, statsController.getProyectoStats);

module.exports = router;