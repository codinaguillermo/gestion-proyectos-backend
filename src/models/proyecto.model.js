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
  escuela_id: {
    type: DataTypes.INTEGER,
    allowNull: true,
    references: {
      model: 'escuelas',
      key: 'id'
    },    
  },

  /* --- CAMPOS DE IDENTIDAD ESTRATÉGICA --- */
  
  // 1. Objetivo General
  objetivo: {
    type: DataTypes.TEXT,
    allowNull: true
  },
  objetivoBloqueado: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
    field: 'objetivo_bloqueado' // Sincronizado con el ALTER TABLE que hicimos
  },

  // 2. Alcance del Prototipo (Entrega Real)
  alcancePrototipo: {
    type: DataTypes.TEXT,
    allowNull: true,
    field: 'alcance_prototipo'
  },
  alcancePrototipoBloqueado: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
    field: 'alcance_prototipo_bloqueado'
  },

  // 3. Alcance Producto Final (Visión Comercial)
  alcanceFinal: {
    type: DataTypes.TEXT,
    allowNull: true,
    field: 'alcance_producto_final'
  },
  alcanceFinalBloqueado: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
    field: 'alcance_final_bloqueado'
  },
  fecha_cierre_1: {
    type: DataTypes.DATEONLY, // Usamos DATEONLY para manejar YYYY-MM-DD sin hora
    allowNull: true
  },
  fecha_cierre_2: {
    type: DataTypes.DATEONLY,
    allowNull: true
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