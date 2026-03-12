const { Tarea, Proyecto, Usuario, Prioridad, EstadoTarea, TipoTarea, EstadoProyecto, UserStory } = require('../models');

// --- CREAR TAREA ---
const crearTarea = async (req, res) => {
    try {        
        const { 
            titulo, descripcion, horas_estimadas, tipo_id, prioridad_id, proyecto_id, responsable_id, padre_id, usId,
            estado_id, cumpleAceptacion, testeado, documentado, utilizable, horasReales,
            criterios_aceptacion, comentario_cierre, link_evidencia,
            dependenciasIds 
        } = req.body;

        // --- BLOQUEO AGRESIVO DE HORAS (CREAR) ---
        const hsValidar = Number(horas_estimadas);
        if (isNaN(hsValidar) || hsValidar <= 0) {
            console.log("Bloqueando creación: Horas en 0 o inválidas"); // Log para que lo veas en consola
            return res.status(400).json({ 
                mensaje: "Error de validación", 
                detalle: "Las horas estimadas deben ser mayores a 0 para crear la tarea." 
            });
        }

        if (!titulo || !proyecto_id || !usId) {
            return res.status(400).json({ mensaje: "Faltan datos: titulo, proyecto_id y usId son obligatorios" });
        }

        const estadoInicial = await EstadoTarea.findOne({ where: { nombre: 'BACKLOG' } });

        const nuevaTarea = await Tarea.create({
            titulo,
            descripcion,
            horas_estimadas: hsValidar,             
            tipo_id,
            prioridad_id,
            proyecto_id,
            responsable_id,
            padre_id,
            usId,
            estado_id: estado_id || (estadoInicial ? estadoInicial.id : 1),
            horasReales: horasReales || 0,
            cumpleAceptacion: cumpleAceptacion || false,
            testeado: testeado || false,
            documentado: documentado || false,
            utilizable: utilizable || false,
            criteriosAceptacion: criterios_aceptacion,
            comentarioCierre: comentario_cierre,
            linkEvidencia: link_evidencia
        });

        if (dependenciasIds && dependenciasIds.length > 0) {
            await nuevaTarea.setRequisitos(dependenciasIds);
        }

        return res.status(201).json({ mensaje: "Tarea creada con éxito", tarea: nuevaTarea });

    } catch (error) {
        console.error("Error creando tarea:", error);
        return res.status(500).json({ mensaje: "Error al crear la tarea", error: error.message });
    }
};

