// src/controllers/proyecto.controller.js
const { Proyecto } = require('../models'); 

const crearProyecto = async (req, res) => {
    try {
        // 1. Datos del body (lo que envía el usuario)
        const { nombre, descripcion, fecha_entrega } = req.body;

        // 2. ID del usuario (viene del Token, gracias al middleware)
        const docenteId = req.user.id; 

        if (!nombre) {
            return res.status(400).json({ error: 'Falta el nombre del proyecto' });
        }

        // 3. Creamos usando tu columna personalizada 'docente_owner_id'
        const nuevoProyecto = await Proyecto.create({
            nombre,
            descripcion,
            fecha_entrega,
            docente_owner_id: docenteId, 
            estado: 'PLANIFICACION' 
        });

        return res.status(201).json(nuevoProyecto);

    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: 'Error al crear el proyecto' });
    }
};

// ... (código anterior de crearProyecto) ...

const listarMisProyectos = async (req, res) => {
    try {
        // Buscamos proyectos donde el dueño sea el usuario del Token
        const proyectos = await Proyecto.findAll({
            where: { docente_owner_id: req.user.id } 
        });

        return res.json(proyectos);
    } catch (error) {
        return res.status(500).json({ error: 'Error al obtener proyectos' });
    }
};

// ¡NO TE OLVIDES DE AGREGARLA AQUÍ!
module.exports = { crearProyecto, listarMisProyectos };