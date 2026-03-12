const { sequelize } = require('../config/db');
const { DataTypes } = require('sequelize');

// Importación de modelos base
const Usuario = require('./usuario.model');
const Proyecto = require('./proyecto.model');
const Tarea = require('./tarea.model');
const Rol = require('./rol.model.js');
const EstadoProyecto = require('./estadoProyecto.model.js');
const UserStory = require('./userStory.model.js'); 
const Escuela = require('./escuela.model'); 
const Especialidad = require('./especialidad.model');
const Entregable = require('./entregable.model'); // NUEVO

// Importación de tablas maestras
const PrioridadUS = require('./prioridadUS.model.js');
const EstadoUS = require('./estadoUS.model.js');
const Prioridad = require('./prioridad.model')(sequelize, DataTypes);
const EstadoTarea = require('./estadoTarea.model.js')(sequelize, DataTypes);
const TipoTarea = require('./tipoTarea.model.js')(sequelize, DataTypes);

// --- NUEVO v1.2.0: Sugerencias ---
// Lo cargamos usando el mismo patrón que Prioridad o EstadoTarea
const Sugerencia = require("./sugerencia.model.js")(sequelize, DataTypes);

// --- RELACIONES SUGERENCIAS ---
// Una sugerencia pertenece a un autor (Docente/Admin)
Sugerencia.belongsTo(Usuario, {
  foreignKey: "usuario_id",
  as: "autor",
});

// Una sugerencia puede tener una respuesta de un admin
Sugerencia.belongsTo(Usuario, {
  foreignKey: "admin_id",
  as: "admin_que_respondio",
});

// --- RELACIÓN: USUARIO Y ESPECIALIDAD (1:N) ---
Usuario.belongsTo(Especialidad, { foreignKey: 'especialidad_id', as: 'especialidad_detalle' });
Especialidad.hasMany(Usuario, { foreignKey: 'especialidad_id' });

// --- RELACIÓN: USUARIOS Y ESCUELAS (N:M) ---
Usuario.belongsToMany(Escuela, { 
  through: 'usuario_escuelas', 
  as: 'escuelas', 
  foreignKey: 'usuario_id',
  otherKey: 'escuela_id',
  timestamps: false
});
Escuela.belongsToMany(Usuario, { 
  through: 'usuario_escuelas', 
  as: 'usuarios', 
  foreignKey: 'escuela_id',
  otherKey: 'usuario_id',
  timestamps: false
});

// --- RELACIONES USER STORY ---
UserStory.belongsTo(PrioridadUS, { foreignKey: 'prioridad_id', as: 'prioridad_detalle' });
UserStory.belongsTo(EstadoUS, { foreignKey: 'estado_id', as: 'estado_detalle' });
PrioridadUS.hasMany(UserStory, { foreignKey: 'prioridad_id' });
EstadoUS.hasMany(UserStory, { foreignKey: 'estado_id' });

// --- RELACIONES PROYECTO ---
Proyecto.belongsToMany(Usuario, { 
  through: 'proyectousuarios', 
  as: 'integrantes', 
  foreignKey: 'proyecto_id' 
});
Usuario.belongsToMany(Proyecto, { 
  through: 'proyectousuarios', 
  as: 'proyectosAsignados', 
  foreignKey: 'usuario_id' 
});

// --- RELACIONES USUARIO Y ROL ---
Usuario.belongsTo(Rol, { foreignKey: 'rol_id' });
Rol.hasMany(Usuario, { foreignKey: 'rol_id' });

Proyecto.belongsTo(EstadoProyecto, { foreignKey: 'estado_id' });
EstadoProyecto.hasMany(Proyecto, { foreignKey: 'estado_id' });

Usuario.hasMany(Proyecto, { foreignKey: 'docente_owner_id' });
Proyecto.belongsTo(Usuario, { foreignKey: 'docente_owner_id', as: 'owner' });

Proyecto.hasMany(UserStory, { foreignKey: 'proyecto_id', as: 'userStories' });
UserStory.belongsTo(Proyecto, { foreignKey: 'proyecto_id' });

// --- RELACIÓN PROYECTO Y ENTREGABLES (NUEVO) ---
Proyecto.hasMany(Entregable, { foreignKey: 'proyecto_id', as: 'entregables' });
Entregable.belongsTo(Proyecto, { foreignKey: 'proyecto_id' });

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

Proyecto.belongsTo(Escuela, { foreignKey: 'escuela_id' });
Escuela.hasMany(Proyecto, { foreignKey: 'escuela_id' });

// --- DEPENDENCIAS USER STORY (N:M Auto-referencial) ---
UserStory.belongsToMany(UserStory, { 
  through: 'us_dependencias', 
  as: 'predecesoras', 
  foreignKey: 'us_id', 
  otherKey: 'depende_de_us_id' 
});

UserStory.belongsToMany(UserStory, { 
  through: 'us_dependencias', 
  as: 'sucesoras', 
  foreignKey: 'depende_de_us_id', 
  otherKey: 'us_id' 
});

//  DEPENDENCIAS TAREAS (N:M Auto-referencial) ---
Tarea.belongsToMany(Tarea, { 
  through: 'tarea_dependencias', 
  as: 'requisitos', 
  foreignKey: 'tarea_id', 
  otherKey: 'depende_de_id',
  timestamps: false 
});


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
    EstadoUS,
    Escuela,
    Especialidad,
    Entregable,
    Sugerencia // Exportamos el nuevo modelo
};