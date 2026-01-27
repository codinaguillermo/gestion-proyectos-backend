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
        
        // CORRECCIÓN IMPORTANTE: 
        // Usamos 'req.usuario' para coincidir con tus controladores.
        req.usuario = decoded; 
        
        next(); // ¡Pase usted!

    } catch (error) {
        return res.status(401).json({ error: 'Token inválido', mensaje: 'Tu sesión expiró' });
    }
};

// CORRECCIÓN DE EXPORTACIÓN:
// Exportamos un objeto { } para que coincida con las rutas
module.exports = { verificarToken };