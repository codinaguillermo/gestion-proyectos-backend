const { sequelize } = require('../config/db');
const Usuario = require('./usuario.model');
const Proyecto = require('./proyecto.model');
const Tarea = require('./tarea.model');

// --- 1. RELACIÓN USUARIO - PROYECTO ---
Usuario.hasMany(Proyecto, { foreignKey: 'docente_owner_id' });
Proyecto.belongsTo(Usuario, { foreignKey: 'docente_owner_id', as: 'owner' });

// --- 2. RELACIÓN PROYECTO - TAREA ---
// Quitamos 'onDelete: CASCADE' para evitar borrados físicos accidentales.
// La integridad la manejaremos nosotros con lógica.
Proyecto.hasMany(Tarea, { foreignKey: 'proyecto_id' });
Tarea.belongsTo(Proyecto, { foreignKey: 'proyecto_id' });

// --- 3. RELACIÓN USUARIO - TAREA (Responsable) ---
Usuario.hasMany(Tarea, { foreignKey: 'responsable_id' });
Tarea.belongsTo(Usuario, { foreignKey: 'responsable_id', as: 'responsable' });

// --- 4. RELACIÓN TAREA - TAREA (Jerarquía) ---
Tarea.hasMany(Tarea, { as: 'subtareas', foreignKey: 'padre_id' });
Tarea.belongsTo(Tarea, { as: 'padre', foreignKey: 'padre_id' });

module.exports = {
    sequelize,
    Usuario,
    Proyecto,
    Tarea
};