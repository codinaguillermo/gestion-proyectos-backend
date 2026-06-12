const { Op } = require('sequelize'); 
const { sequelize, Tarea, Proyecto, Usuario, Prioridad, EstadoTarea, TipoTarea, EstadoProyecto, UserStory, Rol, Escuela, Entregable, HitoEvaluacion, CalificacionProyecto } = require('../models');

// --- HELPER PARA CARGA DE INTEGRANTES ---
const includeIntegrantesConCarga = { 
    model: Usuario, 
    as: 'integrantes',     
    attributes: ['id', 'nombre', 'apellido', 'email', 'rol_id', 'curso', 'division', 'telefono', 'especialidad_id'],
    where: { activo: true },
    include: [
        { model: Rol, attributes: ['nombre'] },
        {
            model: Tarea,
            as: 'Tareas', 
            attributes: ['id', 'prioridad_id', 'estado_id'],
            where: {
                estado_id: { [Op.ne]: 4 } // Que no estén finalizadas/canceladas
            },
            required: false 
        }
    ],
    through: { attributes: [] } 
};

// --- 1. OBTENER UN PROYECTO POR ID (PARA VISUALIZACIÓN Y EDICIÓN) ---
/**
 * @propósito Obtiene un proyecto específico incluyendo su viabilidad, documentación de respaldo y repositorio Drive (v2.9.0).
 * @alimenta a: ProyectoConfigView.vue y DetalleProyecto
 * @retorna Objeto Proyecto completo con relaciones
 */
const obtenerProyectoPorId = async (req, res) => {
    try {
        const { id } = req.params;
        const usuarioLogueado = req.usuario;

        const proyecto = await Proyecto.findByPk(id, {
            attributes: [
                'id', 'nombre', 'descripcion', 'estado_id', 'docente_owner_id', 'escuela_id',
                'objetivo', 'objetivoBloqueado', 
                'alcancePrototipo', 'alcancePrototipoBloqueado',
                'alcanceFinal', 'alcanceFinalBloqueado',
                'fecha_cierre_1', 'fecha_cierre_2', 'created_at',
                'viable', 'documentoViabilidadLink',
                'linkDrive' // NUEVO v2.9.0: Incluido para que viaje al frontend
            ],
            include: [
                { model: EstadoProyecto, attributes: ['id', 'nombre'] },
                { model: Escuela, attributes: ['id', 'nombre_largo', 'nombre_corto'] },
                { model: Entregable, as: 'entregables' },
                { ...includeIntegrantesConCarga, required: false }
            ]
        });

        if (!proyecto) return res.status(404).json({ mensaje: "Proyecto no encontrado" });

        const miId = Number(usuarioLogueado.id);
        const miRol = Number(usuarioLogueado.rol_id);
        
        const esAdmin = miRol === 1;
        const esOwner = Number(proyecto.docente_owner_id) === miId;
        const esMiembro = proyecto.integrantes?.some(i => Number(i.id) === miId);

        if (esAdmin || esOwner || esMiembro) {
            return res.json(proyecto);
        } else {
            return res.status(403).json({ mensaje: "Acceso denegado a este proyecto." });
        }
    } catch (error) {
        console.error("ERROR EN obtenerProyectoPorId:", error);
        return res.status(500).json({ mensaje: "Error del servidor", detalle: error.message });
    }
};

// --- 2. LISTADO DE PROYECTOS ---
/**
 * @propósito Lista proyectos según permisos del usuario, incluyendo campos vitales y linkDrive (v2.9.0).
 * @alimenta a: Dashboard.vue
 * @retorna Array de objetos Proyecto
 */
