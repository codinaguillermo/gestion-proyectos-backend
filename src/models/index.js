const { sequelize } = require('../config/db');
const { DataTypes } = require('sequelize');

// Importación de modelos base
const Usuario = require('./usuario.model');
const Proyecto = require('./proyecto.model');
const Tarea = require('./tarea.model');
const Rol = require('./rol.model.js');
const EstadoProyecto = require('./estadoProyecto.model.js');
const UserStory = require('./userStory.model.js'); 
const TipoUs = require('./tipoUs.model');
const Escuela = require('./escuela.model'); 
const Especialidad = require('./especialidad.model');
const Entregable = require('./entregable.model'); 

// NUEVOS MODELOS v2.6.0: Entidades para el seguimiento de calificaciones académicas
const HitoEvaluacion = require('./hitoEvaluacion.model');
const CalificacionProyecto = require('./calificacionProyecto.model');

// NUEVO MODELO v2.7.0: Entidad para el desglose curricular por especialidad
const Materia = require('./materia.model');

// Importación de tablas maestras
const PrioridadUS = require('./prioridadUS.model.js');
const EstadoUS = require('./estadoUS.model.js');
const Prioridad = require('./prioridad.model')(sequelize, DataTypes);
const EstadoTarea = require('./estadoTarea.model.js')(sequelize, DataTypes);
const TipoTarea = require('./tipoTarea.model.js')(sequelize, DataTypes);
const Seguimiento = require('./seguimiento.model'); 
const NotaDocente = require("./notaDocente.model.js")(sequelize, DataTypes);

// --- NUEVO v1.2.0: Sugerencias para mejoras de GEPRES ---
const Sugerencia = require("./sugerencia.model.js")(sequelize, DataTypes);

// --- RELACIONES SUGERENCIAS ---
Sugerencia.belongsTo(Usuario, {
  foreignKey: "usuario_id",
  as: "autor",
});

Sugerencia.belongsTo(Usuario, {
  foreignKey: "admin_id",
  as: "admin_que_respondio",
});

// --- RELACIÓN: USUARIO Y ESPECIALIDAD (1:N) ---
Usuario.belongsTo(Especialidad, { foreignKey: 'especialidad_id', as: 'especialidad_detalle' });
Especialidad.hasMany(Usuario, { foreignKey: 'especialidad_id' });

// --- RELACIONES NUEVAS v2.7.0: MATERIAS Y ESPECIALIDADES (1:N) ---
/**
 * Propósito: Vincular curricularmente las materias con su respectiva especialidad técnica.
 * Quién la alimenta: Invocado por controladores de configuración para poblar selects del frontend según el track del proyecto.
 * Qué datos retorna: Relación de pertenencia 1:N (Una especialidad contiene muchas materias).
 */
Materia.belongsTo(Especialidad, { foreignKey: 'especialidad_id', as: 'especialidad' });
Especialidad.hasMany(Materia, { foreignKey: 'especialidad_id', as: 'materias' });

// --- RELACIONES REESTRUCTURADAS v2.7.0: SEGUIMIENTO DE ALUMNOS ---
/**
 * Propósito: Vincular las observaciones pedagógicas individuales con una materia del diseño curricular.
 * Quién la alimenta: Invocada por el controlador al crear o listar seguimientos cualitativos de un alumno.
 * Qué datos retorna: Relación de pertenencia 1:1 (Cada registro de seguimiento corresponde a una única materia).
 */
Seguimiento.belongsTo(Materia, { foreignKey: 'materia_id', as: 'materia' });
Materia.hasMany(Seguimiento, { foreignKey: 'materia_id', as: 'seguimientosAsociados' });

// --- RELACIONES USUARIOS Y ESCUELAS (N:M) ---
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
UserStory.belongsTo(TipoUs, { foreignKey: 'tipo_us_id', as: 'tipo' });
PrioridadUS.hasMany(UserStory, { foreignKey: 'prioridad_id' });
EstadoUS.hasMany(UserStory, { foreignKey: 'estado_id' });
TipoUs.hasMany(UserStory, { foreignKey: 'tipo_us_id' });

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

// --- RELACIÓN PROYECTO Y ENTREGABLES ---
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

NotaDocente.belongsTo(Proyecto, { foreignKey: 'proyecto_id', as: 'proyecto' });
NotaDocente.belongsTo(Usuario, { foreignKey: 'creador_id', as: 'creador' });
NotaDocente.belongsTo(Usuario, { foreignKey: 'destino_id', as: 'destinatario' });

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

// --- RELACIONES DE SEGUIMIENTO (Adaptados conceptualmente a seguimientos_alumnos) ---
Seguimiento.belongsTo(Proyecto, { foreignKey: 'proyecto_id', as: 'proyecto' });
Proyecto.hasMany(Seguimiento, { foreignKey: 'proyecto_id', as: 'seguimientos' });

Seguimiento.belongsTo(Usuario, { foreignKey: 'alumno_id', as: 'alumno' });
Usuario.hasMany(Seguimiento, { foreignKey: 'alumno_id', as: 'seguimientosRecibidos' });

Seguimiento.belongsTo(Usuario, { foreignKey: 'docente_id', as: 'docente' });
Usuario.hasMany(Seguimiento, { foreignKey: 'docente_id', as: 'seguimientosRealizados' });

/**
 * Propósito: Vincular las calificaciones históricas con el Proyecto evaluado.
 * Quién la alimenta: Invocada por controladores al listar o añadir notas a un proyecto.
 * Qué datos retorna: Relación de pertenencia 1:N (Un proyecto tiene muchas calificaciones).
 */
CalificacionProyecto.belongsTo(Proyecto, { foreignKey: 'proyecto_id', as: 'proyecto' });
Proyecto.hasMany(CalificacionProyecto, { foreignKey: 'proyecto_id', as: 'calificaciones' });

/**
 * Propósito: Asociar la nota con su concepto académico de la tabla maestra.
 * Quién la alimenta: Invocada al consultar las calificaciones para renderizar el nombre del hito.
 * Qué datos retorna: Relación 1:1 (Cada calificación pertenece a un hito conceptual).
 */
CalificacionProyecto.belongsTo(HitoEvaluacion, { foreignKey: 'hito_id', as: 'hito_detalle' });
HitoEvaluacion.hasMany(CalificacionProyecto, { foreignKey: 'hito_id' });

/**
 * Propósito: Rastrear de forma auditable qué Docente (Usuario) asentó la calificación.
 * Quién la alimenta: Utilizada en reportes de auditoría docente e historial de calificaciones.
 * Qué datos retorna: Relación de pertenencia 1:1 (Cada nota posee un docente calificador asignado).
 */
CalificacionProyecto.belongsTo(Usuario, { foreignKey: 'usuario_id', as: 'docente_calificador' });
Usuario.hasMany(CalificacionProyecto, { foreignKey: 'usuario_id' });

module.exports = {
  sequelize,
  Usuario,
  Proyecto,
  Tarea,
  UserStory,
  TipoUs,
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
  Sugerencia,
  Seguimiento,
  NotaDocente,
  HitoEvaluacion,
  CalificacionProyecto,
  Materia
};