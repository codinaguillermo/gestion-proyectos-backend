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
    // JERARQUÍA: Define si es una caja grande (EPIC) o una tuerca (TASK)
    tipo: {
        type: DataTypes.ENUM('EPIC', 'STORY', 'TASK', 'BUG'),
        allowNull: false,
        defaultValue: 'TASK'
    },
    // ORDEN: Para saber qué agarrar primero
    prioridad: {
        type: DataTypes.ENUM('ALTA', 'MEDIA', 'BAJA'),
        defaultValue: 'MEDIA'
    },
    // WORKFLOW: Tu tablero Kanban
    estado: {
        type: DataTypes.ENUM('BACKLOG', 'TODO', 'IN_PROGRESS', 'BLOCKED', 'DONE'),
        defaultValue: 'BACKLOG'
    },
    // AUDITORÍA: Datos que se llenarán automáticamente por lógica
    fecha_inicio_real: {
        type: DataTypes.DATE,
        allowNull: true 
    },
    fecha_fin_real: {
        type: DataTypes.DATE,
        allowNull: true 
    },
    // CONTROL: El "peaje" obligatorio para mover tarjetas
    horas_dedicadas: {
        type: DataTypes.DECIMAL(10, 2), // Ejemplo: 2.50 horas
        defaultValue: 0
    }
}, {
    paranoid: true, // Soft Delete (Papelera de reciclaje)
    underscored: true,
    tableName: 'tareas'
});

module.exports = Tarea;