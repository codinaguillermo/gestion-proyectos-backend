const { Usuario, Escuela } = require('../models');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

/**
 * Propósito: Registrar una solicitud de nueva cuenta por parte de un alumno o docente, insertando el registro en estado inactivo, marcado como pendiente de revisión, y capturando datos académicos si corresponde. Asigna automáticamente la única escuela del sistema.
 * Quién la llama: Invocada por POST /api/auth/solicitar-cuenta desde la vista de solicitud en el Frontend.
 * Qué datos retorna: Objeto JSON con el mensaje de confirmación de solicitud procesada o el detalle del error de validación (ej. email duplicado o rol inválido).
 */
const solicitarCuenta = async (req, res) => {
    try {
        // 1. Ahora también extraemos el token del captcha
        const { nombre, apellido, email, telefono, rol_id, curso, division, especialidad_id, recaptchaToken } = req.body;

        if (!nombre || !apellido || !email || !telefono || !rol_id) {
            return res.status(400).json({ error: 'Faltan datos', mensaje: 'Nombre, apellido, email, teléfono y tipo de usuario son obligatorios.' });
        }

        // 2. Validamos que el frontend haya enviado el token del Captcha
        if (!recaptchaToken) {
            return res.status(400).json({ error: 'Falta verificación', mensaje: 'Debes confirmar que no eres un robot.' });
        }

        // 3. Verificamos el token con los servidores de Google
        const secretKey = process.env.RECAPTCHA_SECRET_KEY;
        const verifyUrl = `https://www.google.com/recaptcha/api/siteverify?secret=${secretKey}&response=${recaptchaToken}`;
        
        const recaptchaRes = await fetch(verifyUrl, { method: 'POST' });
        const recaptchaData = await recaptchaRes.json();

        if (!recaptchaData.success) {
            return res.status(400).json({ error: 'Captcha inválido', mensaje: 'La verificación de seguridad falló. Por favor, intenta de nuevo.' });
        }

        // --- A PARTIR DE ACÁ EL CÓDIGO SIGUE IGUAL QUE ANTES ---

        const rolNum = Number(rol_id);
        if (rolNum !== 2 && rolNum !== 3) {
            return res.status(400).json({ error: 'Rol inválido', mensaje: 'El tipo de cuenta solicitado no es válido para autogestión.' });
        }

        if (rolNum === 3) {
            if (!curso || !division || !especialidad_id) {
                return res.status(400).json({ error: 'Faltan datos académicos', mensaje: 'Curso, división y especialidad son obligatorios para las cuentas de alumno.' });
            }
        }

        const existeUsuario = await Usuario.findOne({ where: { email } });
        if (existeUsuario) {
            return res.status(400).json({ error: 'Email duplicado', mensaje: 'El correo electrónico ya se encuentra registrado en el sistema.' });
        }

        const nuevoUsuario = await Usuario.create({
            nombre,
            apellido,
            email,
            telefono,
            rol_id: rolNum,
            password_hash: 'SOLICITUD_PENDIENTE_2026', 
            activo: false,
            pendiente: true,
            especialidad_id: rolNum === 3 ? Number(especialidad_id) : 1, 
            curso: rolNum === 3 ? curso : null,
            division: rolNum === 3 ? division : null,
            mensajes_sin_leer: 0
        });

        const escuelaUnica = await Escuela.findOne();
        if (escuelaUnica) {
            await nuevoUsuario.setEscuelas([escuelaUnica.id]);
        }

        return res.status(201).json({
            success: true,
            mensaje: 'Solicitud enviada con éxito. Tu cuenta fue creada en estado inactivo y deberá ser habilitada por un administrador.'
        });

    } catch (error) {
        console.error("Error en solicitarCuenta:", error);
        return res.status(500).json({ error: 'Error interno', mensaje: 'No se pudo procesar la solicitud de cuenta en el servidor.' });
    }
};

/**
 * Propósito: Autenticar las credenciales del usuario, verificar si su cuenta está habilitada, generar el token JWT firmado y proveer los datos de sesión junto al contador en tiempo real de solicitudes pendientes si quien ingresa es personal administrativo o docente.
 * Quién la llama: Invocada por POST /api/auth/login desde el formulario de acceso del Frontend.
 * Qué datos retorna: Objeto JSON con el mensaje de éxito, el string del token JWT y el sub-objeto 'usuario' enriquecido para Pinia (incluye rol, avatar, mensajes sin leer y solicitudes pendientes).
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

        // Validar estrictamente que la cuenta esté activa (1 / true) antes de cotejar contraseñas
        if (!usuario.activo) {
            return res.status(403).json({ 
                error: 'Cuenta inactiva', 
                mensaje: 'Tu cuenta se encuentra inactiva o en proceso de revisión por parte de la administración.' 
            });
        }

        const passwordValida = await bcrypt.compare(password, usuario.password_hash);
        
        if (!passwordValida) {
            return res.status(401).json({ error: 'Credenciales inválidas' });
        }

        // Si es Admin (1) o Docente (2), contamos en la tabla cuántos registros tienen la columna pendiente en true
        let solicitudesPendientes = 0;
        if (usuario.rol_id === 1 || usuario.rol_id === 2) {
            solicitudesPendientes = await Usuario.count({
                where: { pendiente: true }
            });
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
                mensajes_sin_leer: usuario.mensajes_sin_leer,
                solicitudes_pendientes: solicitudesPendientes
            }
        });

    } catch (error) {
        console.error("Error en login:", error);
        return res.status(500).json({ error: 'Error en el servidor' });
    }
};

module.exports = { login, solicitarCuenta };