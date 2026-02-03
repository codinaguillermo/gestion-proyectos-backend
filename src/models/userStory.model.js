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
    prioridad: { 
        type: DataTypes.ENUM('ALTA', 'MEDIA', 'BAJA'), 
        defaultValue: 'MEDIA' 
    },
    estado: { 
        type: DataTypes.ENUM('PENDIENTE', 'EN_PROCESO', 'TERMINADO'), 
        defaultValue: 'PENDIENTE' 
    },
    fecha_inicio: { 
        type: DataTypes.DATE 
    },
    fecha_fin: { 
        type: DataTypes.DATE 
    }
}, {
    tableName: 'user_stories',
    underscored: true,
    timestamps: true
});

module.exports = UserStory;