const express = require('express');
const router = express.Router();
const authController = require('../controllers/auth.controller');

/**
 * auth.routes.js
 * Propósito: Definir los puntos de entrada para la autenticación de usuarios y la gestión de acceso al sistema.
 * Alimentado por: authController (métodos login y solicitarCuenta).
 * A quién alimenta: Al servidor Express principal (app.js / server.js) que monta estas rutas en el prefijo /api/auth.
 */

/**
 * Propósito: Recibir la petición de alta de cuenta de alumnos o profesores y derivarla al controlador para su inserción en estado inactivo.
 * Quién la llama: Petición HTTP POST enviada desde el formulario de la vista /solicitar-cuenta en el Frontend (Vue/Pinia).
 * Qué datos retorna: Respuesta HTTP procesada por authController.solicitarCuenta (JSON con éxito o error de validación).
 */
router.post('/solicitar-cuenta', authController.solicitarCuenta);

/**
 * Propósito: Procesar el inicio de sesión del usuario verificando credenciales y estado activo en el sistema.
 * Quién la llama: Petición HTTP POST enviada desde LoginView.vue en el Frontend al presionar "Ingresar al Sistema".
 * Qué datos retorna: Respuesta HTTP procesada por authController.login (JSON con token JWT y datos públicos del usuario).
 */
router.post('/login', authController.login);

module.exports = router;