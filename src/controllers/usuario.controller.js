const { Usuario } = require('../models');

// Función para crear un usuario (Pública, usada en el registro manual si fuera necesario)
const crearUsuario = async (req, res) => {
    try {
        const { nombre, email, password } = req.body;

        // Validación simple
        if (!nombre || !email || !password) {
            return res.status(400).json({ error: 'Faltan datos obligatorios' });
        }

        // Verificar duplicados
        const existe = await Usuario.findOne({ where: { email } });
        if (existe) {
            return res.status(400).json({ error: 'El email ya está registrado' });
        }

        const nuevoUsuario = await Usuario.create({
            nombre,
            email,
            password_hash: password, // Recuerda: En producción esto se encripta
            rol_id: 2 // Por defecto rol 2 (Alumno) si se crea por aquí
        });

        return res.status(201).json(nuevoUsuario);
    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: 'Error al crear usuario' });
    }
};

const actualizarUsuario = async (req, res) => {
    try {
        // El ID lo sacamos del token (req.usuario.id) para que uno solo se edite a sí mismo
        const id = req.usuario.id; 
        const { nombre, email, password } = req.body;

        const usuario = await Usuario.findByPk(id);
        
        let datosAActualizar = { nombre, email };

        // Si mandó password, lo encriptamos
        if (password) {
            const salt = await bcrypt.genSalt(10);
            datosAActualizar.password_hash = await bcrypt.hash(password, salt);
        }

        await Usuario.update(datosAActualizar, { where: { id } });

        return res.json({ mensaje: "Perfil actualizado correctamente" });

    } catch (error) {
        console.error(error);
        return res.status(500).json({ mensaje: "Error al actualizar perfil" });
    }
};

// Función para listar usuarios (Protegida, solo para ver quién está en el sistema)
const listarUsuarios = async (req, res) => {
    try {
        // req.usuario viene del middleware (token)
        console.log("Usuario que solicita:", req.usuario);

        const usuarios = await Usuario.findAll({
            attributes: ['id', 'nombre', 'email', 'rol_id'] // No devolvemos el password por seguridad
        });
        
        return res.json(usuarios);
    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: 'Error al obtener usuarios' });
    }
};

// EXPORTACIÓN IMPORTANTE: Asegúrate de que están las dos funciones aquí
module.exports = {
    crearUsuario,
    listarUsuarios,
    actualizarUsuario
};