// --- ACTUALIZAR TAREA (PUT) ---
const actualizarTarea = async (req, res) => {
    try {
        const { id } = req.params;
        const usuarioLogueado = req.usuario; 
        const { 
            titulo, descripcion, estado_id, prioridad_id, responsable_id, tipo_id,
            horas_estimadas,
            cumpleAceptacion, testeado, documentado, utilizable, horasReales,
            criterios_aceptacion, comentario_cierre, link_evidencia,
            dependenciasIds 
        } = req.body;

        // --- BLOQUEO AGRESIVO DE HORAS (ACTUALIZAR) ---
        const hsValidar = Number(horas_estimadas);
        if (isNaN(hsValidar) || hsValidar <= 0) {
            console.log("Bloqueando actualización: Horas en 0 o inválidas");
            return res.status(400).json({ 
                mensaje: "Error de validación", 
                detalle: "No se permite guardar una tarea con 0 horas estimadas." 
            });
        }

        const tarea = await Tarea.findByPk(id, { include: [{ model: Proyecto }] });
        if (!tarea) return res.status(404).json({ mensaje: "Tarea no encontrada" });

        // --- REGLAS DE NEGOCIO (ESTADOS Y TIEMPOS) ---
        const estadoAnterior = Number(tarea.estado_id);
        const estadoNuevo = Number(estado_id);
        let nuevaFechaInicio = tarea.fechaInicioReal;
        let nuevaFechaFin = tarea.fechaFinReal;

        if (estadoAnterior === 1 && estadoNuevo !== 1 && !nuevaFechaInicio) { nuevaFechaInicio = new Date(); }
        if (estadoNuevo === 4 && !nuevaFechaFin) { nuevaFechaFin = new Date(); }
        if (estadoAnterior === 4 && estadoNuevo !== 4) { nuevaFechaFin = null; }

        if (estadoAnterior === 1 && estadoNuevo === 4) {
            return res.status(400).json({ mensaje: "Flujo inválido", detalle: "Debe pasar por revisión primero." });
        }

        // --- PERMISOS ---
        const esAdmin = usuarioLogueado.rol_id === 1;
        const esDocente = usuarioLogueado.rol_id === 2; 
        const esResponsable = tarea.responsable_id === usuarioLogueado.id;

        if (!esAdmin && !esDocente) {
            if (!esResponsable) return res.status(403).json({ mensaje: "Acceso denegado." });
        }

        let horasFinales = horasReales;
        if (estadoAnterior === 4 || estadoNuevo === 1) { horasFinales = tarea.horasReales; }

        // --- ACTUALIZACIÓN ---
        await Tarea.update(
            { 
                titulo, descripcion, estado_id, prioridad_id, responsable_id, tipo_id,
                horas_estimadas: hsValidar,
                cumpleAceptacion, testeado, documentado, utilizable, 
                horasReales: horasFinales,
                fechaInicioReal: nuevaFechaInicio,
                fechaFinReal: nuevaFechaFin,
                criteriosAceptacion: criterios_aceptacion,
                comentarioCierre: comentario_cierre,
                linkEvidencia: link_evidencia
            },
            { where: { id } }
        );

        if (dependenciasIds) {
            await tarea.setRequisitos(dependenciasIds);
        }

        const tareaActualizada = await Tarea.findByPk(id, {
            include: [
                { model: Prioridad, as: 'prioridad_detalle' },
                { model: EstadoTarea, as: 'estado_detalle' },
                { model: UserStory, as: 'userStory' }
            ]
        });
        
        return res.json({ mensaje: "Tarea actualizada correctamente", tarea: tareaActualizada });

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
        const usuarioLogueado = req.usuario;

        const tarea = await Tarea.findByPk(id);
        if (!tarea) {
            return res.status(404).json({ mensaje: "Tarea no encontrada" });
        }

        const esAdmin = usuarioLogueado.rol_id === 1;
        const esDocente = usuarioLogueado.rol_id === 2;
        const esResponsable = tarea.responsable_id === usuarioLogueado.id;

        if (!esAdmin && !esDocente) {
            if (!esResponsable) {
                return res.status(403).json({ 
                    mensaje: "Acceso denegado", 
                    detalle: "No tienes permiso para eliminar tareas de otros compañeros." 
                });
            }
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
        const { horasNuevas } = req.body;

        if (!horasNuevas || isNaN(horasNuevas)) {
            return res.status(400).json({ mensaje: "Debes enviar un número válido de horas" });
        }

        const tarea = await Tarea.findByPk(id);
        if (!tarea) {
            return res.status(404).json({ mensaje: "Tarea no encontrada" });
        }

        const totalAnterior = parseFloat(tarea.horasReales) || 0;
        const nuevoTotal = totalAnterior + parseFloat(horasNuevas);

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

// --- OBTENER TODAS LAS TAREAS ---
const obtenerTodasLasTareas = async (req, res) => {
    try {
        const tareas = await Tarea.findAll({
            include: [
                { model: Prioridad, as: 'prioridad_detalle' },
                { model: EstadoTarea, as: 'estado_detalle' },
                { model: Usuario, as: 'responsable', attributes: ['id', 'nombre'] }
            ]
        });
        return res.json(tareas);
    } catch (error) {
        console.error("Error al obtener todas las tareas:", error);
        return res.status(500).json({ mensaje: "Error al obtener el listado global de tareas" });
    }
};

// --- OBTENER TAREA POR ID ---
const obtenerTareaPorId = async (req, res) => {
    try {
        const { id } = req.params;
        const tarea = await Tarea.findByPk(id, {
            include: [
                { model: EstadoTarea, as: 'estado_detalle' },
                { model: Usuario, as: 'responsable', attributes: ['id', 'nombre', 'apellido'] },
                { model: Prioridad, as: 'prioridad_detalle' },
                { model: TipoTarea, as: 'tipo_detalle' },
                { 
                    model: Tarea, 
                    as: 'requisitos', 
                    through: { attributes: [] } 
                }
            ]
        });

        if (!tarea) return res.status(404).json({ mensaje: "Tarea no encontrada" });
        res.json(tarea);
    } catch (error) {
        console.error("Error en obtenerTareaPorId:", error);
        res.status(500).json({ mensaje: "Error del servidor", error: error.message });
    }
};

module.exports = {
    crearTarea,
    obtenerTareasProyecto,
    actualizarTarea, 
    eliminarTarea,
    obtenerTablasMaestras,
    obtenerTodasLasTareas,
    registrarAvanceHoras,
    obtenerTareaPorId
};