const { Proyecto, Usuario } = require('../models');

const verificarAccesoProyecto = async (req, res, next) => {
    try {
        const usuarioLogueado = req.usuario; // Cargado por tu middleware de JWT (auth.middleware)
        
        if (!usuarioLogueado) {
            return res.status(401).json({ mensaje: "Usuario no autenticado." });
        }

        const rolId = Number(usuarioLogueado.rol_id);
        const usuarioId = Number(usuarioLogueado.id);

        // 1. Si es Admin (rol 1), tiene llave maestra: pasa derecho.
        if (rolId === 1) return next();

        /**
         * 2. Obtenemos el ID del proyecto.
         * Buscamos en todas las variantes posibles para que sea compatible 
         * con cualquier ruta (params, body o query).
         */
        const proyectoId = 
            req.params.proyectoId || 
            req.params.proyecto_id || 
            req.body.proyecto_id || 
            req.body.proyectoId || 
            req.query.proyecto_id;

        if (!proyectoId) {
            return res.status(400).json({ 
                mensaje: "Falta el ID del proyecto para validar seguridad." 
            });
        }

        // 3. Buscamos el proyecto y verificamos si el usuario pertenece a él
        const proyecto = await Proyecto.findByPk(proyectoId, {
            include: [{
                model: Usuario,
                as: 'integrantes', // <-- REGLA DE ORO: Chequeá que este alias sea igual en tu model/index.js
                where: { id: usuarioId },
                required: false 
            }]
        });

        if (!proyecto) {
            return res.status(404).json({ mensaje: "Proyecto no encontrado." });
        }

        /**
         * 4. Lógica de Acceso:
         * - Es el docente dueño (docente_owner_id)
         * - O está en la lista de integrantes (alumno o colaborador)
         */
        const esOwner = Number(proyecto.docente_owner_id) === usuarioId;
        const esMiembro = proyecto.integrantes && proyecto.integrantes.length > 0;

        if (esOwner || esMiembro) {
            return next();
        }

        // 5. Si no es ni owner ni miembro, rebote 403.
        return res.status(403).json({ 
            mensaje: "No tenés permiso para operar en este proyecto." 
        });

    } catch (error) {
        console.error("Error en middleware verificarAccesoProyecto:", error);
        return res.status(500).json({ 
            mensaje: "Error interno en el control de acceso." 
        });
    }
};

module.exports = { verificarAccesoProyecto };