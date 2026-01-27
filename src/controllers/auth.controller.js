const { Usuario } = require('../models');
const jwt = require('jsonwebtoken');

// --- FUNCIÓN NUEVA: REGISTRO ---
const registro = async (req, res) => {
    try {
        const { nombre, email, password } = req.body;

        // 1. Validar datos
        if (!nombre || !email || !password) {
            return res.status(400).json({ error: 'Faltan datos', mensaje: 'Nombre, email y password son obligatorios' });
        }

        // 2. Verificar si ya existe el email
        const existeUsuario = await Usuario.findOne({ where: { email } });
        if (existeUsuario) {
            return res.status(400).json({ error: 'Email duplicado', mensaje: 'El email ya está registrado' });
        }

        // 3. Crear el usuario en la BD
        // IMPORTANTE: Mapeamos 'password' (del body) a 'password_hash' (de la BD)
        const nuevoUsuario = await Usuario.create({
            nombre,
            email,
            password_hash: password, // Por ahora texto plano, luego encriptaremos
            rol_id: 1
        });

        return res.status(201).json({
            mensaje: 'Usuario creado exitosamente',
            usuario: {
                id: nuevoUsuario.id,
                nombre: nuevoUsuario.nombre,
                email: nuevoUsuario.email
            }
        });

    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: 'Error al registrar usuario' });
    }
};

// --- FUNCIÓN EXISTENTE: LOGIN ---
const login = async (req, res) => {
    try {
        const { email, password } = req.body;

        if (!email || !password) {
            return res.status(400).json({ error: 'Faltan datos', mensaje: 'Email y password obligatorios' });
        }

        const usuario = await Usuario.findOne({ where: { email } });

        if (!usuario) {
            return res.status(401).json({ error: 'Credenciales inválidas' }); 
        }

        if (usuario.password_hash !== password) {
            return res.status(401).json({ error: 'Credenciales inválidas' });
        }

        const token = jwt.sign(
            { 
                id: usuario.id, 
                nombre: usuario.nombre, 
                rol_id: usuario.rol_id 
            },
            process.env.JWT_SECRET, 
            { expiresIn: '8h' } 
        );

        return res.json({
            mensaje: 'Login exitoso',
            token: token,
            usuario: {
                id: usuario.id,
                nombre: usuario.nombre
            }
        });

    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: 'Error en el servidor' });
    }
};

// EXPORTAMOS LAS DOS FUNCIONES
module.exports = { login, registro };