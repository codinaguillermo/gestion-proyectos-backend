const { Usuario } = require('../models');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt'); // 1. Importamos bcrypt

// --- REGISTRO ---
const registro = async (req, res) => {
    try {
        const { nombre, email, password } = req.body;

        if (!nombre || !email || !password) {
            return res.status(400).json({ error: 'Faltan datos', mensaje: 'Nombre, email y password son obligatorios' });
        }

        const existeUsuario = await Usuario.findOne({ where: { email } });
        if (existeUsuario) {
            return res.status(400).json({ error: 'Email duplicado', mensaje: 'El email ya está registrado' });
        }

        // Al crear el usuario, el HOOK 'beforeCreate' que pusimos en el modelo 
        // se encargará de encriptar 'password_hash' automáticamente.
        const nuevoUsuario = await Usuario.create({
            nombre,
            email,
            password_hash: password, 
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
        console.error("Error en registro:", error);
        return res.status(500).json({ error: 'Error al registrar usuario' });
    }
};

// --- LOGIN ---
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

        // 2. CAMBIO CLAVE: Comparamos la clave ingresada con el hash de la BD
        const passwordValida = await bcrypt.compare(password, usuario.password_hash);
        
        if (!passwordValida) {
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
        console.error("Error en login:", error);
        return res.status(500).json({ error: 'Error en el servidor' });
    }
};

module.exports = { login, registro };