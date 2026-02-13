const { Usuario, Rol, Escuela, sequelize } = require('../models');
const { Op } = require('sequelize');

/**
 * Propósito: Crear un nuevo usuario gestionando transacciones para la relación con escuelas y reglas por rol.
 * Quién la llama: Invocada por POST /api/usuarios desde usuario.routes.js.
 * Retorna: Objeto JSON con el nuevo usuario o error 400/500.
 */
const crearUsuario = async (req, res) => {
    const t = await sequelize.transaction();
    try {
        const { nombre, apellido, email, password, rol_id, curso, division, telefono, escuelas_ids } = req.body;

        if (!nombre || !apellido || !email || !password || !rol_id) {
            return res.status(400).json({ error: 'Faltan datos obligatorios' });
        }

        // Regla de Alumnos (Rol 3)
        if (Number(rol_id) === 3) {
            if (!escuelas_ids || escuelas_ids.length !== 1) {
                return res.status(400).json({ error: 'Un alumno debe pertenecer a exactamente UNA escuela.' });
            }
            if (!curso || !division) {
                return res.status(400).json({ error: 'Curso y división son obligatorios para alumnos.' });
            }
        } else {
            // Regla para Personal (Docente/Admin)
            if (!escuelas_ids || escuelas_ids.length === 0) {
                return res.status(400).json({ error: 'El personal debe tener al menos una escuela asignada.' });
            }
        }

        const existe = await Usuario.findOne({ where: { email } });
        if (existe) return res.status(400).json({ error: 'El email ya está registrado' });

        const nuevoUsuario = await Usuario.create({
            nombre,
            apellido,
            email,
            password_hash: password,
            rol_id,
            curso: Number(rol_id) === 3 ? curso : null,
            division: Number(rol_id) === 3 ? division : null,
            telefono
        }, { transaction: t });

        await nuevoUsuario.setEscuelas(escuelas_ids, { transaction: t });

        await t.commit();
        return res.status(201).json(nuevoUsuario);

    } catch (error) {
        if (t) await t.rollback();
        console.error(error);
        return res.status(500).json({ error: 'Error al crear usuario' });
    }
};

/**
 * Propósito: Actualizar perfil de usuario, incluyendo lógica de permisos, cambio de password y subida de avatar.
 * Quién la llama: Invocada por PUT /api/usuarios/:id desde usuario.routes.js (pasa por Multer y AuthMiddleware).
 * Retorna: Objeto JSON con mensaje de éxito o error 403/404/500.
 */
const actualizarUsuario = async (req, res) => {
    const t = await sequelize.transaction();
    try {
        const usuarioLogueado = req.usuario; 
        const { id } = req.params; 
        const { nombre, apellido, email, password, rol_id, curso, division, telefono, activo, escuelas_ids } = req.body;

        // Validación de permisos: Alumnos solo editan su propio perfil
        if (Number(usuarioLogueado.rol_id) === 3 && Number(usuarioLogueado.id) !== Number(id)) {
            return res.status(403).json({ mensaje: "No tienes permiso para editar otros perfiles" });
        }

        const usuario = await Usuario.findByPk(id);
        if (!usuario) return res.status(404).json({ mensaje: "Usuario no encontrado" });

        const finalRol = rol_id || usuario.rol_id;
        let datosAActualizar = { nombre, apellido, email, telefono };

        // Mantenemos lógica de Curso/División según rol
        if (Number(finalRol) === 3) {
            datosAActualizar.curso = curso;
            datosAActualizar.division = division;
        } else {
            datosAActualizar.curso = null;
            datosAActualizar.division = null;
        }

        // Solo Admin/Docente cambia roles y estado activo
        if (Number(usuarioLogueado.rol_id) !== 3) {
            datosAActualizar.rol_id = rol_id;
            datosAActualizar.activo = activo;
        }

        // Manejo de Password: el hook del modelo hashea si cambia
        if (password && password.trim() !== "") {
            usuario.password_hash = password;
        }

        // --- NUEVA LÓGICA DE AVATAR ---
        // Si Multer subió un archivo, lo asignamos antes de guardar
        if (req.file) {
            datosAActualizar.avatar = req.file.filename;
        }

        Object.assign(usuario, datosAActualizar);
        await usuario.save({ transaction: t });

        // Actualización de escuelas asignadas
        if (escuelas_ids) {
            await usuario.setEscuelas(escuelas_ids, { transaction: t });
        }

        await t.commit();
        return res.json({ 
            mensaje: "Usuario actualizado correctamente",
            avatar: usuario.avatar // Enviamos el nombre del archivo para feedback del front
        });

    } catch (error) {
        if (t) await t.rollback();
        console.error(error);
        return res.status(500).json({ mensaje: "Error al actualizar usuario" });
    }
};

