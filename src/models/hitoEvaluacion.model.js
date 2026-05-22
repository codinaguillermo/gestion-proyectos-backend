const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

/**
 * Propósito: Mapear la tabla maestra física 'hitos_evaluacion' existente en MySQL.
 * Quién la alimenta: Indexada centralmente por src/models/index.js para interactuar con controladores.
 * Qué datos retorna: Instancia del modelo Sequelize HitoEvaluacion.
 */
const HitoEvaluacion = sequelize.define('HitoEvaluacion', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
    },
    nombre: {
        type: DataTypes.STRING(100),
        allowNull: false
    },
    created_at: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW
    },
    updated_at: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW
    }
}, {
    tableName: 'hitos_evaluacion',
    timestamps: true,
    underscored: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at'
});

module.exports = HitoEvaluacion;