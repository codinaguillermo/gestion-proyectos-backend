const { Op } = require('sequelize'); 
const { Tarea, Proyecto, Usuario, Prioridad, EstadoTarea, TipoTarea, EstadoProyecto, UserStory, Rol, Escuela } = require('../models');

const includeIntegrantesConCarga = { 
    model: Usuario, 
    as: 'integrantes', 
    attributes: ['id', 'nombre', 'apellido', 'email', 'rol_id', 'curso', 'division'],
    include: [
        { model: Rol, attributes: ['nombre'] },
        {
            model: Tarea,
            as: 'Tareas',
            attributes: ['id', 'prioridad_id', 'estado_id'],
            where: {
                estado_id: { [Op.ne]: 4 } 
            },
            required: false 
        }
    ],
    through: { attributes: [] } 
};

const obtenerProyectoPorId = async (req, res) => {
    try {
        const { id } = req.params;
        const proyecto = await Proyecto.findByPk(id, {
            attributes: ['id', 'nombre', 'descripcion', 'docente_owner_id', 'escuela_id'],
            include: [
                { model: EstadoProyecto, attributes: ['nombre'] },
                { model: Escuela, attributes: ['id', 'nombre_largo', 'nombre_corto'] }, 
                includeIntegrantesConCarga 
            ]
        });
        if (!proyecto) return res.status(404).json({ mensaje: "Proyecto no encontrado" });
        return res.json(proyecto);
    } catch (error) {
        console.error("Error al obtener proyecto por ID:", error);
        return res.status(500).json({ mensaje: "Error del servidor" });
    }
};

const crearProyecto = async (req, res) => {
    try {
        const { nombre, descripcion, escuela_id } = req.body;
        const usuarioId = req.usuario.id;

        const estadoInicial = await EstadoProyecto.findOne({ order: [['id', 'ASC']] });
        if (!estadoInicial) return res.status(500).json({ mensaje: "Falta configurar estados" });

        const nuevoProyecto = await Proyecto.create({
            nombre,
            descripcion,
            estado_id: estadoInicial.id,
            docente_owner_id: usuarioId,
            escuela_id: escuela_id || null 
        });

        await nuevoProyecto.addIntegrante(usuarioId); 

        const proyectoConRelacion = await Proyecto.findByPk(nuevoProyecto.id, {
            include: [
                { model: EstadoProyecto, attributes: ['nombre'] },
                { model: Escuela, attributes: ['nombre_largo', 'nombre_corto'] },
                includeIntegrantesConCarga 
            ]
        });

        return res.status(201).json(proyectoConRelacion);
    } catch (error) {
        console.error("Error al crear proyecto:", error); 
        return res.status(500).json({ mensaje: "Error al crear proyecto" });
    }
};

const obtenerProyectos = async (req, res) => {
    try {
        const { id, rol_id } = req.usuario;
        let condicion = {};

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
            condicion = { [Op.or]: [{ docente_owner_id: id }, { id: { [Op.in]: ids } }] };
        }

        const proyectos = await Proyecto.findAll({
            where: condicion,
            attributes: ['id', 'nombre', 'descripcion', 'estado_id', 'docente_owner_id', 'escuela_id', 'created_at'],
            include: [
                { model: EstadoProyecto, attributes: ['id', 'nombre'] },
                { model: Escuela, attributes: ['id', 'nombre_largo', 'nombre_corto'] }, 
                { model: UserStory, as: 'userStories' },
                includeIntegrantesConCarga 
            ],
            order: [['created_at', 'DESC']]
        });

        return res.json(proyectos);
    } catch (error) {
        console.error("Error en obtenerProyectos:", error);
        return res.status(500).json({ mensaje: "Error" });
    }
};

const actualizarProyecto = async (req, res) => {
    try {
        const { id } = req.params;
        const { nombre, descripcion, estado_id, usuariosIds, escuela_id } = req.body;

        const proyecto = await Proyecto.findByPk(id);
        if (!proyecto) return res.status(404).json({ mensaje: "Proyecto no encontrado" });

        await proyecto.update({ nombre, descripcion, estado_id, escuela_id });

        if (usuariosIds) {
            await proyecto.setIntegrantes(usuariosIds); 
        }

        const proyectoActualizado = await Proyecto.findByPk(id, {
            include: [
                { model: EstadoProyecto, attributes: ['nombre'] },
                { model: Escuela, attributes: ['nombre_largo', 'nombre_corto'] },
                includeIntegrantesConCarga 
            ]
        });

        return res.json({ mensaje: "Proyecto actualizado con éxito", proyecto: proyectoActualizado });
    } catch (error) {
        console.error("Error al actualizar proyecto:", error);
        return res.status(500).json({ mensaje: "Error al actualizar proyecto" });
    }
};

const eliminarProyecto = async (req, res) => {
    try {
        const { id } = req.params;
        const proyecto = await Proyecto.findByPk(id, {
            include: [{
                model: UserStory,
                as: 'userStories',
                include: [{ model: Tarea, as: 'tareas' }]
            }]
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
        console.error("Error en borrado:", error);
        return res.status(500).json({ mensaje: "Error al eliminar" });
    }
};

module.exports = { obtenerProyectoPorId, crearProyecto, obtenerProyectos, actualizarProyecto, eliminarProyecto };