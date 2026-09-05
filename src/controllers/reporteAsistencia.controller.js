/**
 * Nombre del archivo: reporteAsistencia.controller.js
 * Propósito: Gestionar la lógica de negocio para generar informes consolidados de asistencia y el historial detallado por alumno utilizando el modelo Usuario de Sequelize.
 * A quién alimenta: El archivo de rutas de asistencia (reporteAsistencia.routes.js).
 * Qué retorna: Objetos JSON con los resúmenes acumulados por alumno o el desglose cronológico de un estudiante.
 */

const { Asistencia, sequelize } = require('../models');
const { Op } = require('sequelize');

/**
 * Propósito: Consultar y consolidar el resumen general de asistencia (total de clases, presentes, ausentes y porcentaje) agrupado por alumno para una materia, curso, división y escuela en un rango de fechas.
 * A quién alimenta: La vista frontal de reportes de asistencia en el frontend de Vue.js (ReporteAsistenciaView.vue).
 * Qué retorna: {Promise<Object>} JSON con el listado de alumnos y sus respectivos acumulados de asistencia en el período.
 */
const obtenerReporteGeneral = async (req, res) => {
  try {
    const { escuela_id, curso, division, materia_id, fecha_desde, fecha_hasta } = req.query;

    // Validación estricta de parámetros obligatorios para el reporte
    if (!escuela_id || !curso || !division || !materia_id || !fecha_desde || !fecha_hasta) {
      return res.status(400).json({
        success: false,
        message: "Faltan parámetros obligatorios para generar el reporte de asistencia."
      });
    }

    // 1. Buscar todos los registros de asistencia dentro del rango de fechas y filtros dados
    const registros = await Asistencia.findAll({
      where: {
        escuela_id,
        curso,
        division,
        materia_id,
        fecha: {
          [Op.between]: [fecha_desde, fecha_hasta]
        }
      }
    });

    if (!registros || registros.length === 0) {
      return res.status(200).json({
        success: true,
        data: []
      });
    }

    // 2. Extraer los IDs únicos de alumnos presentes en los registros de asistencia
    const alumnoIds = [...new Set(registros.map(r => r.alumno_id))];

    // 3. Obtener el modelo de usuario de forma segura desde sequelize.models
    const ModeloUsuario = sequelize.models.usuario;
    
    if (!ModeloUsuario) {
      throw new Error("El modelo usuario no se encuentra disponible en sequelize.models.");
    }

    const alumnos = await ModeloUsuario.findAll({
      where: {
        id: {
          [Op.in]: alumnoIds
        }
      },
      attributes: ['id', 'nombre', 'apellido']
    });

    // Mapear los alumnos por ID para un acceso rápido y limpio
    const mapaAlumnos = {};
    alumnos.forEach(alum => {
      mapaAlumnos[alum.id] = {
        apellido: alum.apellido || 'Desconocido',
        nombre: alum.nombre || 'Desconocido',
        dni: alum.dni || ''
      };
    });

    // 4. Agrupar y procesar los acumulados por cada alumno
    const resumenAlumnos = {};

    registros.forEach(reg => {
      const alumnoId = reg.alumno_id;
      const datosAlumno = mapaAlumnos[alumnoId] || { apellido: 'Desconocido', nombre: 'Desconocido', dni: '' };

      if (!resumenAlumnos[alumnoId]) {
        resumenAlumnos[alumnoId] = {
          alumno_id: alumnoId,
          apellido: datosAlumno.apellido,
          nombre: datosAlumno.nombre,
          dni: datosAlumno.dni,
          total_clases: 0,
          presentes: 0,
          ausentes: 0
        };
      }

      resumenAlumnos[alumnoId].total_clases += 1;
      if (reg.presente) {
        resumenAlumnos[alumnoId].presentes += 1;
      } else {
        resumenAlumnos[alumnoId].ausentes += 1;
      }
    });

    // 5. Calcular porcentajes finales para cada alumno
    const resultadoFinal = Object.values(resumenAlumnos).map(alup => {
      const porcentaje = alup.total_clases > 0 
        ? ((alup.presentes / alup.total_clases) * 100).toFixed(1) 
        : 0;
      return {
        ...alup,
        porcentaje_asistencia: parseFloat(porcentaje)
      };
    });

    // Ordenar alfabéticamente por apellido
    resultadoFinal.sort((a, b) => a.apellido.localeCompare(b.apellido));

    return res.status(200).json({
      success: true,
      data: resultadoFinal
    });

  } catch (error) {
    console.error("DETALLE DE ERROR EN REPORTE GENERAL:", error);
    return res.status(500).json({
      success: false,
      message: error.message || "Error interno al procesar el reporte de asistencia."
    });
  }
};

/**
 * Propósito: Consultar el historial cronológico detallado de asistencia de un alumno específico para una materia en un rango de fechas.
 * A quién alimenta: El desglose o modal de detalle individual al hacer clic en un alumno en la vista de reportes.
 * Qué retorna: {Promise<Object>} JSON con la lista de fechas, estados (presente/ausente) y observaciones de ese estudiante.
 */
const obtenerHistorialAlumno = async (req, res) => {
  try {
    const { alumno_id, materia_id, fecha_desde, fecha_hasta } = req.query;

    if (!alumno_id || !materia_id || !fecha_desde || !fecha_hasta) {
      return res.status(400).json({
        success: false,
        message: "Faltan parámetros para consultar el historial del alumno."
      });
    }

    const historial = await Asistencia.findAll({
      where: {
        alumno_id,
        materia_id,
        fecha: {
          [Op.between]: [fecha_desde, fecha_hasta]
        }
      },
      order: [['fecha', 'ASC']]
    });

    return res.status(200).json({
      success: true,
      data: historial
    });

  } catch (error) {
    console.error("Error al obtener historial del alumno:", error);
    return res.status(500).json({
      success: false,
      message: "Error interno al obtener el historial del alumno."
    });
  }
};

module.exports = {
  obtenerReporteGeneral,
  obtenerHistorialAlumno
};