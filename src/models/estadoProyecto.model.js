const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const EstadoProyecto = sequelize.define('estado_proyecto', {
  nombre: { type: DataTypes.STRING, allowNull: false, unique: true }
}, {
  tableName: 'estados_proyecto',
  timestamps: false
});

module.exports = EstadoProyecto;