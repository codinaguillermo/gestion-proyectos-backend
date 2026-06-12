const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

/**
 * Propósito: Mapear la tabla operativa histórica 'calificaciones_proyecto' existente en MySQL.
 * Quién la alimenta: Indexada centralmente por src/models/index.js para el almacenamiento de notas grupales (hitos).
 * Qué datos retorna: Instancia del modelo Sequelize CalificacionProyecto.
 */
const CalificacionProyecto = sequelize.define('CalificacionProyecto', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
    },
    proyecto_id: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    hito_id: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    usuario_id: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    nota: {
        type: DataTypes.DECIMAL(4, 2),
        allowNull: false
    },
    descripcion: {
        type: DataTypes.TEXT,
        allowNull: true
    },
    fecha: {
        // CORRECCIÓN: Usamos DATEONLY para evitar saltos de zona horaria al cargar fechas manuales
        type: DataTypes.DATEONLY, 
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
    tableName: 'calificaciones_proyecto',
    timestamps: true,
    underscored: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at'
});

module.exports = CalificacionProyecto;