// src/models/proyecto.model.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/db'); // OJO: Asegúrate que esta ruta esté bien, a veces es ../config/db

const Proyecto = sequelize.define('Proyecto', {
  nombre: { 
      type: DataTypes.STRING, 
      allowNull: false 
  },
  descripcion: { 
      type: DataTypes.TEXT 
  },
  // ME GUSTA ESTO: Definimos explícitamente la clave foránea aquí.
  // Al estilo "vieja escuela", para que sepas que la columna existe.
  docente_owner_id: { 
      type: DataTypes.INTEGER, 
      allowNull: false 
  },
  estado: { 
    type: DataTypes.ENUM('PLANIFICACION', 'ACTIVO', 'PAUSADO', 'FINALIZADO'),
    defaultValue: 'PLANIFICACION'
  }
}, {
  tableName: 'proyectos',
  timestamps: true,
  paranoid: true,  // <--- Soft Delete: No borra el registro, solo le pone fecha de borrado
  
  // Mapeamos los nombres de Sequelize a nombres de tabla más "SQL estándar"
  createdAt: 'created_at',
  updatedAt: 'updated_at',
  deletedAt: 'deleted_at'
});

module.exports = Proyecto;