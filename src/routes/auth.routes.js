const express = require('express');
const router = express.Router();
const authController = require('../controllers/auth.controller');

// POST http://localhost:3000/api/auth/registro  
router.post('/registro', authController.registro);

// POST http://localhost:3000/api/auth/login
router.post('/login', authController.login);

module.exports = router;