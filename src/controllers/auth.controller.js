const { Usuario } = require('../models');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

/**
 * Propósito: Registrar un nuevo usuario en la plataforma.
 * Quién la llama: Invocada por POST /api/auth/registro desde las rutas correspondientes.
 * Qué datos retorna: Objeto JSON con el token de sesión (si aplicara) y los datos públicos estructurados del usuario (incluyendo avatar y mensajes sin leer).
 */
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

        const nuevoUsuario = await Usuario.create({
            nombre,
            email,
            password_hash: password, 
            rol_id: 1 // Por defecto Admin
        });

        return res.status(201).json({
            mensaje: 'Usuario creado exitosamente',
            usuario: {
                id: nuevoUsuario.id,
                nombre: nuevoUsuario.nombre,
                email: nuevoUsuario.email,
                rol_id: nuevoUsuario.rol_id,
                avatar: nuevoUsuario.avatar,
                // NUEVO: Se anexa para consistencia del estado en el alta directa
                mensajes_sin_leer: nuevoUsuario.mensajes_sin_leer 
            }
        });

    } catch (error) {
        if (t) await t.rollback();
        console.error("Error en registro:", error);
        return res.status(500).json({ error: 'Error al registrar usuario' });
    }
};

/**
 * Propósito: Autenticar las credenciales del usuario, generar el token JWT firmado y proveer los datos de sesión.
 * Quién la llama: Invocada por POST /api/auth/login desde el formulario de acceso del Frontend.
 * Qué datos retorna: Objeto JSON con el mensaje de éxito, el string del token JWT y el sub-objeto 'usuario' con los datos requeridos por Pinia.
 */
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
                nombre: usuario.nombre,
                rol_id: usuario.rol_id,
                avatar: usuario.avatar,
                // NUEVO: ¡LA SEGUNDA PIEZA FALTANTE! Ahora Pinia recibe el contador real del disco
                mensajes_sin_leer: usuario.mensajes_sin_leer 
            }
        });

    } catch (error) {
        console.error("Error en login:", error);
        return res.status(500).json({ error: 'Error en el servidor' });
    }
};

module.exports = { login, registro };