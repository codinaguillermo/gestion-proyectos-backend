const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

/**
 * @modelo Seguimiento
 * @propósito Registrar observaciones pedagógicas, conceptuales y actitudinales de alumnos individuales segmentadas por materia.
 * @comentario Mantiene integridad referencial física con Proyecto, Alumno (Usuario), Docente (Usuario) y Materias.
 * @alimenta Seguimiento.controller.js, SeguimientoModal.vue y el Monitor de Desempeño.
 */
const Seguimiento = sequelize.define('seguimiento', {
  proyecto_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    comment: 'Vinculación con el proyecto tecnológico en desarrollo',
    references: { model: 'proyectos', key: 'id' }
  },
  alumno_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    comment: 'ID del alumno calificado (entidad usuarios)',
    references: { model: 'usuarios', key: 'id' }
  },
  docente_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    comment: 'ID del docente que asienta la observación (entidad usuarios)',
    references: { model: 'usuarios', key: 'id' }
  },
  materia_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    comment: 'Asignatura específica a la que corresponde la nota conceptual (v2.7.0)',
    references: { model: 'materias', key: 'id' }
  },
  
  /**
   * @campo desempeno
   * @propósito Almacenar la calificación cuantitativa del alumno en la materia, estrictamente entre 1 y 10 (cero no permitido).
   * @alimenta Endpoints del controlador de seguimientos y cálculos de promedios en el frontend.
   * @retorna Valor numérico decimal (ej: 7.50).
   */
  desempeno: {
    type: DataTypes.DECIMAL(4, 2), 
    allowNull: false,
    comment: 'Escala cuantitativa del rendimiento académico (1 al 10)',
    validate: { 
      min: 1, 
      max: 10 
    }
  },
  
  observacion: {
    type: DataTypes.TEXT,
    allowNull: true,
    comment: 'Detalle o justificación pedagógica de la nota'
  }
}, {
  // Sincronización exacta con la migración real en producción
  tableName: 'seguimientos_alumnos',
  timestamps: true,
  paranoid: true,
  underscored: true,
  createdAt: 'created_at',
  updatedAt: 'updated_at',
  deletedAt: 'deleted_at'
});

module.exports = Seguimiento;