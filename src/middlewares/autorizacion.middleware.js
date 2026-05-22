const { Proyecto, Usuario, Tarea } = require('../models');

const verificarAccesoProyecto = async (req, res, next) => {
    try {
        const usuarioLogueado = req.usuario; 
        if (!usuarioLogueado) return res.status(401).json({ mensaje: "Usuario no autenticado." });

        const usuarioId = Number(usuarioLogueado.id);
        const rolId = Number(usuarioLogueado.rol_id);

        if (rolId === 1) return next();

        // 1. Intentar obtener proyectoId desde la URL
        let proyectoId = req.params.proyectoId || req.params.proyecto_id;

        // 2. Si no está en URL, buscar en el body
        if (!proyectoId) proyectoId = req.body.proyecto_id || req.body.proyectoId;

        // 3. SI NO EXISTE proyectoId, es porque estamos en /api/tareas/:id (PUT o DELETE)
        // Buscamos el proyecto a través del ID de la tarea
        if (!proyectoId && req.params.id) {
            const tarea = await Tarea.findByPk(req.params.id);
            if (tarea) proyectoId = tarea.proyecto_id;
        }

        // Si después de todo esto no hay proyectoId, cortamos
        if (!proyectoId) {
            return res.status(400).json({ mensaje: "Contexto de proyecto no identificado." });
        }

        // 4. Verificar si el usuario es integrante del proyecto
        const proyecto = await Proyecto.findByPk(proyectoId, {
            include: [{
                model: Usuario,
                as: 'integrantes',
                where: { id: usuarioId },
                required: false 
            }]
        });

        // 5. Integrante o dueño pasa
        const esOwner = proyecto && Number(proyecto.docente_owner_id) === usuarioId;
        const esMiembro = proyecto && proyecto.integrantes && proyecto.integrantes.length > 0;

        if (esOwner || esMiembro) return next();

        return res.status(403).json({ mensaje: "No tenés permiso para operar en este proyecto." });

    } catch (error) {
        console.error("Error en middleware:", error);
        return res.status(500).json({ mensaje: "Error interno de autorización." });
    }
};

module.exports = { verificarAccesoProyecto };