const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const Rol = sequelize.define('rol', {
  nombre: { 
    type: DataTypes.STRING, 
    allowNull: false,
    unique: true 
  },
  ver_todo: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
    field: 'ver_todo' // <-- Esto le dice a Sequelize: "buscá exactamente este nombre en la tabla"
}
}, {
  tableName: 'roles',
  timestamps: false 
});

module.exports = Rol;