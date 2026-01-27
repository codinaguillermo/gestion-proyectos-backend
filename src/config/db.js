// src/config/db.js
require('dotenv').config();
const { Sequelize } = require('sequelize');

// Configuración de la conexión
const sequelize = new Sequelize(
    process.env.DB_NAME,
    process.env.DB_USER,
    process.env.DB_PASSWORD,
    {
        host: process.env.DB_HOST,
        dialect: 'mysql',
        logging: false, // Ponemos false para que no llene la consola de SQL
    }
);

// Función para probar conexión
const connectDB = async () => {
    try {
        await sequelize.authenticate();
        console.log('✅ Conexión a MySQL establecida con éxito.');
    } catch (error) {
        console.error('❌ No se pudo conectar a la base de datos:', error);
    }
};

// --- AQUÍ ESTABA EL PROBLEMA ---
// Exportamos un objeto { } que contiene la instancia y la función.
module.exports = { sequelize, connectDB };

//DesarrolloWEB-