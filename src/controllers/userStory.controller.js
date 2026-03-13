const { 
    UserStory, 
    Proyecto, 
    PrioridadUS, 
    EstadoUS, 
    Tarea, 
    EstadoTarea, 
    Usuario,
    sequelize // Importamos sequelize para las transacciones
} = require('../models');

// --- CREAR USER STORY ---
const crearUserStory = async (req, res) => {
    try {
        // Agregamos fecha_entrega al destructuring
        const { proyecto_id, titulo, descripcion, condiciones, prioridad_id, estado_id, fecha_entrega } = req.body;

        const proyecto = await Proyecto.findByPk(proyecto_id);
        if (!proyecto) {
            return res.status(404).json({ mensaje: "Proyecto no encontrado" });
        }

        const nuevaUS = await UserStory.create({
            proyecto_id,
            titulo,
            descripcion,
            condiciones,
            prioridad_id,
            estado_id: estado_id || 1,
            fecha_entrega // Nuevo campo persistido
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

        if (!story) {
            return res.status(404).json({ mensaje: "User Story no encontrada" });
        }

        return res.json(story);
    } catch (error) {
        console.error("Error al obtener User Story por ID:", error);
        return res.status(500).json({ mensaje: "Error al obtener US", detalle: error.message });
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
                        // FIX: Agregamos 'apellido' aquí
                        { model: Usuario, as: 'responsable', attributes: ['id', 'nombre', 'apellido'] }, 
                        { model: EstadoTarea, as: 'estado_detalle', attributes: ['id', 'nombre'] }
                    ]
                }
            ],
            order: [['id', 'ASC']] 
        });
        return res.json(stories);
    } catch (error) {
        console.error("DETALLE DEL ERROR 500:", error); 
        return res.status(500).json({ mensaje: "Error al obtener US", detalle: error.message });
    }
};

// --- ACTUALIZAR USER STORY (CON BLOQUEO Y ATOMICIDAD) ---
const actualizarUserStory = async (req, res) => {
    // Iniciamos transacción para que el cambio de datos y dependencias sea atómico
    const t = await sequelize.transaction();
    
    try {
        const { id } = req.params;
        // Agregamos fecha_entrega y dependenciasIds al body
        const { titulo, descripcion, condiciones, prioridad_id, estado_id, fecha_entrega, dependenciasIds } = req.body;

        const us = await UserStory.findByPk(id);
        if (!us) {
            await t.rollback();
            return res.status(404).json({ mensaje: "User Story no encontrada" });
        }

        // --- VALIDACIÓN DE ESTADO 4 (Mantenemos tu lógica) ---
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

        // --- ACTUALIZACIÓN DE DATOS ---
        await us.update({ 
            titulo, 
            descripcion, 
            condiciones, 
            prioridad_id, 
            estado_id, 
            fecha_entrega 
        }, { transaction: t });

        // --- GESTIÓN DE DEPENDENCIAS (N:M) ---
        // dependenciasIds debe ser un array de IDs: [1, 4, 8]
        if (Array.isArray(dependenciasIds)) {
            // setPredecesoras es un método mágico que crea Sequelize por el alias 'predecesoras' en index.js
            await us.setPredecesoras(dependenciasIds, { transaction: t });
        }

        await t.commit();
        return res.json({ mensaje: "User Story actualizada correctamente", us });

    } catch (error) {
        await t.rollback();
        console.error("ERROR EN CONTROLADOR:", error);
        return res.status(500).json({ mensaje: "Error del servidor", detalle: error.message });
    }
};

const eliminarUserStory = async (req, res) => {
    try {
        const { id } = req.params;
        // Primero borramos las dependencias en la tabla intermedia manualmente si no confias en ON DELETE CASCADE
        // (Aunque Sequelize con a través de 'us_dependencias' debería manejarlo)
        await Tarea.destroy({ where: { us_id: id } });
        const resultado = await UserStory.destroy({ where: { id } });

        if (resultado === 0) {
            return res.status(404).json({ mensaje: "No se encontró la User Story" });
        }
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
    eliminarUserStory ,
    obtenerUserStoryPorId
};