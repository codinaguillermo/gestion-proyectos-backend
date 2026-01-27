const { Usuario } = require('../models');
const jwt = require('jsonwebtoken');

const login = async (req, res) => {
    try {
        const { email, password } = req.body;

        // 1. Validar que vengan los datos
        if (!email || !password) {
            return res.status(400).json({ error: 'Faltan datos', mensaje: 'Email y password obligatorios' });
        }

        // 2. Buscar al usuario por Email
        const usuario = await Usuario.findOne({ where: { email } });

        // Si no existe el usuario
        if (!usuario) {
            return res.status(401).json({ error: 'Credenciales inválidas' }); 
            // Tip de seguridad: No digas "el usuario no existe", di "credenciales inválidas" para no dar pistas.
        }

        // 3. Verificar la contraseña
        // OJO: Como en el paso anterior guardamos la contraseña PLANA (sin encriptar), comparamos directo.
        // En producción, aquí usaríamos bcrypt.compare()
        if (usuario.password_hash !== password) {
            return res.status(401).json({ error: 'Credenciales inválidas' });
        }

        // 4. Generar el Token (El Pasaporte)
        // Guardamos en el token datos útiles (Payload): ID, nombre y rol
        const token = jwt.sign(
            { 
                id: usuario.id, 
                nombre: usuario.nombre, 
                rol_id: usuario.rol_id 
            },
            process.env.JWT_SECRET, // La firma secreta
            { expiresIn: '8h' } // El token expira en 8 horas (jornada laboral/escolar)
        );

        // 5. Responder
        return res.json({
            mensaje: 'Login exitoso',
            token: token,
            usuario: {
                id: usuario.id,
                nombre: usuario.nombre,
                rol_id: usuario.rol_id
            }
        });

    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: 'Error en el servidor' });
    }
};

module.exports = { login };