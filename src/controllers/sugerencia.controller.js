const { Sugerencia, Usuario } = require("../models");

exports.obtenerSugerencias = async (req, res) => {
  try {
    const { rol_id, id: usuario_id } = req.usuario;
    let condicion = {};

    if (Number(rol_id) !== 1) {
      condicion.usuario_id = usuario_id;
    }

    const sugerencias = await Sugerencia.findAll({
      where: condicion,
      include: [{ 
        model: Usuario, 
        as: 'autor', 
        attributes: ['nombre', 'apellido'] 
      }],
      order: [['created_at', 'DESC']]
    });

    // Mapeamos para que el Front reciba 'createdAt' (CamelCase)
    const dataConFecha = sugerencias.map(item => {
      const plain = item.get({ plain: true });
      return {
        ...plain,
        createdAt: plain.created_at
      };
    });

    res.json({ success: true, data: dataConFecha });
  } catch (error) {
    console.error("Error en obtenerSugerencias:", error);
    res.status(500).json({ success: false, mensaje: "Error al recuperar datos" });
  }
};

exports.crearSugerencia = async (req, res) => {
  try {
    await Sugerencia.create({
      titulo: req.body.titulo,
      descripcion: req.body.descripcion,
      usuario_id: req.usuario.id,
      estado: 'PENDIENTE'
    });
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ success: false });
  }
};


exports.responderSugerencia = async (req, res) => {
  try {
    const sug = await Sugerencia.findByPk(req.params.id);
    await sug.update({
      respuesta_admin: req.body.respuesta_admin,
      admin_id: req.usuario.id,
      estado: 'RESPONDIDO'
    });
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ success: false });
  }
};