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
        type: DataTypes.TEXT,
        allowNull: true
    },
    horas_estimadas: { 
        type: DataTypes.DECIMAL(12, 2),
        defaultValue: 0.00
    },
    // --- LLAVES FORÁNEAS (Relaciones) ---
    proyecto_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: { model: 'proyectos', key: 'id' }
    },
    usId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        field: 'us_id', 
        references: { model: 'user_stories', key: 'id' }
    },
    tipo_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: { model: 'tipo_tareas', key: 'id' }
    },
    prioridad_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: { model: 'prioridades', key: 'id' }
    },
    estado_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: { model: 'estado_tareas', key: 'id' }
    },
    responsable_id: {
        type: DataTypes.INTEGER,
        allowNull: true,
        references: { model: 'usuarios', key: 'id' }
    },
    padre_id: {
        type: DataTypes.INTEGER,
        allowNull: true,
        references: { model: 'tareas', key: 'id' }
    },
    // --- CAMPOS DE SEGUIMIENTO ---
    horasReales: {
        type: DataTypes.DECIMAL(10, 2),
        defaultValue: 0.00,
        field: 'horas_reales'
    },
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
    // --- CHECKLIST DE CALIDAD ---
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
    criteriosAceptacion: {
        type: DataTypes.TEXT,
        allowNull: true,
        field: 'criterios_aceptacion'
    },
    comentarioCierre: {
        type: DataTypes.TEXT,
        allowNull: true,
        field: 'comentario_cierre'
    },
    linkEvidencia: {
        type: DataTypes.STRING(255),
        allowNull: true,
        field: 'link_evidencia'
    }
}, {
    tableName: 'tareas',
    underscored: true, 
    timestamps: true,
    paranoid: true,         // Habilita el borrado lógico
    deletedAt: 'deleted_at' // Fuerza el mapeo con la columna de tu SQL
});

module.exports = Tarea;