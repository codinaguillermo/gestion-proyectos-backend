const { Usuario } = require('../models');

// Función para crear un usuario (Pública, usada en el registro manual si fuera necesario)
const crearUsuario = async (req, res) => {
    try {
        const { nombre, email, password } = req.body;

        // Validación simple
        if (!nombre || !email || !password) {
            return res.status(400).json({ error: 'Faltan datos obligatorios' });
        }

        // Verificar duplicados
        const existe = await Usuario.findOne({ where: { email } });
        if (existe) {
            return res.status(400).json({ error: 'El email ya está registrado' });
        }

        const nuevoUsuario = await Usuario.create({
            nombre,
            email,
            password_hash: password, // Recuerda: En producción esto se encripta
            rol_id: 2 // Por defecto rol 2 (Alumno) si se crea por aquí
        });

        return res.status(201).json(nuevoUsuario);
    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: 'Error al crear usuario' });
    }
};

// Función para listar usuarios (Protegida, solo para ver quién está en el sistema)
const listarUsuarios = async (req, res) => {
    try {
        // req.usuario viene del middleware (token)
        console.log("Usuario que solicita:", req.usuario);

        const usuarios = await Usuario.findAll({
            attributes: ['id', 'nombre', 'email', 'rol_id'] // No devolvemos el password por seguridad
        });
        
        return res.json(usuarios);
    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: 'Error al obtener usuarios' });
    }
};

// EXPORTACIÓN IMPORTANTE: Asegúrate de que están las dos funciones aquí
module.exports = {
    crearUsuario,
    listarUsuarios
};