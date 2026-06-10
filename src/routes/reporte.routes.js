const express = require('express');
const router = express.Router();
const reporteController = require('../controllers/reporte.controller');

/**
 * @rutas /api/reportes
 * @propósito Manejar la extracción y generación de datos para exportaciones y planillas.
 */

// Obtener escuelas y cursos/divisiones disponibles para poblar los selects
router.get('/filtros-planilla', reporteController.obtenerFiltrosPlanilla);

// Generar el JSON con las notas y promedios según los filtros seleccionados
router.post('/generar-planilla', reporteController.generarDatosPlanillaExcel);

module.exports = router;