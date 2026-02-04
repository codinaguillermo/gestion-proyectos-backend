const jwt = require('jsonwebtoken');
const { Usuario } = require('../models'); // Quitamos Rol de aquí por ahora

const verificarToken = async (req, res, next) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];

    if (!token) {
        return res.status(403).json({ error: 'Acceso denegado', mensaje: 'Falta el token' });
    }

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        
        // BUSQUEDA SIMPLE: Solo el usuario, sin el include que falla
        const usuarioFull = await Usuario.findByPk(decoded.id);

        if (!usuarioFull) {
            return res.status(404).json({ mensaje: "Usuario no encontrado" });
        }

        req.usuario = usuarioFull; 
        next(); 

    } catch (error) {
        console.error("Error en Middleware:", error.message);
        return res.status(401).json({ error: 'Token inválido', mensaje: 'Tu sesión expiró' });
    }
};

module.exports = { verificarToken };