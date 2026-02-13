const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const Proyecto = sequelize.define('proyecto', {
  nombre: { 
    type: DataTypes.STRING, 
    allowNull: false 
  },
  descripcion: { 
    type: DataTypes.TEXT 
  },   
  estado_id: { 
    type: DataTypes.INTEGER,
    references: {
      model: 'estados_proyecto',
      key: 'id'
    }
  },
  docente_owner_id: { 
    type: DataTypes.INTEGER 
  },
  // NUEVO CAMPO: Para vincular el proyecto a una escuela específica
  escuela_id: {
    type: DataTypes.INTEGER,
    allowNull: true, // Lo dejamos opcional por si hay proyectos globales, pero Alejandra lo usará siempre
    references: {
      model: 'escuelas',
      key: 'id'
    }
  }
}, {
  tableName: 'proyectos',
  timestamps: true,
  paranoid: true, 
  underscored: true, 
  createdAt: 'created_at',
  updatedAt: 'updated_at',
  deletedAt: 'deleted_at'
});

module.exports = Proyecto;