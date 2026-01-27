// src/controllers/usuario.controller.js
const { Usuario } = require('../models'); // Importa desde el index que acabamos de arreglar

const crearUsuario = async (req, res) => {
    try {
        const { nombre, email, password, rol_id } = req.body;

        // Validación rápida
        if (!nombre || !email || !password || !rol_id) {
            return res.status(400).json({ 
                error: 'Faltan datos', 
                mensaje: 'Debes enviar nombre, email, password y rol_id' 
            });
        }

        // Crear usuario usando Sequelize
        const nuevoUsuario = await Usuario.create({
            nombre,
            email,
            password_hash: password, // Recuerda: en BD se llama password_hash
            rol_id
        });

        // Responder al cliente (Thunder Client / Frontend)
        return res.status(201).json({
            mensaje: 'Usuario creado con éxito 🚀',
            usuario: nuevoUsuario
        });

    } catch (error) {
        console.error('Error al crear usuario:', error);
        return res.status(500).json({ 
            error: 'Error en el servidor', 
            detalle: error.message 
        });
    }
};


const listarUsuarios = async (req, res) => {
    try {
        // req.user viene del token decodificado
        console.log("Usuario solicitante ID:", req.user.id); 

        const usuarios = await Usuario.findAll({
            attributes: { exclude: ['password_hash'] } // Ocultamos el password
        });

        return res.json(usuarios);
    } catch (error) {
        return res.status(500).json({ error: 'Error al obtener usuarios' });
    }
};

// ¡IMPORTANTE: Exporta también la nueva función!
module.exports = { crearUsuario, listarUsuarios };