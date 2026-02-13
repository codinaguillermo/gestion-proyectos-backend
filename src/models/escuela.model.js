const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const Escuela = sequelize.define('escuela', {
  nombre_corto: { 
    type: DataTypes.STRING, 
    allowNull: false,
    unique: true 
  },
  nombre_largo: { 
    type: DataTypes.STRING, 
    allowNull: false 
  },
  cue: { type: DataTypes.STRING },
  direccion: { type: DataTypes.STRING }
}, {
  tableName: 'escuelas',
  timestamps: true,
  // Sequelize usa camelCase internamente, mapeamos a los nombres de tu SQL:
  createdAt: 'created_at',
  updatedAt: 'updated_at' // <--- Corregido: la clave debe ser updatedAt
});

module.exports = Escuela;