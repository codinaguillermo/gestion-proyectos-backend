// src/config/db.js
const { Sequelize } = require('sequelize');
require('dotenv').config();

// Creamos la instancia de Sequelize (la conexión)
const sequelize = new Sequelize(
    process.env.DB_NAME,
    process.env.DB_USER,
    process.env.DB_PASSWORD,
    {
        host: process.env.DB_HOST,
        dialect: process.env.DB_DIALECT,
        logging: true, // Ponlo en true si quieres ver las consultas SQL en la consola
    }
);

module.exports = sequelize;

//DesarrolloWEB-