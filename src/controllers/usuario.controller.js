const { Usuario, Rol, Escuela, sequelize } = require('../models');
const { Op } = require('sequelize');

const crearUsuario = async (req, res) => {
    const t = await sequelize.transaction();
    try {
        const { nombre, apellido, email, password, rol_id, curso, division, telefono, escuelas_ids } = req.body;

        if (!nombre || !apellido || !email || !password || !rol_id) {
            return res.status(400).json({ error: 'Faltan datos obligatorios' });
        }

        if (Number(rol_id) === 3) {
            if (!escuelas_ids || escuelas_ids.length !== 1) {
                return res.status(400).json({ error: 'Un alumno debe pertenecer a exactamente UNA escuela.' });
            }
            if (!curso || !division) {
                return res.status(400).json({ error: 'Curso y división son obligatorios para alumnos.' });
            }
        } else {
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

const actualizarUsuario = async (req, res) => {
    const t = await sequelize.transaction();
    try {
        const usuarioLogueado = req.usuario; 
        const { id } = req.params; 
        const { nombre, apellido, email, password, rol_id, curso, division, telefono, activo, escuelas_ids } = req.body;

        if (Number(usuarioLogueado.rol_id) === 3 && Number(usuarioLogueado.id) !== Number(id)) {
            return res.status(403).json({ mensaje: "No tienes permiso para editar otros perfiles" });
        }

        const usuario = await Usuario.findByPk(id);
        if (!usuario) return res.status(404).json({ mensaje: "Usuario no encontrado" });

        const finalRol = rol_id || usuario.rol_id;
        let datosAActualizar = { nombre, apellido, email, telefono };

        if (Number(finalRol) === 3) {
            datosAActualizar.curso = curso;
            datosAActualizar.division = division;
        } else {
            datosAActualizar.curso = null;
            datosAActualizar.division = null;
        }

        if (Number(usuarioLogueado.rol_id) !== 3) {
            datosAActualizar.rol_id = rol_id;
            datosAActualizar.activo = activo;
        }

        if (password && password.trim() !== "") {
            usuario.password_hash = password;
        }

        Object.assign(usuario, datosAActualizar);
        await usuario.save({ transaction: t });

        if (escuelas_ids) {
            await usuario.setEscuelas(escuelas_ids, { transaction: t });
        }

        await t.commit();
        return res.json({ mensaje: "Usuario actualizado correctamente" });

    } catch (error) {
        if (t) await t.rollback();
        console.error(error);
        return res.status(500).json({ mensaje: "Error al actualizar usuario" });
    }
};

const obtenerUsuarioPorId = async (req, res) => {
    try {
        const { id } = req.params;
        const usuario = await Usuario.findByPk(id, {
            attributes: ['id', 'nombre', 'apellido', 'email', 'rol_id', 'curso', 'division', 'telefono', 'activo'],
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

const listarUsuarios = async (req, res) => {
    try {
        const { q, curso, division, escuela_id } = req.query;
        let filtro = {};

        // 1. Filtro por términos de búsqueda (Nombre, Apellido, Email)
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

        // 2. LA LÓGICA DE ESCUELA:
        // Si hay escuela_id, aplicamos la regla: (Es Admin/Docente) O (Es Alumno de ESTA escuela)
        if (escuela_id) {
            filtro[Op.and] = [
                ...(filtro[Op.and] || []), // Mantenemos otros filtros si existen
                {
                    [Op.or]: [
                        { rol_id: { [Op.ne]: 3 } }, // No es alumno (Docente/Admin)
                        {
                            [Op.and]: [
                                { rol_id: 3 }, // Es alumno
                                // Filtramos usando una subconsulta o el include para asegurar que pertenezca a la escuela
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

        let includeOptions = [
            { model: Rol, attributes: ['nombre'] },
            { 
                model: Escuela, 
                as: 'escuelas', 
                attributes: ['id', 'nombre_corto', 'nombre_largo'],
                through: { attributes: [] }
                // Quitamos el where de aquí para que no rompa la búsqueda de docentes globales
            }
        ];

        const usuarios = await Usuario.findAll({
            where: filtro,
            attributes: ['id', 'nombre', 'apellido', 'email', 'rol_id', 'curso', 'division', 'telefono', 'activo'],
            include: includeOptions,
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