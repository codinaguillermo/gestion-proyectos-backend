const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

/**
 * @modelo HistorialTarea
 * @propósito Mapear la tabla historial_tareas para registrar cada evento de guardado y cambio de estado de una tarea técnica.
 * @alimenta Al controlador de tareas (tarea.controller.js) al momento de crear o actualizar una tarea, y a la vista TareaDetailView.vue para renderizar el acordeón de trazabilidad.
 * @retorna Instancia Sequelize del modelo HistorialTarea con los campos id, tarea_id, usuario_id, estado_id y fecha_registro.
 */
const HistorialTarea = sequelize.define('HistorialTarea', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    tarea_id: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    usuario_id: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    estado_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false
    },
    fecha_registro: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW
    }
}, {
    tableName: 'historial_tareas',
    timestamps: false,
    underscored: true
});

module.exports = HistorialTarea;