const obtenerProyectos = async (req, res) => {
    try {
        const { id, rol_id } = req.usuario;
        let condicion = {};

        if (Number(rol_id) !== 1) {
            const participaciones = await Proyecto.findAll({
                attributes: ['id'],
                include: [{
                    model: Usuario, as: 'integrantes', where: { id: id }, attributes: [], through: { attributes: [] }
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
        
        const proyectos = await Proyecto.findAll({
            where: condicion,
            attributes: [
                'id', 'nombre', 'descripcion', 'estado_id', 'docente_owner_id', 'escuela_id', 'created_at',
                'objetivo', 'objetivoBloqueado', 'alcancePrototipo', 'alcancePrototipoBloqueado',
                'alcanceFinal', 'alcanceFinalBloqueado', 'fecha_cierre_1', 'fecha_cierre_2',
                'viable', 'documentoViabilidadLink',
                'linkDrive' // NUEVO v2.9.0: Incluido para listados generales
            ],
            include: [
                { model: EstadoProyecto, attributes: ['id', 'nombre'] },
                { model: Escuela, attributes: ['id', 'nombre_largo', 'nombre_corto'] }, 
                { model: UserStory, as: 'userStories' },
                { model: Entregable, as: 'entregables' },
                { ...includeIntegrantesConCarga, required: false } 
            ],
            order: [['created_at', 'DESC']],
            subQuery: false 
        });
        return res.json(proyectos);
    } catch (error) {
        return res.status(500).json({ mensaje: "Error al obtener proyectos" });
    }
};

// --- 3. CREAR PROYECTO ---
/**
 * @propósito Crea un nuevo proyecto inicializando los campos básicos.
 * @alimenta a: Dashboard.vue (Modal Nuevo Proyecto)
 * @retorna Objeto Proyecto creado
 */
const crearProyecto = async (req, res) => {
    try {
        const { nombre, descripcion, escuela_id, fecha_cierre_1, fecha_cierre_2 } = req.body;
        const usuarioId = req.usuario.id;
        const estadoInicial = await EstadoProyecto.findOne({ order: [['id', 'ASC']] });
        
        const nuevoProyecto = await Proyecto.create({
            nombre, 
            descripcion, 
            estado_id: estadoInicial.id, 
            docente_owner_id: usuarioId, 
            escuela_id: escuela_id || null, 
            fecha_cierre_1: fecha_cierre_1 || null, 
            fecha_cierre_2: fecha_cierre_2 || null,
            viable: false // Inicialización explícita
        });
        
        await nuevoProyecto.addIntegrante(usuarioId);
        
        const proyectoConRelacion = await Proyecto.findByPk(nuevoProyecto.id, {
            include: [
                { model: EstadoProyecto, attributes: ['id', 'nombre'] },
                { model: Escuela, attributes: ['nombre_largo', 'nombre_corto'] },
                { model: Entregable, as: 'entregables' },
                { ...includeIntegrantesConCarga, required: false } 
            ]
        });
        return res.status(201).json(proyectoConRelacion);
    } catch (error) {
        return res.status(500).json({ mensaje: "Error al crear proyecto" });
    }
};

// --- 4. ACTUALIZAR PROYECTO ---
/**
 * @propósito Actualiza datos del proyecto. Docentes gestionan estados de bloqueo, viabilidad y linkDrive (v2.9.0). Alumnos solo lectura de campos restringidos.
 * @alimenta a: ProyectoConfigView.vue
 * @retorna Objeto con mensaje de éxito y el proyecto actualizado
 */
const actualizarProyecto = async (req, res) => {
    const t = await sequelize.transaction();
    try {
        const { id } = req.params;
        const usuarioLogueado = req.usuario; 
        const esDocente = Number(usuarioLogueado.rol_id) === 1 || Number(usuarioLogueado.rol_id) === 2;
        const { entregables, usuariosIds, ...datos } = req.body;

        const camposParaActualizar = {
            nombre: datos.nombre, 
            descripcion: datos.descripcion,
            estado_id: datos.estado_id ? Number(datos.estado_id) : undefined,
            fecha_cierre_1: datos.fecha_cierre_1 === "" ? null : datos.fecha_cierre_1,
            fecha_cierre_2: datos.fecha_cierre_2 === "" ? null : datos.fecha_cierre_2,
            objetivo: datos.objetivo, 
            alcanceFinal: datos.alcanceFinal,            
            
            // Solo docentes pueden modificar estados de bloqueo y links institucionales
            objetivoBloqueado: esDocente ? datos.objetivoBloqueado : undefined,
            alcanceFinalBloqueado: esDocente ? datos.alcanceFinalBloqueado : undefined,
            viable: esDocente ? datos.viable : undefined,
            documentoViabilidadLink: datos.documentoViabilidadLink,
            linkDrive: esDocente ? datos.linkDrive : undefined // NUEVO v2.9.0: Blindado contra alumnos
        };

        await Proyecto.update(camposParaActualizar, { where: { id }, transaction: t });

        const proyectoInstancia = await Proyecto.findByPk(id, { include: [{ model: Usuario, as: 'integrantes' }] });

        if (usuariosIds && (esDocente || proyectoInstancia.integrantes?.some(i => i.id === usuarioLogueado.id))) {
            await proyectoInstancia.setIntegrantes(usuariosIds, { transaction: t });
        }

        if (entregables && Array.isArray(entregables)) {
            const idsRecibidos = entregables.filter(e => e.id).map(e => Number(e.id));
            await Entregable.destroy({ where: { proyecto_id: id, id: { [Op.notIn]: idsRecibidos } }, transaction: t });
            for (const ent of entregables) {
                if (ent.id) {
                    await Entregable.update({ nombre: ent.nombre, link_drive: ent.link_drive }, { where: { id: ent.id }, transaction: t });
                } else {
                    await Entregable.create({ nombre: ent.nombre, link_drive: ent.link_drive, proyecto_id: id }, { transaction: t });
                }
            }
        }
        await t.commit();
        
        const proyectoActualizado = await Proyecto.findByPk(id, {
            include: [
                { model: EstadoProyecto, attributes: ['id', 'nombre'] },
                { model: Escuela, attributes: ['id', 'nombre_largo', 'nombre_corto'] },
                { model: Entregable, as: 'entregables' },
                { ...includeIntegrantesConCarga, required: false } 
            ]
        });
        return res.json({ mensaje: "Proyecto actualizado con éxito", proyecto: proyectoActualizado });
    } catch (error) {
        if (t) await t.rollback();
        console.error("ERROR EN actualizarProyecto:", error);
        return res.status(500).json({ mensaje: "Error al actualizar" });
    }
};

const eliminarProyecto = async (req, res) => {
    try {
        const { id } = req.params;
        const proyecto = await Proyecto.findByPk(id, {
            include: [{ model: UserStory, as: 'userStories', include: [{ model: Tarea, as: 'tareas' }] }]
        });
        if (!proyecto) return res.status(404).json({ mensaje: "Proyecto no encontrado" });
        if (proyecto.userStories) {
            for (const us of proyecto.userStories) {
                await Tarea.destroy({ where: { us_id: us.id } });
                await us.destroy();
            }
        }
        await proyecto.destroy();
        return res.json({ mensaje: "Proyecto eliminado con éxito" });
    } catch (error) {
        return res.status(500).json({ mensaje: "Error al eliminar" });
    }
};

// ============================================================================
// --- FUNCIONES NUEVAS v2.6.0: SEGUIMIENTO HISTÓRICO DE CALIFICACIONES -------
// ============================================================================

/**
 * @propósito Recuperar el historial cronológico de notas asentadas sobre un proyecto.
 * @alimenta Invocada por las rutas operativas para listar las notas en el frontend.
 * @retorna Array de objetos CalificacionProyecto con los detalles del hito y del docente calificador.
 */
const obtenerCalificacionesProyecto = async (req, res) => {
    try {
        const { id } = req.params;

        const calificaciones = await CalificacionProyecto.findAll({
            where: { proyecto_id: id },
            attributes: ['id', 'proyecto_id', 'hito_id', 'usuario_id', 'nota', 'descripcion', 'fecha'],
            include: [
                { model: HitoEvaluacion, as: 'hito_detalle', attributes: ['id', 'nombre'] },
                { model: Usuario, as: 'docente_calificador', attributes: ['id', 'nombre', 'apellido'] }
            ],
            // Ahora ordena por la fecha de evaluación real que cargó el profe
            order: [['fecha', 'DESC']] 
        });

        return res.json(calificaciones);
    } catch (error) {
        console.error("ERROR EN obtenerCalificacionesProyecto:", error);
        return res.status(500).json({ mensaje: "Error al obtener el historial de calificaciones" });
    }
};

/**
 * @propósito Registrar de forma segura un nuevo hito de calificación académica para el proyecto, usando la fecha de evaluación manual.
 * @alimenta Formulario de asignación de notas en la interfaz docente.
 * @retorna Objeto con mensaje de éxito y el registro de la calificación creada.
 */
const registrarCalificacionProyecto = async (req, res) => {
    try {
        const { id } = req.params; // proyecto_id
        
        // Atrapamos la fecha manual acá
        const { hito_id, nota, descripcion, fecha_evaluacion } = req.body; 
        const usuarioLogueado = req.usuario;

        const miRol = Number(usuarioLogueado.rol_id);
        if (miRol !== 1 && miRol !== 2) {
            return res.status(403).json({ mensaje: "Operación rechazada. Solo el personal docente posee permisos de evaluación." });
        }

        if (!fecha_evaluacion) {
            return res.status(400).json({ mensaje: "La fecha de evaluación es obligatoria." });
        }

        const valorNota = parseFloat(nota);
        if (isNaN(valorNota) || valorNota < 0.00 || valorNota > 10.00) {
            return res.status(400).json({ mensaje: "La calificación cuantitativa debe comprenderse de forma estricta entre 0.00 y 10.00." });
        }

        const nuevaCalificacion = await CalificacionProyecto.create({
            proyecto_id: Number(id),
            hito_id: Number(hito_id),
            usuario_id: Number(usuarioLogueado.id),
            nota: valorNota,
            descripcion: descripcion || null,
            // Insertamos la fecha manual en lugar de new Date()
            fecha: fecha_evaluacion 
        });

        const registroCompleto = await CalificacionProyecto.findByPk(nuevaCalificacion.id, {
            include: [
                { model: HitoEvaluacion, as: 'hito_detalle', attributes: ['id', 'nombre'] },
                { model: Usuario, as: 'docente_calificador', attributes: ['id', 'nombre', 'apellido'] }
            ]
        });

        return res.status(201).json({ mensaje: "Calificación académica asentada con éxito.", calificacion: registroCompleto });
    } catch (error) {
        console.error("ERROR EN registrarCalificacionProyecto:", error);
        return res.status(500).json({ mensaje: "Error del servidor al registrar la calificación académica." });
    }
};

// ============================================================================
// --- FUNCIONES NUEVAS v2.9.1: EDICIÓN Y ELIMINACIÓN DE NOTAS GRUPALES -------
// ============================================================================

/**
 * @propósito Modifica un registro de calificación grupal existente (nota, fecha u observación).
 * @alimenta Modal de edición en ProyectoConfigView.vue.
 * @retorna Objeto con mensaje de éxito y la nota actualizada.
 */
const actualizarCalificacionProyecto = async (req, res) => {
    try {
        const { id, calificacionId } = req.params; // id = proyecto_id
        const { nota, descripcion, fecha_evaluacion } = req.body;
        const usuarioLogueado = req.usuario;

        const miRol = Number(usuarioLogueado.rol_id);
        if (miRol !== 1 && miRol !== 2) {
            return res.status(403).json({ mensaje: "Operación rechazada. Solo el personal docente posee permisos de evaluación." });
        }

        const calificacion = await CalificacionProyecto.findOne({
            where: { id: calificacionId, proyecto_id: id }
        });

        if (!calificacion) {
            return res.status(404).json({ mensaje: "Registro de calificación no encontrado en este proyecto." });
        }

        if (!fecha_evaluacion) {
            return res.status(400).json({ mensaje: "La fecha de evaluación es obligatoria." });
        }

        const valorNota = parseFloat(nota);
        if (isNaN(valorNota) || valorNota < 0.00 || valorNota > 10.00) {
            return res.status(400).json({ mensaje: "La calificación cuantitativa debe comprenderse de forma estricta entre 0.00 y 10.00." });
        }

        await calificacion.update({
            nota: valorNota,
            descripcion: descripcion || null,
            fecha: fecha_evaluacion
        });

        res.json({ mensaje: "Calificación grupal actualizada con éxito.", calificacion });
    } catch (error) {
        console.error("ERROR EN actualizarCalificacionProyecto:", error);
        return res.status(500).json({ mensaje: "Error del servidor al actualizar la calificación." });
    }
};

/**
 * @propósito Elimina físicamente un registro de calificación grupal mal cargado.
 * @alimenta Confirmación de borrado en ProyectoConfigView.vue.
 * @retorna Mensaje de éxito.
 */
const eliminarCalificacionProyecto = async (req, res) => {
    try {
        const { id, calificacionId } = req.params; // id = proyecto_id
        const usuarioLogueado = req.usuario;

        const miRol = Number(usuarioLogueado.rol_id);
        if (miRol !== 1 && miRol !== 2) {
            return res.status(403).json({ mensaje: "Operación rechazada. Solo el personal docente posee permisos de evaluación." });
        }

        const calificacion = await CalificacionProyecto.findOne({
            where: { id: calificacionId, proyecto_id: id }
        });

        if (!calificacion) {
            return res.status(404).json({ mensaje: "Registro de calificación no encontrado en este proyecto." });
        }

        await calificacion.destroy();

        res.json({ mensaje: "Calificación grupal eliminada correctamente." });
    } catch (error) {
        console.error("ERROR EN eliminarCalificacionProyecto:", error);
        return res.status(500).json({ mensaje: "Error del servidor al eliminar la calificación." });
    }
};

module.exports = { 
    obtenerProyectoPorId, 
    crearProyecto, 
    obtenerProyectos, 
    actualizarProyecto, 
    eliminarProyecto,
    obtenerCalificacionesProyecto,
    registrarCalificacionProyecto,
    actualizarCalificacionProyecto,
    eliminarCalificacionProyecto
};