// src/middlewares/auth.middleware.js
const jwt = require('jsonwebtoken');

const verificarToken = (req, res, next) => {
    const authHeader = req.headers['authorization'];
    // El token viene como: "Bearer eyJhbGci..."
    const token = authHeader && authHeader.split(' ')[1];

    if (!token) {
        return res.status(403).json({ error: 'Acceso denegado', mensaje: 'Falta el token' });
    }

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        req.user = decoded; // Guardamos quien es el usuario
        next(); // ¡Pase usted!

    } catch (error) {
        return res.status(401).json({ error: 'Token inválido', mensaje: 'Tu sesión expiró' });
    }
};

module.exports = verificarToken;