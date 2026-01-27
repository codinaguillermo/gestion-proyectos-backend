const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const Usuario = sequelize.define('usuario', {
  nombre: { type: DataTypes.STRING, allowNull: false },
  email: { type: DataTypes.STRING, allowNull: false, unique: true },
  password_hash: { type: DataTypes.STRING, allowNull: false },
  rol_id: { type: DataTypes.INTEGER, allowNull: false },
  activo: { type: DataTypes.BOOLEAN, defaultValue: true }
}, {
  tableName: 'usuarios',
  timestamps: true, // Activa created_at y updated_at
  paranoid: true,   // <--- ESTO ACTIVA EL BORRADO LÓGICO (Soft Delete)
  createdAt: 'created_at',
  updatedAt: 'updated_at',
  deletedAt: 'deleted_at' // Le decimos que use nuestra columna 'deleted_at'
});

module.exports = Usuario;

