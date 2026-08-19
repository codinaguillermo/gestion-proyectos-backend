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

// NUEVO MODELO v3.0.0: Entidad para variables globales del sistema (Configuraciones / Año Lectivo)
const Configuracion = require('./Configuracion.model.js')(sequelize, DataTypes);

// NUEVO MODELO v3.1.0: Entidad para el control y seguimiento según cronograma de proyecto
const SeguimientoCronograma = require('./seguimientoCronograma.model');

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
Materia.belongsTo(Especialidad, { foreignKey: 'especialidad_id', as: 'especialidad' });
Especialidad.hasMany(Materia, { foreignKey: 'especialidad_id', as: 'materias' });

// --- RELACIONES REESTRUCTURADAS v2.7.0: SEGUIMIENTO DE ALUMNOS ---
Seguimiento.belongsTo(Materia, { foreignKey: 'materia_id', as: 'materia' });
Materia.hasMany(Seguimiento, { foreignKey: 'materia_id', as: 'seguimientosAsociados' });

// --- RELACIONES NUEVAS: SEGUIMIENTO SEGÚN CRONOGRAMA ---
/**
 * Propósito: Vincular cada control de cronograma con su proyecto, materia y docente auditor.
 * Quién la alimenta: Invocada al consultar o crear controles de avance por proyecto.
 * Qué datos retorna: Relaciones 1:N y 1:1 para poblar el listado de avances.
 */
SeguimientoCronograma.belongsTo(Proyecto, { foreignKey: 'proyecto_id', as: 'proyecto' });
Proyecto.hasMany(SeguimientoCronograma, { foreignKey: 'proyecto_id', as: 'seguimientosCronograma' });

SeguimientoCronograma.belongsTo(Materia, { foreignKey: 'materia_id', as: 'materia' });
Materia.hasMany(SeguimientoCronograma, { foreignKey: 'materia_id', as: 'cronogramasMateria' });

SeguimientoCronograma.belongsTo(Usuario, { foreignKey: 'docente_id', as: 'docente' });
Usuario.hasMany(SeguimientoCronograma, { foreignKey: 'docente_id', as: 'cronogramasAuditados' });

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

// DEPENDENCIAS TAREAS (N:M Auto-referencial) ---
Tarea.belongsToMany(Tarea, { 
  through: 'tarea_dependencias', 
  as: 'requisitos', 
  foreignKey: 'tarea_id', 
  otherKey: 'depende_de_id',
  timestamps: false 
});

// --- RELACIONES DE SEGUIMIENTO (Adaptados a seguimientos_alumnos) ---
Seguimiento.belongsTo(Proyecto, { foreignKey: 'proyecto_id', as: 'proyecto' });
Proyecto.hasMany(Seguimiento, { foreignKey: 'proyecto_id', as: 'seguimientos' });

Seguimiento.belongsTo(Usuario, { foreignKey: 'alumno_id', as: 'alumno' });
Usuario.hasMany(Seguimiento, { foreignKey: 'alumno_id', as: 'seguimientosRecibidos' });

Seguimiento.belongsTo(Usuario, { foreignKey: 'docente_id', as: 'docente' });
Usuario.hasMany(Seguimiento, { foreignKey: 'docente_id', as: 'seguimientosRealizados' });

// --- CALIFICACIONES ---
CalificacionProyecto.belongsTo(Proyecto, { foreignKey: 'proyecto_id', as: 'proyecto' });
Proyecto.hasMany(CalificacionProyecto, { foreignKey: 'proyecto_id', as: 'calificaciones' });

CalificacionProyecto.belongsTo(HitoEvaluacion, { foreignKey: 'hito_id', as: 'hito_detalle' });
HitoEvaluacion.hasMany(CalificacionProyecto, { foreignKey: 'hito_id' });

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
  Materia,
  Configuracion,
  SeguimientoCronograma
};