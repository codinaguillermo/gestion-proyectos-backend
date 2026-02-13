// 1. IMPORTACIONES DE MÓDULOS (Siempre primero)
const express = require('express');
const cors = require('cors');
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


// 4. INICIALIZACIÓN DE LA APP
const app = express(); // <--- Ahora sí, express ya existe arriba
const PORT = process.env.PORT || 3000;

// 5. MIDDLEWARES
app.use(cors());
app.use(express.json());

// 6. RUTAS
app.use('/api/auth', authRoutes);
app.use('/api/usuarios', usuarioRoutes);
app.use('/api/proyectos', proyectoRoutes);
app.use('/api/tareas', tareasRoutes);
app.use('/api/user-stories', userStoryRoutes);
app.use('/api/common', commonRoutes);
app.use('/api/escuelas', escuelaRoutes);

app.get('/', (req, res) => {
  res.send('¡API Gestor de Proyectos funcionando! 🚀');
});

const startServer = async () => {
    try {
        await sequelize.authenticate();
        console.log('✅ Conexión a MySQL establecida.');

        // SYNC: Esto revisa si las tablas existen. 
        // alter: true -> Si cambiaste algo en el modelo, intenta actualizar la tabla real.
        //await sequelize.sync({ alter: true });
        await sequelize.sync({ force: false, alter: false });
        //await sequelize.sync({ alter: true }); // Cambiamos false por true
        console.log('✅ Modelos sincronizados con la BD.');
        console.log(`¿US con Borrado Lógico?: ${UserStory.options.paranoid}`);

        app.listen(PORT, () => {
            console.log(`\n>>> Servidor corriendo en http://localhost:${PORT}`);
        });

    } catch (error) {
        console.error('❌ Error al iniciar:', error);
    }
};

startServer();