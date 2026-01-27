// src/models/index.js
const sequelize = require('../config/db');
const Usuario = require('./usuario.model');
const Proyecto = require('./proyecto.model');


// 1. Un Usuario (Docente) tiene muchos Proyectos a su cargo
Usuario.hasMany(Proyecto, { 
    foreignKey: 'docente_owner_id', // Así se llamará la columna en la tabla 'proyectos'
    as: 'proyectos_a_cargo'         // Así llamaremos a la lista desde Node.js
});

// 2. Un Proyecto pertenece a un Usuario (Docente Tutor)
Proyecto.belongsTo(Usuario, { 
    foreignKey: 'docente_owner_id', // Tiene que ser EL MISMO nombre de arriba
    as: 'docente_tutor'             // Así llamaremos al dueño desde Node.js
});

module.exports = {
    sequelize,
    Usuario,
    Proyecto
};