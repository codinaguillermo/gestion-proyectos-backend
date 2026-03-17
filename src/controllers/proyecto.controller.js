const { Op } = require('sequelize'); 
const { sequelize, Tarea, Proyecto, Usuario, Prioridad, EstadoTarea, TipoTarea, EstadoProyecto, UserStory, Rol, Escuela, Entregable } = require('../models');

// --- HELPER PARA CARGA DE INTEGRANTES ---
const includeIntegrantesConCarga = { 
    model: Usuario, 
    as: 'integrantes', 
    attributes: ['id', 'nombre', 'apellido', 'email', 'rol_id', 'curso', 'division', 'telefono'],
    where: { activo: true },
    include: [
        { model: Rol, attributes: ['nombre'] },
        {
            model: Tarea,
            // ⚠️ OJO ACÁ: Si en tu modelo la relación es 'tareas', cambialo a minúscula
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
                'fecha_cierre_1', 'fecha_cierre_2', 'created_at'
            ],
            include: [
                { model: EstadoProyecto, attributes: ['id', 'nombre'] },
                { model: Escuela, attributes: ['id', 'nombre_largo', 'nombre_corto'] },
                { model: Entregable, as: 'entregables' },
                // Usamos el helper con required: false para que NO rompa si el proyecto es nuevo
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
                'alcanceFinal', 'alcanceFinalBloqueado', 'fecha_cierre_1', 'fecha_cierre_2' 
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
const crearProyecto = async (req, res) => {
    try {
        const { nombre, descripcion, escuela_id, fecha_cierre_1, fecha_cierre_2 } = req.body;
        const usuarioId = req.usuario.id;
        const estadoInicial = await EstadoProyecto.findOne({ order: [['id', 'ASC']] });
        
        const nuevoProyecto = await Proyecto.create({
            nombre, descripcion, estado_id: estadoInicial.id, docente_owner_id: usuarioId, 
            escuela_id: escuela_id || null, fecha_cierre_1: fecha_cierre_1 || null, fecha_cierre_2: fecha_cierre_2 || null  
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
const actualizarProyecto = async (req, res) => {
    const t = await sequelize.transaction();
    try {
        const { id } = req.params;
        const usuarioLogueado = req.usuario; 
        const esDocente = Number(usuarioLogueado.rol_id) === 1 || Number(usuarioLogueado.rol_id) === 2;
        const { entregables, usuariosIds, ...datos } = req.body;

        const camposParaActualizar = {
            nombre: datos.nombre, descripcion: datos.descripcion,
            estado_id: datos.estado_id ? Number(datos.estado_id) : undefined,
            fecha_cierre_1: datos.fecha_cierre_1 === "" ? null : datos.fecha_cierre_1,
            fecha_cierre_2: datos.fecha_cierre_2 === "" ? null : datos.fecha_cierre_2,
            objetivo: datos.objetivo, alcancePrototipo: datos.alcancePrototipo, alcanceFinal: datos.alcanceFinal,
            objetivoBloqueado: esDocente ? datos.objetivoBloqueado : undefined,
            alcancePrototipoBloqueado: esDocente ? datos.alcancePrototipoBloqueado : undefined,
            alcanceFinalBloqueado: esDocente ? datos.alcanceFinalBloqueado : undefined
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

module.exports = { obtenerProyectoPorId, crearProyecto, obtenerProyectos, actualizarProyecto, eliminarProyecto };