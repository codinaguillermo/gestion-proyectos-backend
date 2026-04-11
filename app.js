// 1. IMPORTACIONES DE MÓDULOS (Siempre primero)
const express = require('express');
const cors = require('cors');
const path = require('path'); 
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

console.log('--- DEBUG DE EMERGENCIA ---');
console.log('Contenido de seguimientoRoutes:', seguimientoRoutes);
console.log('Tipo de dato:', typeof seguimientoRoutes);

// SERVIR EL FRONTEND (Carpeta dist) ---

// 1. Decirle a Node dónde están los archivos estáticos del front
app.use(express.static(path.join(__dirname, 'dist'), {
    setHeaders: (res, filePath) => {
        // REGLA DE ORO: El index.html NUNCA se cachea en el navegador
        if (filePath.endsWith('.html')) {
            res.setHeader('Cache-Control', 'no-cache, no-store, must-revalidate');
            res.setHeader('Pragma', 'no-cache');
            res.setHeader('Expires', '0');
        } else {
            // Los archivos con hash (js, css, png) se pueden cachear
            // porque si cambian, Vite les cambia el nombre
            res.setHeader('Cache-Control', 'public, max-age=31536000, immutable');
        }
    }
}));

// 2. Manejar cualquier ruta que no sea de la API (Solución SPA para Vue Router)
app.use((req, res, next) => {
    if (!req.path.startsWith('/api')) {
        // Al enviar el index.html por descarte, también le quitamos el caché
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

// Comentamos este porque ahora el "/" lo maneja el 'dist' de arriba
// app.get('/', (req, res) => {
//   res.send('¡API Gestor de Proyectos funcionando! 🚀');
// });

const startServer = async () => {
    try {
        await sequelize.authenticate();
        console.log('✅ Conexión a MySQL establecida.');

        // SYNC: 
        await sequelize.sync({ force: false, alter: false });
        
        console.log('✅ Modelos sincronizados con la BD.');
        console.log(`¿US con Borrado Lógico?: ${UserStory.options.paranoid}`);

        app.listen(PORT, () => {
            console.log(`\n>>> Servidor corriendo en http://localhost:${PORT}`);
            console.log(`>>> Frontend listo. ¡Entrá a probarlo!`);
        });

    } catch (error) {
        console.error('❌ Error al iniciar:', error);
    }
};

startServer();