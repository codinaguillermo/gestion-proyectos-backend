//const { Tarea, Proyecto, Usuario, Prioridad, EstadoTarea, TipoTarea } = require('../models');
//const { Tarea, Proyecto, Usuario, Prioridad, EstadoTarea, TipoTarea, EstadoProyecto } = require('../models');
const { Tarea, Proyecto, Usuario, Prioridad, EstadoTarea, TipoTarea, EstadoProyecto, UserStory } = require('../models');

// --- CREAR TAREA ---
const crearTarea = async (req, res) => {
    try {
        // Agregamos usId a la desestructuración
        const { titulo, descripcion, tipo_id, prioridad_id, proyecto_id, responsable_id, padre_id, usId } = req.body;

        // 1. Validaciones básicas (Ahora usId es obligatorio para el Backlog)
        if (!titulo || !proyecto_id || !usId) {
            return res.status(400).json({ mensaje: "Faltan datos: titulo, proyecto_id y usId son obligatorios" });
        }

        const estadoInicial = await EstadoTarea.findOne({ where: { nombre: 'BACKLOG' } });

        const nuevaTarea = await Tarea.create({
            titulo,
            descripcion,
            tipo_id,
            prioridad_id,
            proyecto_id,
            responsable_id,
            padre_id,
            usId, // Asignamos la User Story padre
            estado_id: estadoInicial ? estadoInicial.id : 1
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
// --- ACTUALIZAR TAREA (PUT) ---
const actualizarTarea = async (req, res) => {
    try {
        const { id } = req.params;
        // Agregamos los 4 candados de calidad y horasReales
        const { 
            titulo, descripcion, estado_id, prioridad_id, responsable_id, tipo_id,
            cumpleAceptacion, testeado, documentado, utilizable, horasReales 
        } = req.body;

        const tarea = await Tarea.findByPk(id);
        if (!tarea) {
            return res.status(404).json({ mensaje: "Tarea no encontrada" });
        }

        // Actualizamos incluyendo los nuevos campos de calidad
        await Tarea.update(
            { 
                titulo, descripcion, estado_id, prioridad_id, responsable_id, tipo_id,
                cumpleAceptacion, testeado, documentado, utilizable, horasReales
            },
            { where: { id } }
        );

        const tareaActualizada = await Tarea.findByPk(id, {
            include: [
                { model: Prioridad, as: 'prioridad_detalle' },
                { model: EstadoTarea, as: 'estado_detalle' },
                { model: UserStory, as: 'userStory' } // Opcional: para ver a qué US pertenece
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
// --- REGISTRAR INCREMENTO DE HORAS (Time Tracking) ---
const registrarAvanceHoras = async (req, res) => {
    try {
        const { id } = req.params;
        const { horasNuevas } = req.body; // Ejemplo: 2.5

        if (!horasNuevas || isNaN(horasNuevas)) {
            return res.status(400).json({ mensaje: "Debes enviar un número válido de horas" });
        }

        // 1. Buscamos la tarea actual
        const tarea = await Tarea.findByPk(id);
        if (!tarea) {
            return res.status(404).json({ mensaje: "Tarea no encontrada" });
        }

        // 2. Calculamos el nuevo total
        // Usamos parseFloat para asegurar que la suma sea aritmética y no de texto
        const totalAnterior = parseFloat(tarea.horasReales) || 0;
        const nuevoTotal = totalAnterior + parseFloat(horasNuevas);

        // 3. Actualizamos solo ese campo
        await Tarea.update(
            { horasReales: nuevoTotal },
            { where: { id } }
        );

        return res.json({
            mensaje: `Se sumaron ${horasNuevas}hs con éxito`,
            totalHoras: nuevoTotal
        });

    } catch (error) {
        console.error("Error al registrar horas:", error);
        return res.status(500).json({ mensaje: "Error al procesar la carga de horas" });
    }
};

module.exports = {
    crearTarea,
    obtenerTareasProyecto,
    actualizarTarea, 
    eliminarTarea,
    obtenerTablasMaestras,
    registrarAvanceHoras
};