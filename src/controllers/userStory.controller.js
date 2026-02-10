const { 
    UserStory, 
    Proyecto, 
    PrioridadUS, 
    EstadoUS, 
    Tarea, 
    EstadoTarea, 
    Usuario 
} = require('../models');


// --- CREAR USER STORY ---
const crearUserStory = async (req, res) => {
    try {
        const { proyecto_id, titulo, descripcion, condiciones, prioridad_id, estado_id } = req.body;

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
            estado_id: estado_id || 1
        });

        return res.status(201).json(nuevaUS);
    } catch (error) {
        console.error("Error al crear User Story:", error);
        return res.status(500).json({ mensaje: "Error al crear User Story", detalle: error.message });
    }
};

// --- OBTENER USER STORIES POR PROYECTO ---
const obtenerUserStoriesPorProyecto = async (req, res) => {
    try {
        const { proyectoId } = req.params;
        const stories = await UserStory.findAll({
            where: { proyecto_id: proyectoId },
            attributes: ['id', 'titulo', 'descripcion', 'condiciones', 'prioridad_id', 'estado_id', 'proyecto_id'],
            include: [
                { model: PrioridadUS, as: 'prioridad_detalle' },
                { model: EstadoUS, as: 'estado_detalle' },
                { 
                    model: Tarea, 
                    as: 'tareas',
                    include: [
                        { 
                            model: Usuario, 
                            as: 'responsable', // Este alias debe coincidir con index.js
                            attributes: ['id', 'nombre'] 
                        },
                        { 
                            model: EstadoTarea, 
                            as: 'estado_detalle', // Este alias debe coincidir con index.js
                            attributes: ['id', 'nombre'] 
                        }
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

// --- ELIMINAR USER STORY ---
const eliminarUserStory = async (req, res) => {
    try {
        const { id } = req.params;
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

// --- ACTUALIZAR USER STORY (CON BLOQUEO REAL) ---
const actualizarUserStory = async (req, res) => {
    try {
        const { id } = req.params;
        const { titulo, descripcion, condiciones, prioridad_id, estado_id } = req.body;

        console.log("--- INICIO VALIDACIÓN ---");
        console.log("ID US:", id);
        console.log("Estado que llega del Front (estado_id):", estado_id, "Tipo:", typeof estado_id);

        const us = await UserStory.findByPk(id);
        if (!us) return res.status(404).json({ mensaje: "User Story no encontrada" });

        // REGLA: Si intentan pasar a Terminada (ID 4)
        if (Number(estado_id) === 4) {
            console.log("Detectado intento de pasar a estado 4 (Terminada).");

            // Buscamos tareas de esta US
            const tareas = await Tarea.findAll({
                where: { us_id: id }
            });

            console.log(`Se encontraron ${tareas.length} tareas para esta US.`);

            // Miramos los estados de las tareas encontradas
            const tareasPendientes = tareas.filter(t => {
                console.log(`Tarea ID: ${t.id} - Estado Actual: ${t.estado_id}`);
                return Number(t.estado_id) !== 4;
            });

            if (tareasPendientes.length > 0) {
                console.log("BLOQUEO ACTIVADO: Hay tareas que no son estado 4.");
                return res.status(400).json({ 
                    mensaje: "No se puede terminar la US",
                    detalle: `Aún quedan ${tareasPendientes.length} tareas sin completar.` 
                });
            }
        }

        console.log("Validación superada. Actualizando...");
        await us.update({ titulo, descripcion, condiciones, prioridad_id, estado_id });

        return res.json({ mensaje: "User Story actualizada correctamente", us });

    } catch (error) {
        console.error("ERROR EN CONTROLADOR:", error);
        return res.status(500).json({ mensaje: "Error del servidor", detalle: error.message });
    }
};

module.exports = {
    crearUserStory,
    obtenerUserStoriesPorProyecto,
    actualizarUserStory,
    eliminarUserStory 
};