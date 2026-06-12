const express = require('express');
const router = express.Router();
const seguimientoController = require('../controllers/seguimiento.controller');
const { verificarToken } = require('../middlewares/auth.middleware');

/**
 * Rutas de Seguimiento Pedagógico (v2.2.0)
 * Propósito: Mapear los endpoints a las funciones del controlador.
 * Alimenta a: app.js
 */

// Todas las rutas requieren token
router.use(verificarToken);

// Endpoints
router.post('/', seguimientoController.crearSeguimiento);
router.get('/stats/:proyectoId', seguimientoController.obtenerEstadisticasProyecto);
router.get('/historial/:proyectoId/:alumnoId', seguimientoController.obtenerHistorialAlumno);

/**
 * @ruta PUT /api/seguimientos/:id
 * @propósito Enlazar la petición del frontend para modificar un seguimiento existente.
 * @alimenta Controlador seguimientoController.actualizarSeguimiento
 * @retorna Objeto actualizado mediante el controlador.
 */
router.put('/:id', seguimientoController.actualizarSeguimiento);

/**
 * @ruta DELETE /api/seguimientos/:id
 * @propósito Enlazar la petición del frontend para eliminar un seguimiento por error de carga.
 * @alimenta Controlador seguimientoController.eliminarSeguimiento
 * @retorna Mensaje de confirmación mediante el controlador.
 */
router.delete('/:id', seguimientoController.eliminarSeguimiento);

// REGLA DE ORO: Exportar el router
module.exports = router;