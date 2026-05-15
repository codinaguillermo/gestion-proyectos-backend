/**
 * Modelo para la gestión de notas y recordatorios entre docentes.
 * Representa la tabla 'notas_docentes' en la BD.
 */
module.exports = (sequelize, DataTypes) => {
    const NotaDocente = sequelize.define("NotaDocente", {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true, // <--- CAMBIAR primary_key POR primaryKey (sin guion bajo)
            autoIncrement: true
        },
        titulo: {
            type: DataTypes.STRING(100),
            allowNull: false
        },
        descripcion: {
            type: DataTypes.STRING(250),
            allowNull: false
        },
        tipo: {
            type: DataTypes.ENUM('Recordatorio', 'Tarea', 'Aviso importante'),
            defaultValue: 'Recordatorio'
        },
        estado: {
            type: DataTypes.ENUM('PENDIENTE', 'TERMINADA'),
            defaultValue: 'PENDIENTE'
        },
        proyecto_id: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        creador_id: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        destino_id: {
            type: DataTypes.INTEGER,
            allowNull: false
        }
    }, {
        tableName: 'notas_docentes',
        timestamps: true,
        underscored: true,
        createdAt: 'created_at',
        updatedAt: false
    });

    return NotaDocente;
};