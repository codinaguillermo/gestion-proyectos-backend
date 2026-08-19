const express = require('express');
const router = express.Router({ mergeParams: true });
const ctrl = require('../controllers/seguimientoCronograma.controller');
const { verificarToken } = require('../middlewares/auth.middleware');

/**
 * Propósito: Middleware local para asegurar que el usuario tenga rol de Admin (1) o Docente (2).
 * Retorna: Continúa el flujo (next) si tiene permisos, o rebota con un HTTP 403.
 */
const esDocenteOAdmin = (req, res, next) => {
    const rol = Number(req.usuario?.rol_id || req.usuario?.rolId);
    if (rol === 1 || rol === 2) {
        return next();
    }
    return res.status(403).json({ success: false, message: 'Acceso denegado. Se requiere rol docente.' });
};

// Rutas de uso general (Tablas Maestras)
router.get('/cronograma/especialidades', verificarToken, ctrl.obtenerEspecialidades);
router.get('/cronograma/materias', verificarToken, ctrl.obtenerMaterias);

// Rutas operativas (Cambiamos el orden de la URL para evitar el Error 403 de colisión)
router.get('/cronograma/proyecto/:proyectoId', verificarToken, ctrl.obtenerPorProyecto);
router.post('/cronograma/proyecto/:proyectoId', [verificarToken, esDocenteOAdmin], ctrl.crear);
router.put('/cronograma/:id', [verificarToken, esDocenteOAdmin], ctrl.actualizar);
router.delete('/cronograma/:id', [verificarToken, esDocenteOAdmin], ctrl.eliminar);

module.exports = router;