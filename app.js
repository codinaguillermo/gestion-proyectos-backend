// 1. IMPORTACIONES DE MÓDULOS (Siempre primero)
const express = require('express');
const cors = require('cors');
const path = require('path'); 
const fs = require('fs');
const https = require('https');
require('dotenv').config();

// 2. IMPORTACIÓN DE MODELOS (Desde el index)
const { sequelize, UserStory, Proyecto, Tarea } = require('./src/models');

// 3. IMPORTACIÓN DE RUTAS
const authRoutes = require('./src/routes/auth.routes');
const usuarioRoutes = require('./src/routes/usuario.routes');
const proyectoRoutes = require('./src/routes/proyecto.routes'); 
const tareasRoutes = require('./src/routes/tarea.routes');
const userStoryRoutes = require('./src/routes/userStory.routes');
const commonRoutes = require('./src/routes/common.routes');
const escuelaRoutes = require('./src/routes/escuela.routes');
const statsRoutes = require('./src/routes/stats.routes');
const sugerenciaRoutes = require('./src/routes/sugerencia.routes');
const seguimientoRoutes = require('./src/routes/seguimiento.routes');
const reporteRoutes = require('./src/routes/reporte.routes'); 


// 4. INICIALIZACIÓN DE LA APP
const app = express();
const PORT = process.env.PORT || 3000;

// 5. MIDDLEWARES
app.use(cors());
app.use(express.json());

// --- SERVIR ARCHIVOS ESTÁTICOS DE SUBIDAS ---
app.use('/uploads', express.static(path.join(__dirname, 'public/uploads')));

// 6. RUTAS DE LA API
app.use('/api/auth', authRoutes);
app.use('/api/usuarios', usuarioRoutes);
app.use('/api/proyectos', proyectoRoutes);
app.use('/api/tareas', tareasRoutes);
app.use('/api/user-stories', userStoryRoutes);
app.use('/api/common', commonRoutes);
app.use('/api/escuelas', escuelaRoutes);
app.use('/api/stats', statsRoutes);
app.use('/api/sugerencias', sugerenciaRoutes);
app.use('/api/seguimientos', seguimientoRoutes);
app.use('/api/reportes', reporteRoutes); 

console.log('--- DEBUG DE EMERGENCIA ---');
console.log('Contenido de seguimientoRoutes:', seguimientoRoutes);
console.log('Tipo de dato:', typeof seguimientoRoutes);

// SERVIR EL FRONTEND (Carpeta dist) ---

// 1. Decirle a Node dónde están los archivos estáticos del front
app.use(express.static(path.join(__dirname, 'dist'), {
    setHeaders: (res, filePath) => {
        if (filePath.endsWith('.html')) {
            res.setHeader('Cache-Control', 'no-cache, no-store, must-revalidate');
            res.setHeader('Pragma', 'no-cache');
            res.setHeader('Expires', '0');
        } else {
            res.setHeader('Cache-Control', 'public, max-age=31536000, immutable');
        }
    }
}));

// 2. Manejar cualquier ruta que no sea de la API (Solución SPA para Vue Router)
app.use((req, res, next) => {
    if (!req.path.startsWith('/api')) {
        return res.sendFile(path.join(__dirname, 'dist', 'index.html'), {
            headers: {
                'Cache-Control': 'no-cache, no-store, must-revalidate',
                'Pragma': 'no-cache',
                'Expires': '0'
            }
        });
    }
    next();
});

/**
 * Propósito: Iniciar la conexión con la base de datos MySQL, sincronizar los modelos 
 * y levantar el servidor web bajo el protocolo HTTPS utilizando los certificados 
 * locales generados con mkcert en la carpeta 'cert'.
 * A quién alimenta (quién la llama): Es invocada de forma global al final de este archivo para arrancar el backend completo.
 * Qué datos retorna: No retorna datos. Inicializa el servicio de red seguro en el puerto 3000 y emite logs por consola sobre el estado de conexión.
 */
const startServer = async () => {
    try {
        await sequelize.authenticate();
        console.log('✅ Conexión a MySQL establecida.');

        // SYNC: 
        await sequelize.sync({ force: false, alter: false });
        
        console.log('✅ Modelos sincronizados con la BD.');
        console.log(`¿US con Borrado Lógico?: ${UserStory.options.paranoid}`);

        // Opciones de configuración para montar el servidor HTTPS local con los nuevos nombres
        const httpsOptions = {
            key: fs.readFileSync(path.join(__dirname, 'cert', 'key.pem')),
            cert: fs.readFileSync(path.join(__dirname, 'cert', 'cert.pem'))
        };

        https.createServer(httpsOptions, app).listen(PORT, '0.0.0.0', () => {
            console.log(`\n>>> Servidor seguro HTTPS corriendo en https://0.0.0.0:${PORT}`);
            console.log(`>>> Frontend listo. ¡Entrá a probarlo!`);
        });

    } catch (error) {
        console.error('❌ Error al iniciar:', error);
    }
};

startServer();