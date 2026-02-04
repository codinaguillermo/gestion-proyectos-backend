const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const PrioridadUS = sequelize.define('PrioridadUS', {
    nombre: { 
        type: DataTypes.STRING, 
        allowNull: false 
    },
    peso: { 
        type: DataTypes.INTEGER, 
        defaultValue: 0 
    }
}, {
    tableName: 'prioridades_us', // El nombre exacto que pusimos en SQL
    timestamps: false,
    underscored: true
});

module.exports = PrioridadUS;