const { sequelize } = require('../config/db');
const { DataTypes } = require('sequelize');

const Usuario = require('./usuario.model');
const Proyecto = require('./proyecto.model');
const Tarea = require('./tarea.model');
const Rol = require('./rol');
const EstadoProyecto = require('./estadoProyecto');
// 1. IMPORTAMOS EL NUEVO MODELO
const UserStory = require('./userStory'); 

// --- NUEVOS MODELOS (Mesa de diseño) ---
const Prioridad = require('./prioridad.model')(sequelize, DataTypes);
const EstadoTarea = require('./estadoTarea.model.js')(sequelize, DataTypes);
const TipoTarea = require('./tipoTarea.model.js')(sequelize, DataTypes);

// RELACIONES EXISTENTES
Proyecto.belongsToMany(Usuario, { 
  through: 'ProyectoUsuarios', 
  as: 'integrantes', 
  foreignKey: 'proyecto_id' 
});

Usuario.belongsToMany(Proyecto, { 
  through: 'ProyectoUsuarios', 
  as: 'proyectosAsignados', 
  foreignKey: 'usuario_id' 
});

Usuario.belongsTo(Rol, { foreignKey: 'rol_id' });
Rol.hasMany(Usuario, { foreignKey: 'rol_id' });

Proyecto.belongsTo(EstadoProyecto, { foreignKey: 'estado_id' });
EstadoProyecto.hasMany(Proyecto, { foreignKey: 'estado_id' });

Usuario.hasMany(Proyecto, { foreignKey: 'docente_owner_id' });
Proyecto.belongsTo(Usuario, { foreignKey: 'docente_owner_id', as: 'owner' });

// --- 2. NUEVA JERARQUÍA: PROYECTO -> USER STORY ---
Proyecto.hasMany(UserStory, { foreignKey: 'proyecto_id', as: 'userStories' });
UserStory.belongsTo(Proyecto, { foreignKey: 'proyecto_id' });

// --- 3. NUEVA JERARQUÍA: USER STORY -> TAREA ---
UserStory.hasMany(Tarea, { foreignKey: 'us_id', as: 'tareas' });
Tarea.belongsTo(UserStory, { foreignKey: 'us_id', as: 'userStory' });

// MANTENEMOS TUS RELACIONES DE TAREA
Proyecto.hasMany(Tarea, { foreignKey: 'proyecto_id' });
Tarea.belongsTo(Proyecto, { foreignKey: 'proyecto_id' });

Usuario.hasMany(Tarea, { foreignKey: 'responsable_id' });
Tarea.belongsTo(Usuario, { foreignKey: 'responsable_id', as: 'responsable' });

Tarea.hasMany(Tarea, { as: 'subtareas', foreignKey: 'padre_id' });
Tarea.belongsTo(Tarea, { as: 'padre', foreignKey: 'padre_id' });

Tarea.belongsTo(Prioridad, { foreignKey: 'prioridad_id', as: 'prioridad_detalle' });
Tarea.belongsTo(EstadoTarea, { foreignKey: 'estado_id', as: 'estado_detalle' });
Tarea.belongsTo(TipoTarea, { foreignKey: 'tipo_id', as: 'tipo_detalle' });

// EXPORTACIÓN ACTUALIZADA
module.exports = {
    sequelize,
    Usuario,
    Proyecto,
    Tarea,
    UserStory, // Agregado a la exportación
    Rol,
    EstadoProyecto,
    Prioridad,
    EstadoTarea,
    TipoTarea
};