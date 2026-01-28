const { sequelize } = require('../config/db');
const Usuario = require('./usuario.model');
const Proyecto = require('./proyecto.model');
const Tarea = require('./tarea.model');
const Rol = require('./rol');
const EstadoProyecto = require('./estadoProyecto');

// --- 1. RELACIÓN USUARIO - ROL (Normalización) ---
Usuario.belongsTo(Rol, { foreignKey: 'rol_id' });
Rol.hasMany(Usuario, { foreignKey: 'rol_id' });

// --- 2. RELACIÓN PROYECTO - ESTADO (Evitamos Hardcode) ---
Proyecto.belongsTo(EstadoProyecto, { foreignKey: 'estado_id' });
EstadoProyecto.hasMany(Proyecto, { foreignKey: 'estado_id' });

// --- 3. RELACIÓN USUARIO - PROYECTO (Owner) ---
Usuario.hasMany(Proyecto, { foreignKey: 'docente_owner_id' });
Proyecto.belongsTo(Usuario, { foreignKey: 'docente_owner_id', as: 'owner' });

// --- 4. RELACIÓN PROYECTO - TAREA ---
Proyecto.hasMany(Tarea, { foreignKey: 'proyecto_id' });
Tarea.belongsTo(Proyecto, { foreignKey: 'proyecto_id' });

// --- 5. RELACIÓN USUARIO - TAREA (Responsable) ---
Usuario.hasMany(Tarea, { foreignKey: 'responsable_id' });
Tarea.belongsTo(Usuario, { foreignKey: 'responsable_id', as: 'responsable' });

// --- 6. RELACIÓN TAREA - TAREA (Jerarquía/Subtareas) ---
Tarea.hasMany(Tarea, { as: 'subtareas', foreignKey: 'padre_id' });
Tarea.belongsTo(Tarea, { as: 'padre', foreignKey: 'padre_id' });

// EXPORTACIÓN ÚNICA (Para no pisar los modelos)
module.exports = {
    sequelize,
    Usuario,
    Proyecto,
    Tarea,
    Rol,
    EstadoProyecto
};