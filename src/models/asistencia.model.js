const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

/**
 * asistencia.model.js
 * Propósito: Definir la estructura de la entidad de asistencias en la base de datos, funcionando como una captura histórica (snapshot) inmutable del presentismo de un alumno en una materia, fecha, escuela y curso específicos.
 * A quién alimenta (quién la llama): Invocada por Sequelize ORM en la carga inicial (index de modelos para establecer asociaciones) y alimentará a los futuros controladores de registro y reportes de presentismo.
 * Datos que retorna: Instancia del modelo Sequelize 'asistencia'.
 */
const Asistencia = sequelize.define('asistencia', {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
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
  materia_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: { model: 'materias', key: 'id' }
  },
  escuela_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: { model: 'escuelas', key: 'id' }
  },
  curso: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  division: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  fecha: {
    type: DataTypes.DATEONLY, // Sequelize mapea DATEONLY al tipo DATE físico de SQL
    allowNull: false
  },
  presente: {
    type: DataTypes.BOOLEAN,
    allowNull: false,
    defaultValue: true
  }
}, {
  tableName: 'asistencias',
  timestamps: true,
  underscored: true,
  createdAt: 'created_at',
  updatedAt: 'updated_at',
  indexes: [
    {
      unique: true,
      name: 'uidx_asistencia_diaria',
      fields: ['alumno_id', 'materia_id', 'fecha']
    }
  ]
});

module.exports = Asistencia;