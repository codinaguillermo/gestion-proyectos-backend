const jwt = require('jsonwebtoken');
const { Usuario } = require('../models');

/**
 * Propósito: Validar el token JWT enviado en los headers y cargar el usuario en el objeto request (req).
 * Quién la llama: Se usa como middleware en todas las rutas protegidas (ej: usuario.routes.js).
 * Retorna: 
 * - Llama a next() si el token es válido.
 * - Retorna 403 si no hay token.
 * - Retorna 401 si el token es inválido o expiró.
 * - Retorna 404 si el usuario del token ya no existe.
 */
const verificarToken = async (req, res, next) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];

    if (!token) {
        return res.status(403).json({ error: 'Acceso denegado', mensaje: 'Falta el token' });
    }

    try {
        // Verificación del token con la clave secreta del .env
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        
        // Buscamos el usuario para asegurarnos de que sigue activo/existente
        const usuarioFull = await Usuario.findByPk(decoded.id);

        if (!usuarioFull) {
            return res.status(404).json({ mensaje: "Usuario no encontrado" });
        }

        // Inyectamos el usuario en la petición para que los controladores lo usen
        req.usuario = usuarioFull; 
        next(); 

    } catch (error) {
        console.error("Error en Middleware de Autenticación:", error.message);
        return res.status(401).json({ error: 'Token inválido', mensaje: 'Tu sesión expiró o es inválida' });
    }
};

/**
 * Propósito: Verificar que el usuario autenticado posea rol de Administrador.
 * Quién la llama: Se usa como middleware secundario en rutas sensibles (ej: configuraciones globales).
 * Retorna: Llama a next() si es admin, o responde con 403 si no tiene privilegios.
 */
const esAdmin = (req, res, next) => {
    // Asumiendo que el modelo Usuario incluye la relación con Rol o un campo rol_id / rol
    // Verificamos si el usuario cargado en req.usuario tiene permisos administrativos
    if (req.usuario && (req.usuario.rol_id === 1 || (req.usuario.rol && req.usuario.rol.nombre === 'Administrador'))) {
        return next();
    }
    
    return res.status(403).json({
        success: false,
        mensaje: 'Acceso denegado. Se requieren privilegios de Administrador para realizar esta acción.'
    });
};

module.exports = { 
    verificarToken, 
    esAdmin 
};