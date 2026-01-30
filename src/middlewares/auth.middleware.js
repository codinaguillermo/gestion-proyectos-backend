const jwt = require('jsonwebtoken');
const { Usuario, Rol } = require('../models'); // Importamos los modelos

const verificarToken = async (req, res, next) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];

    if (!token) {
        return res.status(403).json({ error: 'Acceso denegado', mensaje: 'Falta el token' });
    }

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        
        // BUSQUEDA EN BD: Traemos al usuario con su ROL incluido
        const usuarioFull = await Usuario.findByPk(decoded.id, {
            include: [{ model: Rol, as: 'rol' }] 
        });

        if (!usuarioFull) {
            return res.status(404).json({ mensaje: "Usuario no encontrado" });
        }

        // Ahora req.usuario tiene TODO: id, email y el objeto ROL con sus permisos
        req.usuario = usuarioFull; 
        
        next(); 

    } catch (error) {
        return { error: 'Token inválido', mensaje: 'Tu sesión expiró' };
    }
};

module.exports = { verificarToken };