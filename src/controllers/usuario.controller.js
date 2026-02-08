const { Usuario, Rol } = require('../models'); // Asegurate que Rol esté aquí
const { Op } = require('sequelize');


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



const listarUsuarios = async (req, res) => {
    try {
        const { q } = req.query; // Capturamos el término de búsqueda (ej: /usuarios?q=guille)
        let filtro = {};

        // Si viene un parámetro de búsqueda, filtramos por nombre o email
       if (q) {
            filtro = {
                [Op.or]: [
                    { nombre: { [Op.substring]: q } }, // Busca en cualquier parte de la cadena
                    { email: { [Op.substring]: q } }
                ]
            };
        }

        const usuarios = await Usuario.findAll({
            where: filtro, // Aplicamos el filtro dinámico
            attributes: ['id', 'nombre', 'email', 'rol_id'],
            include: [{ model: Rol, attributes: ['nombre'] }], // Traemos el nombre del rol
            limit: q ? 10 : 100 // Si busca, limitamos a los 10 mejores resultados
        });
        
        return res.json(usuarios);
    } catch (error) {
        console.error("Error en listar/buscar usuarios:", error);
        return res.status(500).json({ error: 'Error al obtener usuarios' });
    }
};

// EXPORTACIÓN IMPORTANTE: Asegúrate de que están las dos funciones aquí
module.exports = {
    crearUsuario,
    listarUsuarios,
    actualizarUsuario
};