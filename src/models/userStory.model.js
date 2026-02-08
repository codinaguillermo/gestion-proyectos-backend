const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db'); // Importación corregida con llaves

const UserStory = sequelize.define('UserStory', {
    titulo: { 
        type: DataTypes.STRING, 
        allowNull: false 
    },
    descripcion: { 
        type: DataTypes.TEXT 
    },
    //prioridad: {         type: DataTypes.ENUM('ALTA', 'MEDIA', 'BAJA'),         defaultValue: 'MEDIA'     },
    //estado: {         type: DataTypes.ENUM('PENDIENTE', 'EN_PROCESO', 'TERMINADO'),         defaultValue: 'PENDIENTE'     },
    fecha_inicio: { 
        type: DataTypes.DATE 
    },
    fecha_fin: { 
        type: DataTypes.DATE 
    },
    prioridad_id: { type: DataTypes.INTEGER },
    estado_id: { type: DataTypes.INTEGER },
    proyecto_id: { type: DataTypes.INTEGER },
    condiciones: {
        type: DataTypes.TEXT,
        allowNull: true
    }
}, {
    tableName: 'user_stories',
    underscored: true,
    timestamps: true,
    paranoid: true,          // Habilita el borrado lógico
    deletedAt: 'deleted_at'  // Le indica a Sequelize el nombre real de tu columna
});

module.exports = UserStory;