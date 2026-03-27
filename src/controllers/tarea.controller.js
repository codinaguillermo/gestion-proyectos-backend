const { Tarea, Proyecto, Usuario, Prioridad, EstadoTarea, TipoTarea, EstadoProyecto, UserStory } = require('../models');

/**
 * Helper de permisos: Admin, Docente o Alumno Integrante pasan.
 */
const verificarPermisoProyecto = async (proyectoId, usuario) => {
    if (Number(usuario.rol_id) === 1) return true;
    const proyecto = await Proyecto.findByPk(proyectoId, {
        include: [{ 
            model: Usuario, as: 'integrantes', 
            where: { id: usuario.id }, required: false 
        }]
    });
    if (!proyecto) return false;
    const esOwner = Number(proyecto.docente_owner_id) === Number(usuario.id);
    const esMiembro = proyecto.integrantes && proyecto.integrantes.length > 0;
    return esOwner || esMiembro;
};

// --- 1. CREAR TAREA (POST /api/tareas) ---
// --- crearTarea en tarea.controller.js ---
const crearTarea = async (req, res) => {
    try {
        const { 
            titulo, descripcion, usId, proyecto_id, 
            tipo_id, prioridad_id, responsable_id, horas_estimadas 
        } = req.body;

        // Validación de IDs
        if (!usId || !proyecto_id) {
            return res.status(400).json({ mensaje: "usId y proyecto_id son obligatorios." });
        }

        // 1. CREAMOS LA TAREA (Sin includes para que no falle el INSERT)
        const nuevaTarea = await Tarea.create({
            titulo,
            descripcion,
            proyecto_id: Number(proyecto_id),
            usId: Number(usId),
            tipo_id: tipo_id || 1,
            prioridad_id: prioridad_id || 1,
            estado_id: 1, 
            responsable_id: responsable_id || null,
            horas_estimadas: horas_estimadas || 0,
            horasReales: 0
        });

        /**
         * 2. RECARGAMOS con los alias que SI funcionan en tu código:
         * 'prioridad_detalle', 'estado_detalle', 'responsable'
         */
        const tareaCompleta = await Tarea.findByPk(nuevaTarea.id, {
            include: [
                { model: Prioridad, as: 'prioridad_detalle' },
                { model: EstadoTarea, as: 'estado_detalle' },
                { model: Usuario, as: 'responsable', attributes: ['id', 'nombre', 'apellido'] }
            ]
        });

        return res.status(201).json(tareaCompleta);
    } catch (error) {
        console.error("Error en crearTarea:", error);
        // Si el include falla, al menos devolvemos la tarea pelada para que no se pierda el registro
        return res.status(500).json({ 
            mensaje: "La tarea se creó pero hubo un error al cargar detalles", 
            error: error.message 
        });
    }
};

// --- 2. OBTENER TODAS (GET /api/tareas) ---
// --- 2. OBTENER TODAS (CORREGIDO PARA EVITAR EL 500) ---
const obtenerTodasLasTareas = async (req, res) => {
    try {
        const tareas = await Tarea.findAll({
            include: [
                // Usamos los alias exactos que definiste en tus modelos
                { model: Prioridad, as: 'prioridad_detalle' }, 
                { model: EstadoTarea, as: 'estado_detalle' },
                { model: Usuario, as: 'responsable', attributes: ['id', 'nombre', 'apellido'] }
            ]
        });
        res.json(tareas);
    } catch (error) {
        console.error('Error en obtenerTodasLasTareas:', error);
        res.status(500).json({ 
            mensaje: "Error al obtener todas las tareas", 
            detalle: error.message 
        });
    }
};

// --- 3. OBTENER POR PROYECTO (GET /api/tareas/proyecto/:proyecto_id) ---
const obtenerTareasProyecto = async (req, res) => {
    try {
        const { proyecto_id } = req.params;
        const tareas = await Tarea.findAll({
            where: { proyecto_id },
            include: ['responsable', 'prioridad', 'estado', 'tipo']
        });
        return res.json(tareas);
    } catch (error) {
        return res.status(500).json({ mensaje: "Error al obtener tareas del proyecto" });
    }
};

