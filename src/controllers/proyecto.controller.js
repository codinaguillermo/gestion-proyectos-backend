
const { Op } = require('sequelize'); 
const { Tarea, Proyecto, Usuario, Prioridad, EstadoTarea, TipoTarea, EstadoProyecto, UserStory, Rol } = require('../models');

// AGREGA ESTO TEMPORALMENTE:
console.log('--- VERIFICANDO MODELOS ---');
console.log('Proyecto:', !!Proyecto);
console.log('UserStory:', !!UserStory);
console.log('Tarea:', !!Tarea);


// --- OBTENER UN PROYECTO POR ID ---
const obtenerProyectoPorId = async (req, res) => {
    try {
        const { id } = req.params;
        // Buscamos el proyecto pero SIN filtrar los integrantes por el usuario actual
        const proyecto = await Proyecto.findByPk(id, {
            attributes: ['id', 'nombre', 'descripcion', 'docente_owner_id'],
            include: [
                { model: EstadoProyecto, attributes: ['nombre'] },
                { 
                    model: Usuario, 
                    as: 'integrantes', 
                    attributes: ['id', 'nombre', 'email'],
                    // Agregamos el include del Rol para que no aparezcan todos como "Alumno" por defecto
                    include: [{ model: Rol, attributes: ['nombre'] }],
                    through: { attributes: [] } 
                }
            ]
        });

        if (!proyecto) {
            return res.status(404).json({ mensaje: "Proyecto no encontrado" });
        }

        return res.json(proyecto);
    } catch (error) {
        console.error("Error al obtener proyecto por ID:", error);
        return res.status(500).json({ mensaje: "Error del servidor" });
    }
};


// --- CREAR PROYECTO ---
const crearProyecto = async (req, res) => {
    try {
        const { nombre, descripcion } = req.body;
        const usuarioId = req.usuario.id;

        // 1. Buscamos el estado inicial
        const estadoInicial = await EstadoProyecto.findOne({ order: [['id', 'ASC']] });
        
        if (!estadoInicial) {
            return res.status(500).json({ mensaje: "Falta configurar estados de proyecto en la DB" });
        }

        // 2. Creamos el proyecto asignando al creador como Owner
        const nuevoProyecto = await Proyecto.create({
            nombre,
            descripcion,
            estado_id: estadoInicial.id,
            docente_owner_id: usuarioId
        });

        // 3. ¡PASO CLAVE!: Auto-asignarse como integrante
        // Usamos el método que Sequelize genera automáticamente por el alias 'integrantes'
        await nuevoProyecto.addIntegrante(usuarioId); 

        // 4. Retornamos con los datos completos para que el frontend se actualice
        const proyectoConRelacion = await Proyecto.findByPk(nuevoProyecto.id, {
            include: [
                { model: EstadoProyecto, attributes: ['nombre'] },
                { 
                    model: Usuario, 
                    as: 'integrantes', 
                    attributes: ['id', 'nombre', 'email'],
                    through: { attributes: [] }
                }
            ]
        });

        return res.status(201).json(proyectoConRelacion);

    } catch (error) {
        console.error("Error al crear proyecto:", error); 
        return res.status(500).json({ mensaje: "Error al crear proyecto", detalle: error.message });
    }
};


// --- OBTENER PROYECTOS (Versión con Backlog) ---
const obtenerProyectos = async (req, res) => {
    try {
        const { id, rol_id } = req.usuario;
        let condicion = {};

        // Si no es Admin, filtramos por participación o autoría
        if (rol_id !== 1) {
            const participaciones = await Proyecto.findAll({
                attributes: ['id'],
                include: [{
                    model: Usuario,
                    as: 'integrantes',
                    where: { id: id },
                    attributes: [],
                    through: { attributes: [] }
                }],
                raw: true
            });

            const ids = participaciones.map(p => p.id);

            condicion = {
                [Op.or]: [
                    { docente_owner_id: id },
                    { id: { [Op.in]: ids } }
                ]
            };
        }

        // TRAER PROYECTOS: Forzamos que 'docente_owner_id' esté presente
        const proyectos = await Proyecto.findAll({
            where: condicion,
            attributes: [
                'id', 
                'nombre', 
                'descripcion', 
                'estado_id', 
                'docente_owner_id', // <--- FUNDAMENTAL
                'created_at'
            ],
            include: [
                { model: EstadoProyecto, attributes: ['id', 'nombre'] },
                { model: UserStory, as: 'userStories' },
                {
                    model: Usuario,
                    as: 'integrantes',
                    attributes: ['id', 'nombre', 'email'],
                    include: [{ model: Rol, attributes: ['nombre'] }],
                    through: { attributes: [] }
                }
            ],
            order: [['created_at', 'DESC']]
        });

        return res.json(proyectos);
    } catch (error) {
        console.error("Error en obtenerProyectos:", error);
        return res.status(500).json({ mensaje: "Error", detalle: error.message });
    }
};

