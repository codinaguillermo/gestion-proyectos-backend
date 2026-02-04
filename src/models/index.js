const { sequelize } = require('../config/db');
const { DataTypes } = require('sequelize');

// Importación de modelos base
const Usuario = require('./usuario.model');
const Proyecto = require('./proyecto.model');
const Tarea = require('./tarea.model');
const Rol = require('./rol.model.js');
const EstadoProyecto = require('./estadoProyecto.model.js');
const UserStory = require('./userStory.model.js'); 

// Importación de tablas maestras (Asegúrate de que los archivos existan)
const PrioridadUS = require('./prioridadUS.model.js');
const EstadoUS = require('./estadoUS.model.js');
const Prioridad = require('./prioridad.model')(sequelize, DataTypes);
const EstadoTarea = require('./estadoTarea.model.js')(sequelize, DataTypes);
const TipoTarea = require('./tipoTarea.model.js')(sequelize, DataTypes);

// --- RELACIONES USER STORY (Prioridad y Estado) ---
UserStory.belongsTo(PrioridadUS, { foreignKey: 'prioridad_id', as: 'prioridad_detalle' });
UserStory.belongsTo(EstadoUS, { foreignKey: 'estado_id', as: 'estado_detalle' });
PrioridadUS.hasMany(UserStory, { foreignKey: 'prioridad_id' });
EstadoUS.hasMany(UserStory, { foreignKey: 'estado_id' });

// --- RELACIONES PROYECTO ---
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

Proyecto.belongsTo(EstadoProyecto, { foreignKey: 'estado_id' });
EstadoProyecto.hasMany(Proyecto, { foreignKey: 'estado_id' });

Usuario.hasMany(Proyecto, { foreignKey: 'docente_owner_id' });
Proyecto.belongsTo(Usuario, { foreignKey: 'docente_owner_id', as: 'owner' });

Proyecto.hasMany(UserStory, { foreignKey: 'proyecto_id', as: 'userStories' });
UserStory.belongsTo(Proyecto, { foreignKey: 'proyecto_id' });

// --- RELACIONES TAREAS ---
UserStory.hasMany(Tarea, { foreignKey: 'us_id', as: 'tareas' });
Tarea.belongsTo(UserStory, { foreignKey: 'us_id', as: 'userStory' });

Proyecto.hasMany(Tarea, { foreignKey: 'proyecto_id' });
Tarea.belongsTo(Proyecto, { foreignKey: 'proyecto_id' });

Usuario.hasMany(Tarea, { foreignKey: 'responsable_id' });
Tarea.belongsTo(Usuario, { foreignKey: 'responsable_id', as: 'responsable' });

Tarea.belongsTo(Prioridad, { foreignKey: 'prioridad_id', as: 'prioridad_detalle' });
Tarea.belongsTo(EstadoTarea, { foreignKey: 'estado_id', as: 'estado_detalle' });
Tarea.belongsTo(TipoTarea, { foreignKey: 'tipo_id', as: 'tipo_detalle' });

module.exports = {
    sequelize,
    Usuario,
    Proyecto,
    Tarea,
    UserStory,
    Rol,
    EstadoProyecto,
    Prioridad,
    EstadoTarea,
    TipoTarea,
    PrioridadUS,
    EstadoUS
};