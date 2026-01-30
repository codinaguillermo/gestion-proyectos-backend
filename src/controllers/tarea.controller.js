//const { Tarea, Proyecto, Usuario, Prioridad, EstadoTarea, TipoTarea } = require('../models');
const { Tarea, Proyecto, Usuario, Prioridad, EstadoTarea, TipoTarea, EstadoProyecto } = require('../models');

// --- CREAR TAREA ---
const crearTarea = async (req, res) => {
    try {
        // Ahora desestructuramos usando los IDs que vienen del front
        const { titulo, descripcion, tipo_id, prioridad_id, proyecto_id, responsable_id, padre_id } = req.body;

        // 1. Validaciones básicas
        if (!titulo || !proyecto_id) {
            return res.status(400).json({ mensaje: "Faltan datos: titulo y proyecto_id son obligatorios" });
        }

        // 2. Buscamos el estado inicial 'BACKLOG' en la tabla maestra
        const estadoInicial = await EstadoTarea.findOne({ where: { nombre: 'BACKLOG' } });

        // 3. Crear la Tarea con los IDs correspondientes
        const nuevaTarea = await Tarea.create({
            titulo,
            descripcion,
            tipo_id,        // ID de la tabla tipos_tarea
            prioridad_id,   // ID de la tabla prioridades
            proyecto_id,
            responsable_id,
            padre_id,       // Puede ser null
            estado_id: estadoInicial ? estadoInicial.id : 1 // Fallback al ID 1 si no encuentra el nombre
        });

        return res.status(201).json({
            mensaje: "Tarea creada con éxito",
            tarea: nuevaTarea
        });

    } catch (error) {
        console.error("Error creando tarea:", error);
        return res.status(500).json({ mensaje: "Error al crear la tarea", error: error.message });
    }
};

// --- OBTENER TAREAS DE UN PROYECTO ---
const obtenerTareasProyecto = async (req, res) => {
    try {
        const { proyecto_id } = req.params;

        const tareas = await Tarea.findAll({
            where: { 
                proyecto_id,
                padre_id: null 
            },
            include: [
                { model: Usuario, as: 'responsable', attributes: ['id', 'nombre'] },
                // Traemos los detalles de las tablas maestras usando los alias del index.js
                { model: Prioridad, as: 'prioridad_detalle' },
                { model: EstadoTarea, as: 'estado_detalle' },
                { model: TipoTarea, as: 'tipo_detalle' },
                { 
                    model: Tarea, 
                    as: 'subtareas',
                    include: [
                        { model: Usuario, as: 'responsable', attributes: ['id', 'nombre'] },
                        { model: Prioridad, as: 'prioridad_detalle' },
                        { model: EstadoTarea, as: 'estado_detalle' }
                    ]
                }
            ]
        });

        return res.json(tareas);

    } catch (error) {
        console.error("Error al obtener tareas:", error);
        return res.status(500).json({ mensaje: "Error al obtener tareas" });
    }
};

// --- ACTUALIZAR TAREA (PUT) ---
const actualizarTarea = async (req, res) => {
    try {
        const { id } = req.params;
        const { titulo, descripcion, estado_id, prioridad_id, responsable_id, tipo_id } = req.body;

        const tarea = await Tarea.findByPk(id);
        if (!tarea) {
            return res.status(404).json({ mensaje: "Tarea no encontrada" });
        }

        // Actualizamos usando las columnas normalizadas
        await Tarea.update(
            { titulo, descripcion, estado_id, prioridad_id, responsable_id, tipo_id },
            { where: { id } }
        );

        // Devolver la tarea actualizada con sus relaciones para refrescar el Front
        const tareaActualizada = await Tarea.findByPk(id, {
            include: [
                { model: Prioridad, as: 'prioridad_detalle' },
                { model: EstadoTarea, as: 'estado_detalle' }
            ]
        });
        
        return res.json({
            mensaje: "Tarea actualizada",
            tarea: tareaActualizada
        });

    } catch (error) {
        console.error("Error al actualizar tarea:", error);
        return res.status(500).json({ mensaje: "Error al actualizar tarea" });
    }
};

// --- ELIMINAR TAREA (DELETE) ---
const eliminarTarea = async (req, res) => {
    try {
        const { id } = req.params;

        const tarea = await Tarea.findByPk(id);
        if (!tarea) {
            return res.status(404).json({ mensaje: "Tarea no encontrada" });
        }

        await Tarea.destroy({ where: { id } });

        return res.json({ mensaje: "Tarea eliminada correctamente" });

    } catch (error) {
        console.error("Error al eliminar tarea:", error);
        return res.status(500).json({ mensaje: "Error al eliminar tarea" });
    }
};

const obtenerTablasMaestras = async (req, res) => {
    try {
        const [prioridades, estados, tipos, estadosProyecto] = await Promise.all([
            Prioridad.findAll({ order: [['peso', 'ASC']] }),
            EstadoTarea.findAll(),
            TipoTarea.findAll(),
            EstadoProyecto.findAll()
        ]);

        return res.json({
            prioridades,
            estados,
            tipos,
            estadosProyecto
        });
    } catch (error) {
        console.error("Error al obtener tablas maestras:", error);
        return res.status(500).json({ mensaje: "Error al recuperar diccionarios de la DB" });
    }
};

module.exports = {
    crearTarea,
    obtenerTareasProyecto,
    actualizarTarea, 
    eliminarTarea,
    obtenerTablasMaestras
};