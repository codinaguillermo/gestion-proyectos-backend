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
  desempeno: {
    type: DataTypes.TINYINT, // 1: Malo, 2: Regular, 3: Bueno
    allowNull: false,
    comment: 'Escala cualitativa del rendimiento actitudinal',
    validate: { min: 1, max: 3 }
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