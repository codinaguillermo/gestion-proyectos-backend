const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const Tarea = sequelize.define('Tarea', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    titulo: {
        type: DataTypes.STRING,
        allowNull: false
    },
    descripcion: {
        type: DataTypes.TEXT
    },
    /* OJO: Comentamos estos porque ahora usamos tipo_id, prioridad_id y estado_id 
       que vienen de las tablas maestras en la base de datos. 
    */
    // tipo: { ... }, 
    // prioridad: { ... },
    // estado: { ... },

    fechaInicioReal: {
        type: DataTypes.DATE,
        allowNull: true,
        field: 'fecha_inicio_real'
    },
    fechaFinReal: {
        type: DataTypes.DATE,
        allowNull: true,
        field: 'fecha_fin_real'
    },
    horasReales: {
        type: DataTypes.DECIMAL(10, 2),
        defaultValue: 0,
        field: 'horas_reales'
    },
    cumpleAceptacion: {
        type: DataTypes.BOOLEAN,
        defaultValue: false,
        field: 'cumple_aceptacion'
    },
    testeado: {
        type: DataTypes.BOOLEAN,
        defaultValue: false,
        field: 'testeado'
    },
    documentado: {
        type: DataTypes.BOOLEAN,
        defaultValue: false,
        field: 'documentado'
    },
    utilizable: {
        type: DataTypes.BOOLEAN,
        defaultValue: false,
        field: 'utilizable'
    },
    usId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        field: 'us_id',
        references: {
            model: 'user_stories',
            key: 'id'
        }
    }
}, {
    paranoid: true,
    underscored: true,
    tableName: 'tareas'
});

module.exports = Tarea;