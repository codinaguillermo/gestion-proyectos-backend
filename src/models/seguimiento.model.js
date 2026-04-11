const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

/**
 * Modelo Seguimiento
 * Propósito: Registrar observaciones pedagógicas y actitudinales de alumnos por proyecto.
 * Comentario: Mantiene integridad referencial con Proyecto, Alumno y Docente.
 */
const Seguimiento = sequelize.define('seguimiento', {
  proyecto_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: { model: 'proyectos', key: 'id' }
  },
  alumno_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: { model: 'usuarios', key: 'id' }
  },
  docente_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: { model: 'usuarios', key: 'id' }
  },
  desempeno: {
    type: DataTypes.TINYINT, // 1: Malo, 2: Regular, 3: Bueno
    allowNull: false,
    validate: { min: 1, max: 3 }
  },
  observacion: {
    type: DataTypes.TEXT,
    allowNull: true
  }
}, {
  tableName: 'seguimientos_proyectos',
  timestamps: true,
  paranoid: true,
  underscored: true,
  createdAt: 'created_at',
  updatedAt: 'updated_at',
  deletedAt: 'deleted_at'
});

module.exports = Seguimiento;