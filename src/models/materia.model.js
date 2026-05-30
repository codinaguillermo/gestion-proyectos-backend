const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

/**
 * @modelo Materia
 * @propósito Mapear la tabla maestra de asignaturas curriculares vinculadas a las especialidades técnicas.
 * @comentario Mantiene integridad referencial 1:N con la tabla de especialidades.
 * @alimenta index.js (Asociaciones), seguimiento.model.js y los select/filtros del frontend.
 */
const Materia = sequelize.define('materia', {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  especialidad_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    comment: 'Vinculación obligatoria con la especialidad técnica (ej. TEP ID=2)',
    references: { model: 'especialidades', key: 'id' }
  },
  nombre: {
    type: DataTypes.STRING(150),
    allowNull: false,
    comment: 'Nombre oficial de la asignatura curricular'
  }
}, {
  // Sincronización exacta con los nombres e índices físicos de producción
  tableName: 'materias',
  timestamps: true,
  underscored: true,
  createdAt: 'created_at',
  updatedAt: 'updated_at',
  indexes: [
    {
      unique: true,
      name: 'uidx_materia_especialidad',
      fields: ['especialidad_id', 'nombre']
    }
  ]
});

module.exports = Materia;