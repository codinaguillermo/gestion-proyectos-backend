// src/config/db.js
require('dotenv').config();
const { Sequelize } = require('sequelize');

/**
 * Propósito: Configurar Sequelize para forzar nombres de tablas en minúsculas y guiones bajos.
 * Alimenta a: Todos los modelos definidos en el sistema.
 * Retorna: Instancia de conexión con reglas de nomenclatura estables para Linux.
 */
const sequelize = new Sequelize(
    process.env.DB_NAME,
    process.env.DB_USER,
    process.env.DB_PASSWORD,
    {
        host: process.env.DB_HOST,
        dialect: 'mysql',
        logging: false,
        define: {
            underscored: true, // Usa snake_case (user_stories en vez de userStories)
            freezeTableName: false, // Permite que Sequelize pluralice, pero bajo reglas claras
            timestamps: true
        }
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