const { 
    UserStory, 
    Proyecto, 
    PrioridadUS, 
    EstadoUS, 
    Tarea, 
    EstadoTarea, 
    Usuario,
    sequelize 
} = require('../models');
const { Op } = require('sequelize');

/**
 * Helper interno para verificar si un usuario pertenece al proyecto.
 * Permite el paso si es Admin (rol 1), Dueño (docente_owner) o Integrante.
 */
const verificarPermisoProyecto = async (proyectoId, usuario) => {
    if (Number(usuario.rol_id) === 1) return true; // Admin libre

    const proyecto = await Proyecto.findByPk(proyectoId, {
        include: [{ 
            model: Usuario, 
            as: 'integrantes', 
            where: { id: usuario.id },
            required: false 
        }]
    });

    if (!proyecto) return false;
    
    const esOwner = proyecto.docente_owner_id === usuario.id;
    const esMiembro = proyecto.integrantes && proyecto.integrantes.length > 0;
    
    return esOwner || esMiembro;
};

// --- CREAR USER STORY ---
const crearUserStory = async (req, res) => {
    try {
        const { proyecto_id, titulo, descripcion, condiciones, prioridad_id, estado_id, fecha_entrega } = req.body;
        const usuarioLogueado = req.usuario;

        const tienePermiso = await verificarPermisoProyecto(proyecto_id, usuarioLogueado);
        if (!tienePermiso) {
            return res.status(403).json({ mensaje: "No tienes permiso para crear historias en este proyecto" });
        }

        const nuevaUS = await UserStory.create({
            proyecto_id,
            titulo,
            descripcion,
            condiciones,
            prioridad_id,
            estado_id: estado_id || 1,
            fecha_entrega 
        });

        return res.status(201).json(nuevaUS);
    } catch (error) {
        console.error("Error al crear User Story:", error);
        return res.status(500).json({ mensaje: "Error al crear User Story", detalle: error.message });
    }
};

// --- OBTENER UNA SOLA USER STORY POR ID ---
const obtenerUserStoryPorId = async (req, res) => {
    try {
        const { id } = req.params;
        const usuarioLogueado = req.usuario; // Obtenido por el middleware verificarToken

        const story = await UserStory.findByPk(id, {
            include: [
                { model: PrioridadUS, as: 'prioridad_detalle' },
                { model: EstadoUS, as: 'estado_detalle' },
                { 
                    model: UserStory, 
                    as: 'predecesoras', 
                    attributes: ['id', 'titulo'],
                    through: { attributes: [] } 
                },
                { 
                    model: Tarea, 
                    as: 'tareas',
                    include: [
                        { model: Usuario, as: 'responsable', attributes: ['id', 'nombre', 'apellido'] },
                        { model: EstadoTarea, as: 'estado_detalle', attributes: ['id', 'nombre'] }
                    ]
                }
            ]
        });

        // 1. Validamos que la US exista
        if (!story) {
            return res.status(404).json({ mensaje: "User Story no encontrada" });
        }

        // 2. SEGURIDAD: Validamos que el usuario tenga permiso sobre el proyecto de esta US
        const tienePermiso = await verificarPermisoProyecto(story.proyecto_id, usuarioLogueado);
        
        if (!tienePermiso) {
            return res.status(403).json({ 
                mensaje: "Acceso denegado: No perteneces al proyecto de esta User Story." 
            });
        }

        // 3. Si pasó los filtros, devolvemos la data
        return res.json(story);

    } catch (error) {
        console.error("Error al obtener User Story por ID:", error);
        return res.status(500).json({ 
            mensaje: "Error interno al obtener la US", 
            detalle: error.message 
        });
    }
};

