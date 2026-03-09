const { Op } = require('sequelize'); 
const { sequelize, Tarea, Proyecto, Usuario, Prioridad, EstadoTarea, TipoTarea, EstadoProyecto, UserStory, Rol, Escuela, Entregable } = require('../models');

/**
 * Configuración de include para integrantes.
 */
const includeIntegrantesConCarga = { 
    model: Usuario, 
    as: 'integrantes', 
    attributes: ['id', 'nombre', 'apellido', 'email', 'rol_id', 'curso', 'division'],
    where: { activo: true },
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

// 1. OBTENER UN PROYECTO POR ID
const obtenerProyectoPorId = async (req, res) => {
    try {
        const { id } = req.params;
        const proyecto = await Proyecto.findByPk(id, {
            attributes: [
                'id', 'nombre', 'descripcion', 'docente_owner_id', 'escuela_id',
                'objetivo', 'objetivoBloqueado', 
                'alcancePrototipo', 'alcancePrototipoBloqueado',
                'alcanceFinal', 'alcanceFinalBloqueado'
            ],
            include: [
                { model: EstadoProyecto, attributes: ['nombre'] },
                { model: Escuela, attributes: ['id', 'nombre_largo', 'nombre_corto'] }, 
                { model: Entregable, as: 'entregables' }, // AGREGADO
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

// 2. CREAR PROYECTO
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
                { model: Entregable, as: 'entregables' }, // AGREGADO
                includeIntegrantesConCarga 
            ]
        });
        return res.status(201).json(proyectoConRelacion);
    } catch (error) {
        console.error("Error al crear proyecto:", error); 
        return res.status(500).json({ mensaje: "Error al crear proyecto" });
    }
};

// 3. OBTENER LISTADO DE PROYECTOS
const obtenerProyectos = async (req, res) => {
    try {
        const { id, rol_id } = req.usuario;
        let condicion = {};
        if (rol_id !== 1) {
            const participaciones = await Proyecto.findAll({
                attributes: ['id'],
                include: [{
                    model: Usuario, as: 'integrantes', where: { id: id }, attributes: [], through: { attributes: [] }
                }],
                raw: true
            });
            const ids = participaciones.map(p => p.id);
            condicion = { [Op.or]: [{ docente_owner_id: id }, { id: { [Op.in]: ids } }] };
        }
        
        const proyectos = await Proyecto.findAll({
            where: condicion,
            attributes: [
                'id', 'nombre', 'descripcion', 'estado_id', 'docente_owner_id', 'escuela_id', 'created_at',
                'objetivo', 'objetivoBloqueado', 
                'alcancePrototipo', 'alcancePrototipoBloqueado',
                'alcanceFinal', 'alcanceFinalBloqueado'
            ],
            include: [
                { model: EstadoProyecto, attributes: ['id', 'nombre'] },
                { model: Escuela, attributes: ['id', 'nombre_largo', 'nombre_corto'] }, 
                { model: UserStory, as: 'userStories' },
                { model: Entregable, as: 'entregables' }, // AGREGADO
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

// 4. ACTUALIZAR PROYECTO (Con Sincronización Atómica de Entregables)
const actualizarProyecto = async (req, res) => {
    const t = await sequelize.transaction(); // INICIO TRANSACCIÓN
    try {
        const { id } = req.params;
        const { id: usuarioId, rol_id } = req.usuario; 
        const esDocente = Number(rol_id) === 1 || Number(rol_id) === 2;

        const proyecto = await Proyecto.findByPk(id);
        if (!proyecto) {
            await t.rollback();
            return res.status(404).json({ mensaje: "Proyecto no encontrado" });
        }

        // Separamos entregables y usuariosIds del resto del body
        const { entregables, usuariosIds, ...datosParaActualizar } = req.body;

        if (!esDocente) {
            if (proyecto.objetivoBloqueado) delete datosParaActualizar.objetivo;
            if (proyecto.alcancePrototipoBloqueado) delete datosParaActualizar.alcancePrototipo;
            if (proyecto.alcanceFinalBloqueado) delete datosParaActualizar.alcanceFinal;
            
            delete datosParaActualizar.objetivoBloqueado;
            delete datosParaActualizar.alcancePrototipoBloqueado;
            delete datosParaActualizar.alcanceFinalBloqueado;
        }

        // Actualización básica del proyecto
        await proyecto.update(datosParaActualizar, { transaction: t });

        // Sincronización de integrantes (N:M)
        if (usuariosIds && esDocente) { 
            await proyecto.setIntegrantes(usuariosIds, { transaction: t }); 
        }

        // --- LÓGICA DE ENTREGABLES (Sincronización manual en una sola transacción) ---
        if (entregables && Array.isArray(entregables)) {
            // Buscamos lo que hay actualmente en la BD para este proyecto
            const actualesBD = await Entregable.findAll({ where: { proyecto_id: id } });
            const idsRecibidos = entregables.filter(e => e.id).map(e => e.id);

            // 1. Borrar los que no vienen en el array (borrado lógico)
            const paraBorrar = actualesBD.filter(e => !idsRecibidos.includes(e.id)).map(e => e.id);
            if (paraBorrar.length > 0) {
                await Entregable.destroy({ where: { id: paraBorrar }, transaction: t });
            }

            // 2. Crear o Actualizar
            for (const ent of entregables) {
                if (ent.id) {
                    // Si tiene ID, actualizamos
                    await Entregable.update(ent, { where: { id: ent.id }, transaction: t });
                } else {
                    // Si no tiene ID, es nuevo
                    await Entregable.create({ ...ent, proyecto_id: id }, { transaction: t });
                }
            }
        }

        await t.commit(); // ÉXITO: Se guarda todo o nada

        const proyectoActualizado = await Proyecto.findByPk(id, {
            attributes: [
                'id', 'nombre', 'descripcion', 'docente_owner_id', 'escuela_id',
                'objetivo', 'objetivoBloqueado', 
                'alcancePrototipo', 'alcancePrototipoBloqueado',
                'alcanceFinal', 'alcanceFinalBloqueado'
            ],
            include: [
                { model: EstadoProyecto, attributes: ['nombre'] },
                { model: Escuela, attributes: ['nombre_largo', 'nombre_corto'] },
                { model: Entregable, as: 'entregables' }, // INCLUIDO EN RESPUESTA
                includeIntegrantesConCarga 
            ]
        });

        return res.json({ 
            mensaje: "Proyecto actualizado con éxito", 
            proyecto: proyectoActualizado 
        });

    } catch (error) {
        await t.rollback(); // ERROR: Deshace cualquier cambio hecho en esta ejecución
        console.error("Error al actualizar proyecto:", error);
        return res.status(500).json({ mensaje: "Error al actualizar proyecto" });
    }
};

// 5. ELIMINAR PROYECTO
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
        console.error("Error en borrado:", error);
        return res.status(500).json({ mensaje: "Error al eliminar" });
    }
};

module.exports = { obtenerProyectoPorId, crearProyecto, obtenerProyectos, actualizarProyecto, eliminarProyecto };