const { NotaDocente, Usuario, Proyecto, Rol } = require('../models');
const { Op } = require('sequelize');

/**
 * Controlador para la gestión de mensajería interna entre docentes.
 * Versión: 2.4.0
 */
const notaController = {

    /**
     * Crea una nueva nota/recordatorio.
     * Valida que el destino sea el mismo creador o un docente del mismo proyecto.
     */
    crearNota: async (req, res) => {
        try {
            const { titulo, descripcion, tipo, proyecto_id, destino_id } = req.body;
            const creador_id = req.usuario.id;

            // 1. Validar que el proyecto exista y el creador pertenezca a él
            const proyecto = await Proyecto.findByPk(proyecto_id, {
                include: [{ model: Usuario, as: 'integrantes', attributes: ['id', 'rol_id'] }]
            });

            if (!proyecto) {
                return res.status(404).json({ mensaje: "El proyecto no existe." });
            }

            // 2. Validar que el destino sea válido (uno mismo o colega docente en el proyecto)
            const esMismoUsuario = Number(creador_id) === Number(destino_id);
            const destinoEsDocenteEnProyecto = proyecto.integrantes.some(i => 
                Number(i.id) === Number(destino_id) && (Number(i.rol_id) === 1 || Number(i.rol_id) === 2)
            );

            if (!esMismoUsuario && !destinoEsDocenteEnProyecto) {
                return res.status(403).json({ mensaje: "Solo puedes enviar notas a ti mismo o a otros docentes del proyecto." });
            }

            const nuevaNota = await NotaDocente.create({
                titulo,
                descripcion,
                tipo,
                proyecto_id,
                creador_id,
                destino_id,
                estado: 'PENDIENTE'
            });

            return res.status(201).json({ success: true, data: nuevaNota });
        } catch (error) {
            console.error("ERROR EN crearNota:", error);
            return res.status(500).json({ mensaje: "Error al crear la nota" });
        }
    },

    /**
     * Obtiene las notas donde el usuario es destino o creador.
     */
    listarMisNotas: async (req, res) => {
        try {
            const usuario_id = req.usuario.id;

            const notas = await NotaDocente.findAll({
                where: {
                    [Op.or]: [
                        { destino_id: usuario_id },
                        { creador_id: usuario_id }
                    ]
                },
                include: [
                    { model: Usuario, as: 'creador', attributes: ['nombre', 'apellido', 'avatar'] },
                    { model: Usuario, as: 'destinatario', attributes: ['nombre', 'apellido', 'avatar'] },
                    { model: Proyecto, as: 'proyecto', attributes: ['nombre'] }
                ],
                order: [['created_at', 'DESC']]
            });

            return res.json({ success: true, data: notas });
        } catch (error) {
            console.error("ERROR EN listarMisNotas:", error);
            return res.status(500).json({ mensaje: "Error al obtener las notas" });
        }
    },

    /**
     * Cambia el estado de una nota (PENDIENTE <-> TERMINADA).
     */
    cambiarEstado: async (req, res) => {
        try {
            const { id } = req.params;
            const usuario_id = req.usuario.id;

            const nota = await NotaDocente.findByPk(id);

            if (!nota) return res.status(404).json({ mensaje: "Nota no encontrada" });

            // Solo el creador o el destinatario pueden marcarla como terminada
            if (Number(nota.creador_id) !== usuario_id && Number(nota.destino_id) !== usuario_id) {
                return res.status(403).json({ mensaje: "No tienes permiso para modificar esta nota" });
            }

            nota.estado = nota.estado === 'PENDIENTE' ? 'TERMINADA' : 'PENDIENTE';
            await nota.save();

            return res.json({ success: true, data: nota });
        } catch (error) {
            console.error("ERROR EN cambiarEstado:", error);
            return res.status(500).json({ mensaje: "Error al actualizar el estado" });
        }
    }
};

module.exports = notaController;