// --- OBTENER USER STORIES POR PROYECTO ---
const obtenerUserStoriesPorProyecto = async (req, res) => {
    try {
        const { proyectoId } = req.params;
        const stories = await UserStory.findAll({
            where: { proyecto_id: proyectoId },
            attributes: ['id', 'titulo', 'descripcion', 'condiciones', 'prioridad_id', 'estado_id', 'proyecto_id', 'fecha_entrega'],
            include: [
                { model: PrioridadUS, as: 'prioridad_detalle' },
                { model: EstadoUS, as: 'estado_detalle' },
                { 
                    model: UserStory, 
                    as: 'predecesoras', 
                    attributes: ['id', 'titulo'],
                    through: { attributes: [] } 
                },
                { 
                    model: Tarea, 
                    as: 'tareas',
                    include: [
                        { model: Usuario, as: 'responsable', attributes: ['id', 'nombre', 'apellido'] }, 
                        { model: EstadoTarea, as: 'estado_detalle', attributes: ['id', 'nombre'] }
                    ]
                }
            ],
            order: [['id', 'ASC']] 
        });
        return res.json(stories);
    } catch (error) {
        console.error("Error al obtener US por proyecto:", error); 
        return res.status(500).json({ mensaje: "Error al obtener US", detalle: error.message });
    }
};

// --- ACTUALIZAR USER STORY ---
const actualizarUserStory = async (req, res) => {
    const t = await sequelize.transaction();
    
    try {
        const { id } = req.params;
        const usuarioLogueado = req.usuario;
        const { titulo, descripcion, condiciones, prioridad_id, estado_id, fecha_entrega, dependenciasIds } = req.body;

        const us = await UserStory.findByPk(id);
        if (!us) {
            await t.rollback();
            return res.status(404).json({ mensaje: "User Story no encontrada" });
        }

        // VALIDACIÓN DE MIEMBRO/ADMIN
        const tienePermiso = await verificarPermisoProyecto(us.proyecto_id, usuarioLogueado);
        if (!tienePermiso) {
            await t.rollback();
            return res.status(403).json({ mensaje: "No tienes permiso para editar historias de este proyecto" });
        }

        // --- VALIDACIÓN DE ESTADO 4 (No terminar si hay tareas pendientes) ---
        if (Number(estado_id) === 4) {
            const tareas = await Tarea.findAll({ where: { us_id: id } });
            const tareasPendientes = tareas.filter(t => Number(t.estado_id) !== 4);

            if (tareasPendientes.length > 0) {
                await t.rollback();
                return res.status(400).json({ 
                    mensaje: "No se puede terminar la US",
                    detalle: `Aún quedan ${tareasPendientes.length} tareas sin completar.` 
                });
            }
        }

        await us.update({ 
            titulo, 
            descripcion, 
            condiciones, 
            prioridad_id, 
            estado_id, 
            fecha_entrega 
        }, { transaction: t });

        if (Array.isArray(dependenciasIds)) {
            await us.setPredecesoras(dependenciasIds, { transaction: t });
        }

        await t.commit();
        return res.json({ mensaje: "User Story actualizada correctamente", us });

    } catch (error) {
        if (t) await t.rollback();
        console.error("Error al actualizar US:", error);
        return res.status(500).json({ mensaje: "Error del servidor", detalle: error.message });
    }
};

// --- ELIMINAR USER STORY ---
const eliminarUserStory = async (req, res) => {
    try {
        const { id } = req.params;
        const usuarioLogueado = req.usuario;

        const us = await UserStory.findByPk(id);
        if (!us) return res.status(404).json({ mensaje: "User Story no encontrada" });

        const tienePermiso = await verificarPermisoProyecto(us.proyecto_id, usuarioLogueado);
        if (!tienePermiso) {
            return res.status(403).json({ mensaje: "No tienes permiso para eliminar historias de este proyecto" });
        }

        await Tarea.destroy({ where: { us_id: id } });
        await us.destroy();

        return res.json({ mensaje: "User Story eliminada correctamente" });
    } catch (error) {
        console.error("❌ ERROR AL ELIMINAR US:", error);
        return res.status(500).json({ mensaje: "Error al eliminar la US", detalle: error.message });
    }
};

module.exports = {
    crearUserStory,
    obtenerUserStoriesPorProyecto,
    actualizarUserStory,
    eliminarUserStory,
    obtenerUserStoryPorId
};