const { Proyecto, Rol, Usuario, EstadoProyecto } = require('../models');

// --- CREAR PROYECTO ---
const crearProyecto = async (req, res) => {
    try {
        const { nombre, descripcion } = req.body;
        const usuarioId = req.usuario.id;

        // Buscamos el primer estado disponible (generalmente "NUEVO" o "PLANIFICACIÓN")
        const estadoInicial = await EstadoProyecto.findOne({ order: [['id', 'ASC']] });
        
        if (!estadoInicial) {
            return res.status(500).json({ mensaje: "Falta configurar estados de proyecto en la DB" });
        }

        const nuevoProyecto = await Proyecto.create({
            nombre,
            descripcion,
            estado_id: estadoInicial.id,
            docente_owner_id: usuarioId
        });

        // Retornamos con el include para que Vue vea el nombre del estado al instante
        const proyectoConRelacion = await Proyecto.findByPk(nuevoProyecto.id, {
            include: [{ model: EstadoProyecto, attributes: ['nombre'] }]
        });

        return res.status(201).json(proyectoConRelacion);

    } catch (error) {
        console.error("Error al crear proyecto:", error); 
        return res.status(500).json({ mensaje: "Error al crear proyecto", detalle: error.message });
    }
};

// --- OBTENER PROYECTOS ---
const obtenerProyectos = async (req, res) => {
    try {
        const { id } = req.usuario;

        // Traemos al usuario con su rol para validar permisos de visibilidad
        const usuarioFull = await Usuario.findByPk(id, {
            include: [{ model: Rol }]
        });
        
        if (!usuarioFull || !usuarioFull.rol) {
            return res.status(403).json({ mensaje: "Usuario sin rol asignado" });
        }

        // Opciones de búsqueda: Siempre incluimos el nombre del estado
        let consultaOptions = {
            distinct: true,
            include: [
                { 
                    model: EstadoProyecto,
                    attributes: ['id', 'nombre'] 
                },
                {
                    model: Usuario,
                    as: 'integrantes', // Traemos a los alumnos vinculados
                    attributes: ['id', 'nombre', 'email'],
                    through: { attributes: [] } // Evita traer basura de la tabla intermedia
                }
            ],
            order: [['created_At', 'DESC']]
        };

        // Lógica de visibilidad: Si no es admin (ver_todo), solo ve los suyos
        if (!usuarioFull.rol.ver_todo) {
            consultaOptions.where = { docente_owner_id: id };
        }

        const proyectos = await Proyecto.findAll(consultaOptions);
        return res.json(proyectos);

    } catch (error) {
        console.error("Error al obtener proyectos:", error);
        return res.status(500).json({ mensaje: "Error al obtener proyectos" });
    }
};

// --- ACTUALIZAR PROYECTO ---
const actualizarProyecto = async (req, res) => {
    try {
        const { id } = req.params;
        console.log("--- INICIO ACTUALIZAR ---");
        console.log("ID Proyecto:", id);
        console.log("Body recibido:", req.body);
        const { nombre, descripcion, estado_id, usuariosIds } = req.body; // <-- Recibimos los IDs

        const proyecto = await Proyecto.findByPk(id);
        if (!proyecto) return res.status(404).json({ mensaje: "Proyecto no encontrado" });

        // Actualización de datos básicos
        console.log("BODY RECIBIDO:", req.body);
        console.log("IDS EXTRAIDOS:", usuariosIds);
        await proyecto.update({ nombre, descripcion, estado_id });

        // PERSISTENCIA DE ALUMNOS: Sincroniza la tabla intermedia
        if (usuariosIds) {
            await proyecto.setIntegrantes(usuariosIds); // 'setIntegrantes' por el alias 'as: integrantes' del index.js
        }

        const proyectoActualizado = await Proyecto.findByPk(id, {
            include: [
                { model: EstadoProyecto, attributes: ['nombre'] },
                { model: Usuario, as: 'integrantes', attributes: ['id', 'nombre', 'email'] } // <-- Incluirlos en la respuesta
            ]
        });

        return res.json({ 
            mensaje: "Proyecto actualizado con éxito", 
            proyecto: proyectoActualizado 
        });

    } catch (error) {
        console.error("Error al actualizar proyecto:", error);
        return res.status(500).json({ mensaje: "Error al actualizar proyecto" });
    }
};

// --- ELIMINAR PROYECTO ---
const eliminarProyecto = async (req, res) => {
    try {
        const { id } = req.params;
        const proyecto = await Proyecto.findByPk(id);
        
        if (!proyecto) return res.status(404).json({ mensaje: "Proyecto no encontrado" });

        const esDueño = proyecto.docente_owner_id === req.usuario.id;
        const tienePermisoGlobal = req.usuario.rol && req.usuario.rol.ver_todo === true;

        if (!esDueño && !tienePermisoGlobal) {
            return res.status(403).json({ mensaje: "No tienes permiso para eliminar este proyecto" });
        }

        await Proyecto.destroy({ where: { id } });
        return res.json({ mensaje: "Proyecto eliminado correctamente" });

    } catch (error) {
        console.error("Error al eliminar proyecto:", error);
        return res.status(500).json({ mensaje: "Error al eliminar proyecto" });
    }
};

module.exports = {
    crearProyecto,
    obtenerProyectos,
    actualizarProyecto,
    eliminarProyecto
};