const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const TipoUs = sequelize.define('TipoUs', {
  nombre: { type: DataTypes.STRING, allowNull: false }
}, {
  tableName: 'tipo_us',
  timestamps: false
});

module.exports = TipoUs;