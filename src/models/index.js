const { sequelize } = require('../config/db');
const { DataTypes } = require('sequelize'); // Necesitamos DataTypes para los nuevos modelos

const Usuario = require('./usuario.model');
const Proyecto = require('./proyecto.model');
const Tarea = require('./tarea.model');
const Rol = require('./rol');
const EstadoProyecto = require('./estadoProyecto');

// --- NUEVOS MODELOS (Mesa de diseño) ---
// Los ejecutamos pasando sequelize y DataTypes para que dejen de ser funciones y sean Modelos
const Prioridad = require('./prioridad.model')(sequelize, DataTypes);
const EstadoTarea = require('./estadoTarea.model.js')(sequelize, DataTypes);
const TipoTarea = require('./tipoTarea.model.js')(sequelize, DataTypes);

// RELACIONES
// --- RELACIÓN MUCHOS A MUCHOS: Proyectos e Integrantes ---
// Esto crea automáticamente la tabla intermedia 'ProyectoUsuarios'
Proyecto.belongsToMany(Usuario, { 
  through: 'ProyectoUsuarios', 
  as: 'integrantes', // Cómo los llamarás en el código
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

Proyecto.hasMany(Tarea, { foreignKey: 'proyecto_id' });
Tarea.belongsTo(Proyecto, { foreignKey: 'proyecto_id' });

Usuario.hasMany(Tarea, { foreignKey: 'responsable_id' });
Tarea.belongsTo(Usuario, { foreignKey: 'responsable_id', as: 'responsable' });

Tarea.hasMany(Tarea, { as: 'subtareas', foreignKey: 'padre_id' });
Tarea.belongsTo(Tarea, { as: 'padre', foreignKey: 'padre_id' });

// --- 7. NUEVAS RELACIONES (Sin pisar nada) ---
Tarea.belongsTo(Prioridad, { foreignKey: 'prioridad_id', as: 'prioridad_detalle' });
Tarea.belongsTo(EstadoTarea, { foreignKey: 'estado_id', as: 'estado_detalle' });
Tarea.belongsTo(TipoTarea, { foreignKey: 'tipo_id', as: 'tipo_detalle' });

// EXPORTACIÓN ÚNICA
module.exports = {
    sequelize,
    Usuario,
    Proyecto,
    Tarea,
    Rol,
    EstadoProyecto,
    Prioridad,
    EstadoTarea,
    TipoTarea
};