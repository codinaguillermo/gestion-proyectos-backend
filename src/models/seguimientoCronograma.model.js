const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

/**
 * @modelo SeguimientoCronograma
 * @propósito Mapear el seguimiento cualitativo y control de avance de hitos según el cronograma acordado por materia.
 * @alimenta Controlador de seguimiento de cronogramas y vistas de auditoría docente.
 * @retorna Instancia Sequelize del modelo SeguimientoCronograma.
 */
const SeguimientoCronograma = sequelize.define('seguimiento_cronograma', {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  proyecto_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: { model: 'proyectos', key: 'id' }
  },
  materia_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: { model: 'materias', key: 'id' }
  },
  docente_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: { model: 'usuarios', key: 'id' }
  },
  fecha: {
    type: DataTypes.DATEONLY,
    allowNull: false,
    defaultValue: DataTypes.NOW
  },
  descripcion: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  realizado: {
    type: DataTypes.BOOLEAN,
    allowNull: false,
    defaultValue: false
  },
  devolucion_docente: {
    type: DataTypes.TEXT,
    allowNull: true
  }
}, {
  tableName: 'seguimientos_cronogramas',
  timestamps: true,
  underscored: true,
  createdAt: 'created_at',
  updatedAt: 'updated_at'
});

module.exports = SeguimientoCronograma;