const express = require('express');
const router = express.Router();
const asistenciaCtrl = require('../controllers/asistencia.controller');
const { verificarToken } = require('../middlewares/auth.middleware');

/**
 * @ruta GET /api/asistencias/alumnos
 * @propósito Exponer el endpoint para obtener el listado de alumnos y su estado de asistencia actual.
 * @alimenta Vista de Toma de Asistencia en el frontend (llamada Axios tras seleccionar filtros).
 * @retorna Array de alumnos procesado por el controlador.
 */
router.get('/alumnos', verificarToken, asistenciaCtrl.obtenerAlumnosParaAsistencia);

/**
 * @ruta POST /api/asistencias
 * @propósito Exponer el endpoint para guardar o actualizar masivamente la lista de asistencia del día.
 * @alimenta Vista de Toma de Asistencia en el frontend (llamada Axios al presionar "Guardar Asistencia").
 * @retorna Mensaje de éxito procesado por el controlador.
 */
router.post('/', verificarToken, asistenciaCtrl.guardarAsistenciaDiaria);

module.exports = router;