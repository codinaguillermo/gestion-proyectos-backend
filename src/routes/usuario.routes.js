const express = require('express');
const router = express.Router();
const usuarioController = require('../controllers/usuario.controller');
const { verificarToken } = require('../middlewares/auth.middleware');
const upload = require('../middlewares/upload.middleware');

/**
 * usuario.routes.js
 * Propósito: Definir las rutas del API para la entidad de usuarios, manteniendo un orden jerárquico estricto.
 * Alimentado por: Las solicitudes HTTP enviadas desde el Frontend (servicios de usuario).
 * Datos que retorna: Despacha la ejecución hacia el método correspondiente en usuario.controller.js.
 */

// 1. Crear usuario
router.post('/', upload.single('avatar'), usuarioController.crearUsuario);

// 2. Listar usuarios
router.get('/', verificarToken, usuarioController.listarUsuarios);

// --- RUTAS ESPECÍFICAS (ARRIBA) ---

/**
 * Propósito: Interceptar la solicitud de lectura del listado de cuentas en espera de aprobación antes de que sea evaluada por el comodín numérico /:id.
 * Quién la llama: Petición HTTP GET enviada desde el Frontend por personal docente o administrativo.
 * Qué datos retorna: Despacha la ejecución hacia usuarioController.obtenerPendientes.
 */
router.get('/pendientes', verificarToken, usuarioController.obtenerPendientes);

// NUEVO: Setea a cero el contador de mensajes sin leer del usuario autenticado
router.put('/reset-mensajes', verificarToken, usuarioController.resetearMensajesSinLeer);

/**
 * Corregido: Se cambió obtenerListadoProyectosAlumno por obtenerListadoProyectosUsuario
 */
router.get('/:id/proyectos-asignados', verificarToken, usuarioController.obtenerListadoProyectosUsuario);

/**
 * Propósito: Capturar la acción de habilitación y aprobación operativa para una cuenta en estado de solicitud pendiente.
 * Quién la llama: Petición HTTP PUT enviada desde el panel de gestión de solicitudes en el Frontend.
 * Qué datos retorna: Despacha la ejecución hacia usuarioController.aprobarSolicitud passing el ID de usuario en los parámetros de ruta.
 */
router.put('/:id/aprobar', verificarToken, usuarioController.aprobarSolicitud);

// --- RUTAS GENÉRICAS (ABAJO) ---

// 3. Obtener un usuario específico por su ID
router.get('/:id', verificarToken, usuarioController.obtenerUsuarioPorId);

// 4. Actualizar usuario
router.put('/:id', verificarToken, upload.single('avatar'), usuarioController.actualizarUsuario);


module.exports = router;