const { Proyecto, Rol, Usuario, EstadoProyecto } = require('../models');

// --- CREAR PROYECTO ---
const crearProyecto = async (req, res) => {
    try {
        const { nombre, descripcion } = req.body;
        const usuarioId = req.usuario.id;

        const estadoInicial = await EstadoProyecto.findOne({ order: [['id', 'ASC']] });
        
        if (!estadoInicial) {
            return res.status(500).json({ mensaje: "Falta configurar estados en la DB" });
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
        console.error("DETALLE DEL ERROR AL CREAR:", error); 
        return res.status(500).json({ mensaje: "Error al crear proyecto", detalle: error.message });
    }
};

// --- OBTENER PROYECTOS (Lógica limpia y sin strings) ---
const obtenerProyectos = async (req, res) => {
    try {
        const { id } = req.usuario;

        const usuarioFull = await Usuario.findByPk(id, {
            include: [{ model: Rol }]
        });
        // TEST DE INGENIERÍA:
        console.log("¿Qué llega de la DB?", {
            nombre: usuarioFull.nombre,
            rol: usuarioFull.rol.nombre,
            ver_todo: usuarioFull.rol.ver_todo
        });

        console.log(`Usuario: ${usuarioFull.nombre} | Rol: ${usuarioFull.rol.nombre} | Ver Todo: ${usuarioFull.rol.ver_todo}`);
        
        if (!usuarioFull || !usuarioFull.rol) {
            return res.status(403).json({ mensaje: "Usuario sin rol asignado" });
        }

        // Definimos las opciones de búsqueda CON el JOIN del estado
        let consultaOptions = {
            include: [{ 
                model: EstadoProyecto,
                attributes: ['nombre'] 
            }]
        };

        // Lógica DINÁMICA: Si el rol NO tiene ver_todo, filtramos por dueño
        if (!usuarioFull.rol.ver_todo) {
            console.log("Aplicando filtro de seguridad: solo proyectos propios");
            consultaOptions.where = { docente_owner_id: id };
        }

        const proyectos = await Proyecto.findAll(consultaOptions);
        return res.json(proyectos);

    } catch (error) {
        console.error("ERROR AL OBTENER:", error);
        return res.status(500).json({ mensaje: "Error al obtener proyectos" });
    }
};

// --- ACTUALIZAR PROYECTO ---
const actualizarProyecto = async (req, res) => {
    try {
        const { id } = req.params;
        const { nombre, descripcion, estado_id } = req.body; // Cambiamos 'estado' por 'estado_id'

        const proyecto = await Proyecto.findByPk(id);
        if (!proyecto) return res.status(404).json({ mensaje: "No encontrado" });

        if (proyecto.docente_owner_id !== req.usuario.id) {
            return res.status(403).json({ mensaje: "Sin permiso" });
        }

        // Actualizamos usando la columna correcta de la BD
        await Proyecto.update({ nombre, descripcion, estado_id }, { where: { id } });

        return res.json({ mensaje: "Proyecto actualizado" });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ mensaje: "Error al actualizar" });
    }
};

// --- ELIMINAR PROYECTO ---
const eliminarProyecto = async (req, res) => {
    try {
        const { id } = req.params;
        const proyecto = await Proyecto.findByPk(id);
        
        if (!proyecto) return res.status(404).json({ mensaje: "No encontrado" });

        if (proyecto.docente_owner_id !== req.usuario.id) {
            return res.status(403).json({ mensaje: "No tienes permiso" });
        }

        await Proyecto.destroy({ where: { id } });
        return res.json({ mensaje: "Proyecto eliminado" });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ mensaje: "Error al eliminar" });
    }
};

module.exports = {
    crearProyecto,
    obtenerProyectos,
    actualizarProyecto,
    eliminarProyecto
};