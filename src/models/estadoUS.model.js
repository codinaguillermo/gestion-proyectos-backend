const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const EstadoUS = sequelize.define('EstadoUS', {
    nombre: { 
        type: DataTypes.STRING, 
        allowNull: false 
    }
}, {
    tableName: 'estados_us', // El nombre exacto que pusimos en SQL
    timestamps: false,
    underscored: true
});

module.exports = EstadoUS;