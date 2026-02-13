const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');
const bcrypt = require('bcrypt');

const Usuario = sequelize.define('usuario', {
  nombre: { type: DataTypes.STRING, allowNull: false },
  apellido: { type: DataTypes.STRING, allowNull: false },
  email: { type: DataTypes.STRING, allowNull: false, unique: true },
  password_hash: { type: DataTypes.STRING, allowNull: false },
  rol_id: { type: DataTypes.INTEGER, allowNull: false },
  
  curso: { type: DataTypes.STRING },
  division: { type: DataTypes.STRING },
  telefono: { type: DataTypes.STRING },
  activo: { type: DataTypes.BOOLEAN, defaultValue: true }
}, 
{
  tableName: 'usuarios',
  timestamps: true,
  paranoid: true,
  createdAt: 'created_at',
  updatedAt: 'updated_at',
  deletedAt: 'deleted_at',
  
  hooks: {
    beforeCreate: async (usuario) => {
      if (usuario.password_hash) {
        const salt = await bcrypt.genSalt(10);
        usuario.password_hash = await bcrypt.hash(usuario.password_hash, salt);
      }
    },
    beforeUpdate: async (usuario) => {
      // Sequelize detecta si el campo cambió antes de hashear
      if (usuario.changed('password_hash')) {
        const salt = await bcrypt.genSalt(10);
        usuario.password_hash = await bcrypt.hash(usuario.password_hash, salt);
      }
    }
  }
});

module.exports = Usuario;