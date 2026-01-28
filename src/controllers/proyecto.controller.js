//const { Proyecto } = require('../models');
const { Proyecto, Rol, Usuario, EstadoProyecto } = require('../models');


const crearProyecto = async (req, res) => {
    try {
        const { id } = req.usuario;

        // 1. Buscamos al usuario con su Rol para la autorización
        const usuarioFull = await Usuario.findByPk(id, {
            include: [{ model: Rol }]
        });

        if (!usuarioFull || !usuarioFull.rol) {
            return res.status(403).json({ mensaje: "Usuario sin rol asignado" });
        }

        const nombreDelRol = usuarioFull.rol.nombre; 
        let consultaOptions = {
            // 2. Incluimos el modelo de Estado para traer el nombre (ej: 'ABIERTO')
            include: [{ 
                model: EstadoProyecto,
                attributes: ['nombre'] // Solo nos interesa el nombre del estado
            }]
        };

        // 3. Aplicamos el filtro de visibilidad según el Rol de la DB
        if (nombreDelRol !== 'DOCENTE' && nombreDelRol !== 'ADMIN') {
            consultaOptions.where = { docente_owner_id: id };
        }

        const proyectos = await Proyecto.findAll(consultaOptions);
        
        return res.json(proyectos);

    } catch (error) {
        // ESTO ES CLAVE: Imprimí el error completo en la consola de Node
        console.error("DETALLE DEL ERROR:", error); 
        return res.status(500).json({ mensaje: "Error al sincronizar roles", detalle: error.message });
    }
};

// ACTUALIZAR PROYECTO
const actualizarProyecto = async (req, res) => {
    try {
        const { id } = req.params;
        const { nombre, descripcion, estado } = req.body;

        const proyecto = await Proyecto.findByPk(id);
        if (!proyecto) {
            return res.status(404).json({ mensaje: "Proyecto no encontrado" });
        }

        // Seguridad simple: Solo el dueño puede editar (opcional, pero recomendado)
        if (proyecto.docente_owner_id !== req.usuario.id) {
            return res.status(403).json({ mensaje: "No tienes permiso para editar este proyecto" });
        }

        await Proyecto.update({ nombre, descripcion, estado }, { where: { id } });

        return res.json({ mensaje: "Proyecto actualizado" });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ mensaje: "Error al actualizar" });
    }
};

// ELIMINAR PROYECTO
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

const obtenerProyectos = async (req, res) => {
    try {
        const { id } = req.usuario;

        // Buscamos al usuario e incluimos su Rol (JOIN)
        const usuarioFull = await Usuario.findByPk(id, {
            include: [{ model: Rol }]
        });

        if (!usuarioFull || !usuarioFull.rol) {
            return res.status(403).json({ mensaje: "Usuario sin rol asignado" });
        }

        const nombreDelRol = usuarioFull.rol.nombre; 
        let proyectos;

        // Lógica basada en NOMBRES de la BD, no en números mágicos
        if (nombreDelRol === 'DOCENTE' || nombreDelRol === 'ADMIN') {
            proyectos = await Proyecto.findAll();
        } else {
            proyectos = await Proyecto.findAll({ where: { docente_owner_id: id } });
        }

        return res.json(proyectos);
    } catch (error) {
        console.error(error);
        return res.status(500).json({ mensaje: "Error al sincronizar roles" });
    }
};
// EXPORTACIÓN CLAVE
module.exports = {
    crearProyecto,
    obtenerProyectos,
    actualizarProyecto,
    eliminarProyecto
};