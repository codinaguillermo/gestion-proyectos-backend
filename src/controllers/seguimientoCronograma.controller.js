const { SeguimientoCronograma, Materia, Especialidad, Usuario } = require('../models');

/**
 * Propósito: Listar los controles de cronograma asociados a un proyecto con sus datos de materia y docente.
 * A quién alimenta: Vista de control de cronograma en el frontend.
 * Qué datos retorna: Array de objetos JSON con el listado ordenado por fecha descendente.
 */
const obtenerPorProyecto = async (req, res) => {
  try {
    const { proyectoId } = req.params;
    const seguimientos = await SeguimientoCronograma.findAll({
      where: { proyecto_id: proyectoId },
      include: [
        {
          model: Materia,
          as: 'materia',
          include: [{ model: Especialidad, as: 'especialidad' }]
        },
        {
          model: Usuario,
          as: 'docente',
          attributes: ['id', 'nombre', 'apellido']
        }
      ],
      order: [['fecha', 'DESC'], ['id', 'DESC']]
    });
    return res.json({ success: true, data: seguimientos });
  } catch (error) {
    console.error('Error al obtener controles de cronograma:', error);
    return res.status(500).json({ success: false, message: 'Error interno del servidor.' });
  }
};

/**
 * Propósito: Registrar un nuevo ítem de control de avance sobre el cronograma.
 * A quién alimenta: Formulario de carga en ControlCronogramaView.vue.
 * Qué datos retorna: Objeto del registro creado.
 */
const crear = async (req, res) => {
  try {
    const { proyectoId } = req.params;
    const { materia_id, fecha, descripcion, realizado, devolucion_docente } = req.body;
    const docente_id = req.usuario.id;

    if (!materia_id || !descripcion || !fecha) {
      return res.status(400).json({ success: false, message: 'Faltan campos obligatorios.' });
    }

    const nuevo = await SeguimientoCronograma.create({
      proyecto_id: proyectoId,
      materia_id,
      docente_id,
      fecha,
      descripcion,
      realizado: realizado || false,
      devolucion_docente: devolucion_docente || ''
    });

    const registroCompleto = await SeguimientoCronograma.findByPk(nuevo.id, {
      include: [
        {
          model: Materia,
          as: 'materia',
          include: [{ model: Especialidad, as: 'especialidad' }]
        },
        {
          model: Usuario,
          as: 'docente',
          attributes: ['id', 'nombre', 'apellido']
        }
      ]
    });

    return res.status(201).json({ success: true, data: registroCompleto });
  } catch (error) {
    console.error('Error al registrar control de cronograma:', error);
    return res.status(500).json({ success: false, message: 'Error al registrar.' });
  }
};

/**
 * Propósito: Actualizar el estado, descripción o devolución docente de un ítem de cronograma.
 * A quién alimenta: Modal de edición y switches de estado en el frontend.
 * Qué datos retorna: Objeto actualizado.
 */
const actualizar = async (req, res) => {
  try {
    const { id } = req.params;
    const { materia_id, fecha, descripcion, realizado, devolucion_docente } = req.body;

    const registro = await SeguimientoCronograma.findByPk(id);
    if (!registro) {
      return res.status(404).json({ success: false, message: 'Registro no encontrado.' });
    }

    await registro.update({
      materia_id: materia_id !== undefined ? materia_id : registro.materia_id,
      fecha: fecha !== undefined ? fecha : registro.fecha,
      descripcion: descripcion !== undefined ? descripcion : registro.descripcion,
      realizado: realizado !== undefined ? realizado : registro.realizado,
      devolucion_docente: devolucion_docente !== undefined ? devolucion_docente : registro.devolucion_docente
    });

    const registroCompleto = await SeguimientoCronograma.findByPk(id, {
      include: [
        {
          model: Materia,
          as: 'materia',
          include: [{ model: Especialidad, as: 'especialidad' }]
        },
        {
          model: Usuario,
          as: 'docente',
          attributes: ['id', 'nombre', 'apellido']
        }
      ]
    });

    return res.json({ success: true, data: registroCompleto });
  } catch (error) {
    console.error('Error al actualizar control de cronograma:', error);
    return res.status(500).json({ success: false, message: 'Error al actualizar.' });
  }
};

/**
 * Propósito: Eliminar un registro de control de cronograma.
 * A quién alimenta: Botón de eliminación en la vista de control.
 * Qué datos retorna: Mensaje de confirmación.
 */
const eliminar = async (req, res) => {
  try {
    const { id } = req.params;
    const registro = await SeguimientoCronograma.findByPk(id);
    if (!registro) {
      return res.status(404).json({ success: false, message: 'Registro no encontrado.' });
    }
    await registro.destroy();
    return res.json({ success: true, message: 'Registro eliminado con éxito.' });
  } catch (error) {
    console.error('Error al eliminar control de cronograma:', error);
    return res.status(500).json({ success: false, message: 'Error al eliminar.' });
  }
};
/**
 * Propósito: Obtener el listado completo de especialidades técnicas para los filtros del frontend.
 * A quién alimenta: Al selector de Especialidad en ControlCronogramaView.vue.
 * Qué datos retorna: Array de objetos JSON con las especialidades.
 */
const obtenerEspecialidades = async (req, res) => {
  try {
    const especialidades = await Especialidad.findAll();
    return res.json({ success: true, data: especialidades });
  } catch (error) {
    console.error('Error al obtener especialidades:', error);
    return res.status(500).json({ success: false, message: 'Error interno al buscar especialidades.' });
  }
};

/**
 * Propósito: Obtener el listado de materias curriculares para los filtros del frontend.
 * A quién alimenta: Al selector de Año y Materia en ControlCronogramaView.vue.
 * Qué datos retorna: Array de objetos JSON con las materias.
 */
const obtenerMaterias = async (req, res) => {
  try {
    const materias = await Materia.findAll({
      include: [{ model: Especialidad, as: 'especialidad' }]
    });
    return res.json({ success: true, data: materias });
  } catch (error) {
    console.error('Error al obtener materias:', error);
    return res.status(500).json({ success: false, message: 'Error interno al buscar materias.' });
  }
};

module.exports = {
  obtenerPorProyecto,
  crear,
  actualizar,
  eliminar,
  obtenerEspecialidades, 
  obtenerMaterias
};