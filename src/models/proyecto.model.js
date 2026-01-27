const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const Proyecto = sequelize.define('Proyecto', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    nombre: {
        type: DataTypes.STRING,
        allowNull: false
    },
    descripcion: {
        type: DataTypes.TEXT
    },
    // Simplificamos el estado: O está activo o es historia vieja.
    estado: {
        type: DataTypes.ENUM('ABIERTO', 'ARCHIVADO'),
        defaultValue: 'ABIERTO'
    }
}, {
    // Soft Delete: Si se borra, no desaparece, solo se oculta.
    paranoid: true, 
    underscored: true,
    tableName: 'proyectos'
});

module.exports = Proyecto;