// --- ACTUALIZAR PROYECTO ---
const actualizarProyecto = async (req, res) => {
    try {
        const { id } = req.params;
        console.log("--- INICIO ACTUALIZAR ---");
        console.log("ID Proyecto:", id);
        console.log("Body recibido:", req.body);
        const { nombre, descripcion, estado_id, usuariosIds } = req.body; // <-- Recibimos los IDs

        const proyecto = await Proyecto.findByPk(id);
        if (!proyecto) return res.status(404).json({ mensaje: "Proyecto no encontrado" });

        // Actualización de datos básicos
        console.log("BODY RECIBIDO:", req.body);
        console.log("IDS EXTRAIDOS:", usuariosIds);
        await proyecto.update({ nombre, descripcion, estado_id });

        // PERSISTENCIA DE ALUMNOS: Sincroniza la tabla intermedia
        if (usuariosIds) {
            await proyecto.setIntegrantes(usuariosIds); // 'setIntegrantes' por el alias 'as: integrantes' del index.js
        }

        const proyectoActualizado = await Proyecto.findByPk(id, {
            include: [
                { model: EstadoProyecto, attributes: ['nombre'] },
                { model: Usuario, as: 'integrantes', attributes: ['id', 'nombre', 'email'] } // <-- Incluirlos en la respuesta
            ]
        });

        return res.json({ 
            mensaje: "Proyecto actualizado con éxito", 
            proyecto: proyectoActualizado 
        });

    } catch (error) {
        console.error("Error al actualizar proyecto:", error);
        return res.status(500).json({ mensaje: "Error al actualizar proyecto" });
    }
};

// --- ELIMINAR PROYECTO ---
// src/controllers/proyecto.controller.js

// src/controllers/proyecto.controller.js

const eliminarProyecto = async (req, res) => {
    try {
        const { id } = req.params;

        // Buscamos el proyecto usando el alias que Sequelize nos pide: 'userStories'
        const proyecto = await Proyecto.findByPk(id, {
            include: [{
                model: UserStory,
                as: 'userStories', // CAMBIADO: Antes decía 'user_stories'
                include: [{ model: Tarea, as: 'tareas' }]
            }]
        });

        if (!proyecto) {
            return res.status(404).json({ mensaje: "Proyecto no encontrado" });
        }

        // CASCADA LÓGICA MANUAL
        // Usamos proyecto.userStories (con S mayúscula) porque así lo trajo el include
        if (proyecto.userStories && proyecto.userStories.length > 0) {
            for (const us of proyecto.userStories) {
                // 1. Borrado lógico de tareas de esta US
                await Tarea.destroy({ where: { us_id: us.id } });
                // 2. Borrado lógico de la US
                await us.destroy();
            }
        }

        // 3. Finalmente, borrado lógico del proyecto
        await proyecto.destroy();

        return res.json({ mensaje: "Proyecto y su contenido eliminados (lógicamente) con éxito" });

    } catch (error) {
        console.error("Error en borrado lógico:", error);
        return res.status(500).json({ mensaje: "Error al eliminar", detalle: error.message });
    }
};

// No olvides agregarlo al module.exports

module.exports = {
    obtenerProyectoPorId,
    crearProyecto,
    obtenerProyectos,
    actualizarProyecto,
    eliminarProyecto
};