// --- 4. OBTENER POR ID (GET /api/tareas/:id) ---
const obtenerTareaPorId = async (req, res) => {
    try {
        const { id } = req.params;
        
        // 1. Buscamos la tarea
        const tarea = await Tarea.findByPk(id, {
            // Traemos las relaciones con los alias que SI existen
            include: [
                { model: EstadoTarea, as: 'estado_detalle' },
                { model: Prioridad, as: 'prioridad_detalle' },
                { model: TipoTarea, as: 'tipo_detalle' },
                { model: Usuario, as: 'responsable', attributes: ['id', 'nombre', 'apellido'] },
                // Si 'requisitos' te da error, comentá esta línea para probar
                { model: Tarea, as: 'requisitos', through: { attributes: [] } }
            ]
        });

        if (!tarea) {
            return res.status(404).json({ mensaje: "Tarea no encontrada" });
        }

        return res.json(tarea);
    } catch (error) {
        console.error("ERROR EN obtenerTareaPorId:", error);
        // Enviamos el mensaje de error real para saber exactamente qué alias falta
        return res.status(500).json({ 
            mensaje: "Error interno del servidor", 
            detalle: error.message 
        });
    }
};

// --- 5. ACTUALIZAR (PUT /api/tareas/:id) ---
const actualizarTarea = async (req, res) => {
    try {
        const { id } = req.params;
        const { 
            titulo, descripcion, estado_id, prioridad_id, responsable_id, tipo_id,
            horas_estimadas, cumpleAceptacion, testeado, documentado, utilizable, 
            horasReales, criterios_aceptacion, comentario_cierre, link_evidencia 
        } = req.body;

        const tarea = await Tarea.findByPk(id);
        if (!tarea) return res.status(404).json({ mensaje: "No encontrada" });

        await Tarea.update({
            titulo, descripcion, estado_id, prioridad_id, responsable_id, tipo_id,
            horas_estimadas, cumpleAceptacion, testeado, documentado, utilizable, 
            horasReales,
            criteriosAceptacion: criterios_aceptacion, // Mapeo al field del modelo
            comentarioCierre: comentario_cierre,       // Mapeo al field del modelo
            linkEvidencia: link_evidencia              // Mapeo al field del modelo
        }, { where: { id } });

        return res.json({ mensaje: "Tarea actualizada" });
    } catch (error) {
        return res.status(500).json({ mensaje: "Error al actualizar" });
    }
};

// --- 6. ELIMINAR (DELETE /api/tareas/:id) ---
const eliminarTarea = async (req, res) => {
    try {
        const { id } = req.params;
        await Tarea.destroy({ where: { id } });
        return res.json({ mensaje: "Tarea eliminada" });
    } catch (error) {
        return res.status(500).json({ mensaje: "Error al eliminar" });
    }
};

// --- 7. MAESTRAS (GET /api/tareas/config/maestras) ---
/**
 * Propósito: Proveer tablas maestras para la configuración de tareas y proyectos.
 * Quién la llama: config.service.js -> getTablasMaestras()
 * Retorna: JSON con prioridades, estados de tarea, tipos y estados de proyecto.
 */
const obtenerTablasMaestras = async (req, res) => {
    try {
        // Corregido: Ahora desestructuramos las 4 promesas correctamente
        const [prioridades, estados, tipos, estadosProyecto] = await Promise.all([
            Prioridad.findAll({ order: [['peso', 'ASC']] }),
            EstadoTarea.findAll(),
            TipoTarea.findAll(),
            EstadoProyecto.findAll() 
        ]);

        // Retornamos el objeto con las 4 propiedades para que el frontend las encuentre
        return res.json({ 
            prioridades, 
            estados, 
            tipos, 
            estadosProyecto 
        });
    } catch (error) {
        console.error("Error en obtenerTablasMaestras:", error);
        return res.status(500).json({ 
            mensaje: "Error al obtener tablas maestras",
            detalle: error.message 
        });
    }
};

// --- 8. AVANCE (POST /api/tareas/:id/avance) ---
const registrarAvanceHoras = async (req, res) => {
    try {
        const { id } = req.params;
        const { horasNuevas } = req.body;
        const tarea = await Tarea.findByPk(id);
        const nuevoTotal = (parseFloat(tarea.horasReales) || 0) + (parseFloat(horasNuevas) || 0);
        await Tarea.update({ horasReales: nuevoTotal }, { where: { id } });
        return res.json({ mensaje: "Horas registradas", total: nuevoTotal });
    } catch (error) {
        return res.status(500).json({ mensaje: "Error en avance" });
    }
};

module.exports = {
    crearTarea,
    obtenerTodasLasTareas,
    obtenerTareasProyecto,
    obtenerTareaPorId,
    actualizarTarea,
    eliminarTarea,
    obtenerTablasMaestras,
    registrarAvanceHoras
};