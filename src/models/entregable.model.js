const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const Entregable = sequelize.define('Entregable', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    proyecto_id: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    nombre: {
        type: DataTypes.STRING,
        allowNull: false
    },
    link_drive: {
        type: DataTypes.STRING,
        defaultValue: ''
    },
    entregado: {
        type: DataTypes.BOOLEAN,
        defaultValue: false
    },
    aprobado: {
        type: DataTypes.BOOLEAN,
        defaultValue: false
    }
}, {
    tableName: 'Entregables',
    timestamps: true,
    paranoid: true,
    // Forzamos los nombres exactos de tu base de datos (CamelCase)
    createdAt: 'createdAt',
    updatedAt: 'updatedAt',
    deletedAt: 'deletedAt',
    underscored: false 
});

module.exports = Entregable;
