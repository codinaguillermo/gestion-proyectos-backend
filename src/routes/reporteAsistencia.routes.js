/**
 * Nombre del archivo: reporteAsistencia.routes.js
 * Propósito: Definir los endpoints HTTP (GET) para la obtención del reporte general de asistencia y el historial detallado por alumno.
 * A quién alimenta: El enrutador central o principal del servidor backend de GEPRES.
 * Qué retorna: Un objeto Router de Express configurado con las rutas de informes de asistencia.
 */

const express = require('express');
const router = express.Router();
const reporteAsistenciaController = require('../controllers/reporteAsistencia.controller');

/**
 * Propósito: Registrar la ruta GET para obtener el consolidado general de asistencia por curso, materia y rango de fechas.
 * A quién alimenta: Las peticiones HTTP provenientes del cliente frontend para renderizar la tabla de reporte.
 * Qué retorna: Middleware/Ruta de Express asociada al controlador obtenerReporteGeneral.
 */
router.get('/general', reporteAsistenciaController.obtenerReporteGeneral);

/**
 * Propósito: Registrar la ruta GET para consultar el historial cronológico y detallado de asistencia de un alumno particular.
 * A quién alimenta: Las peticiones HTTP desde el frontend al seleccionar un alumno para ver su detalle individual.
 * Qué retorna: Middleware/Ruta de Express asociada al controlador obtenerHistorialAlumno.
 */
router.get('/alumno', reporteAsistenciaController.obtenerHistorialAlumno);

module.exports = router;