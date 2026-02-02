const express = require('express');
const cors = require('cors');

//importar
const authRoutes = require('./src/routes/auth.routes');
const usuarioRoutes = require('./src/routes/usuario.routes');
const proyectoRoutes = require('./src/routes/proyecto.routes'); 
const tareasRoutes = require('./src/routes/tarea.routes');
const userStoryRoutes = require('./src/routes/userStory.routes');


require('dotenv').config();

// OJO: Ahora importamos desde models/index, no db.js directo
const { sequelize } = require('./src/models'); 

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

// Rutas
app.use('/api/auth', authRoutes);
app.use('/api/usuarios', usuarioRoutes);
app.use('/api/proyectos', proyectoRoutes);
app.use('/api/tareas', tareasRoutes);
app.use('/api/user-stories', userStoryRoutes);


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

        app.listen(PORT, () => {
            console.log(`\n>>> Servidor corriendo en http://localhost:${PORT}`);
        });

    } catch (error) {
        console.error('❌ Error al iniciar:', error);
    }
};

startServer();