/**
 * Propósito: Obtener un perfil completo con sus relaciones (Escuelas, Rol) y el campo avatar.
 * Quién la llama: Invocada por GET /api/usuarios/:id desde usuario.routes.js.
 * Retorna: Objeto JSON del usuario o error 404.
 */
const obtenerUsuarioPorId = async (req, res) => {
    try {
        const { id } = req.params;
        const usuario = await Usuario.findByPk(id, {
            // Agregamos 'avatar' a los atributos recuperados
            attributes: ['id', 'nombre', 'apellido', 'email', 'rol_id', 'curso', 'division', 'telefono', 'activo', 'avatar'],
            include: [
                { 
                    model: Escuela, 
                    as: 'escuelas',
                    attributes: ['id', 'nombre_corto', 'nombre_largo'],
                    through: { attributes: [] }
                },
                {
                    model: Rol,
                    attributes: ['nombre']
                }
            ]
        });

        if (!usuario) return res.status(404).json({ mensaje: "Usuario no encontrado" });
        return res.json(usuario);
    } catch (error) {
        console.error("Error al obtener usuario:", error);
        return res.status(500).json({ error: 'Error al obtener el perfil' });
    }
};

/**
 * Propósito: Listar usuarios con filtros avanzados de búsqueda y pertenencia a escuela.
 * Quién la llama: Invocada por GET /api/usuarios desde usuario.routes.js.
 * Retorna: Array de objetos de usuarios ordenados por apellido.
 */
const listarUsuarios = async (req, res) => {
    try {
        const { q, curso, division, escuela_id } = req.query;
        let filtro = {};

        // Filtro por términos de búsqueda (Nombre, Apellido, Email)
        if (q) {
            const searchTerms = q.trim();
            filtro[Op.or] = [
                { nombre: { [Op.substring]: searchTerms } },
                { apellido: { [Op.substring]: searchTerms } },
                { email: { [Op.substring]: searchTerms } },
                sequelize.where(
                    sequelize.fn('concat', sequelize.col('usuario.nombre'), ' ', sequelize.col('usuario.apellido')),
                    { [Op.like]: `%${searchTerms}%` }
                ),
                sequelize.where(
                    sequelize.fn('concat', sequelize.col('usuario.apellido'), ' ', sequelize.col('usuario.nombre')),
                    { [Op.like]: `%${searchTerms}%` }
                )
            ];
        }

        if (curso) filtro.curso = curso;
        if (division) filtro.division = division;

        // Lógica de Escuela: Filtra según pertenencia a usuario_escuelas
        if (escuela_id) {
            filtro[Op.and] = [
                ...(filtro[Op.and] || []),
                {
                    [Op.or]: [
                        { rol_id: { [Op.ne]: 3 } }, 
                        {
                            [Op.and]: [
                                { rol_id: 3 },
                                sequelize.literal(`EXISTS (
                                    SELECT 1 FROM usuario_escuelas 
                                    WHERE usuario_escuelas.usuario_id = usuario.id 
                                    AND usuario_escuelas.escuela_id = ${Number(escuela_id)}
                                )`)
                            ]
                        }
                    ]
                }
            ];
        }

        const usuarios = await Usuario.findAll({
            where: filtro,
            // Agregamos 'avatar' para que el listado pueda mostrar miniaturas
            attributes: ['id', 'nombre', 'apellido', 'email', 'rol_id', 'curso', 'division', 'telefono', 'activo', 'avatar'],
            include: [
                { model: Rol, attributes: ['nombre'] },
                { 
                    model: Escuela, 
                    as: 'escuelas', 
                    attributes: ['id', 'nombre_corto', 'nombre_largo'],
                    through: { attributes: [] }
                }
            ],
            order: [['apellido', 'ASC']]
        });
        
        return res.json(usuarios);
    } catch (error) {
        console.error("Error detallado en listar usuarios:", error);
        return res.status(500).json({ error: 'Error al obtener usuarios' });
    }
};

module.exports = { 
    crearUsuario, 
    listarUsuarios, 
    actualizarUsuario, 
    obtenerUsuarioPorId 
};