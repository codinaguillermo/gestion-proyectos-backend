const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const Especialidad = sequelize.define('especialidad', {
  nombre: { 
    type: DataTypes.STRING, 
    allowNull: false 
  },
  descripcion: { 
    type: DataTypes.STRING, 
    allowNull: true 
  }
}, {
  tableName: 'especialidades',
  timestamps: false
});

module.exports = Especialidad;