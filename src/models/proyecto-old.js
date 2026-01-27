const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Proyecto = sequelize.define('proyecto', {
  nombre: { type: DataTypes.STRING, allowNull: false },
  descripcion: { type: DataTypes.TEXT },
  docente_owner_id: { type: DataTypes.INTEGER, allowNull: false },
  estado: { 
    type: DataTypes.ENUM('PLANIFICACION', 'ACTIVO', 'PAUSADO', 'FINALIZADO'),
    defaultValue: 'PLANIFICACION'
  }
}, {
  tableName: 'proyectos',
  timestamps: true,
  paranoid: true,  // <--- Importante para no perder proyectos borrados
  createdAt: 'created_at',
  updatedAt: 'updated_at',
  deletedAt: 'deleted_at'
});

module.exports = Proyecto;