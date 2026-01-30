const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const Proyecto = sequelize.define('proyecto', {
  // id no hace falta ponerlo, Sequelize lo asume
  nombre: { 
    type: DataTypes.STRING, 
    allowNull: false 
  },
  descripcion: { 
    type: DataTypes.TEXT 
  },  
  // Usamos el nombre exacto de tu SQL: 'estado_id'
  estado_id: { 
    type: DataTypes.INTEGER,
    references: {
      model: 'estados_proyecto',
      key: 'id'
    }
  },
  docente_owner_id: { 
    type: DataTypes.INTEGER 
  }
}, {
  tableName: 'proyectos',
  timestamps: true,
  paranoid: true, // Coincide con tu deleted_at del SQL
  underscored: true, 
  createdAt: 'created_at',
  updatedAt: 'updated_at',
  deletedAt: 'deleted_at'
});

module.exports = Proyecto;