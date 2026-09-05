const { Usuario, Asistencia, Escuela } = require('../models');

/**
 * @función obtenerAlumnosParaAsistencia
 * @propósito Obtener el listado de alumnos activos de un curso, división y escuela específicos, cruzando los datos con los registros de asistencia previos para una fecha y materia dadas. Si no hay registro, el alumno figura como presente por defecto.
 * @alimenta Ruta GET /api/asistencias/alumnos (Frontend -> Vista de Toma de Asistencia, al completar los filtros superiores)
 * @retorna {Object} JSON con { success: true, data: [Lista de alumnos con estado de asistencia] }
 */
const obtenerAlumnosParaAsistencia = async (req, res) => {
  try {
    const { escuela_id, curso, division, materia_id, fecha } = req.query;

    if (!escuela_id || !curso || !division || !materia_id || !fecha) {
      return res.status(400).json({ success: false, error: 'Faltan parámetros obligatorios.' });
    }

    // Buscamos los alumnos activos que pertenezcan a la escuela, curso y división
    const alumnos = await Usuario.findAll({
      where: {
        curso: curso,
        division: division,
        activo: true
      },
      include: [
        {
          model: Escuela,
          as: 'escuelas',
          where: { id: escuela_id },
          attributes: ['id'] // Solo cruzamos para validar que el usuario pertenezca a la escuela
        },
        {
          model: Asistencia,
          as: 'asistenciasRegistradas',
          where: { fecha: fecha, materia_id: materia_id },
          required: false // LEFT JOIN para traer al alumno incluso si no tiene asistencia cargada hoy
        }
      ],
      order: [['apellido', 'ASC'], ['nombre', 'ASC']]
    });

    // Mapeamos los datos para enviar un listado limpio al frontend
    const data = alumnos.map(alumno => {
      // Si tiene un registro en 'asistenciasRegistradas', usamos ese valor. Si no, true (Presente) por defecto.
      const registro = alumno.asistenciasRegistradas && alumno.asistenciasRegistradas.length > 0 
                       ? alumno.asistenciasRegistradas[0] 
                       : null;
                       
      return {
        alumno_id: alumno.id,
        nombre: alumno.nombre,
        apellido: alumno.apellido,
        avatar: alumno.avatar,
        asistencia_id: registro ? registro.id : null,
        presente: registro ? registro.presente : true
      };
    });

    res.json({ success: true, data });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

/**
 * @función guardarAsistenciaDiaria
 * @propósito Guardar o actualizar de forma masiva los registros de asistencia de un curso para una materia y fecha específicas.
 * @alimenta Ruta POST /api/asistencias (Frontend -> Botón "Guardar Asistencia" en la vista móvil)
 * @retorna {Object} JSON con { success: true, message: 'Asistencia guardada correctamente.' }
 */
const guardarAsistenciaDiaria = async (req, res) => {
  try {
    const { escuela_id, curso, division, materia_id, fecha, lista_asistencia } = req.body;
    
    // Obtenemos el ID del docente desde el token JWT interceptado por el middleware
    const docente_id = req.usuario.id; 

    if (!escuela_id || !curso || !division || !materia_id || !fecha || !lista_asistencia || !Array.isArray(lista_asistencia)) {
      return res.status(400).json({ success: false, error: 'Faltan parámetros obligatorios o la lista de asistencia es inválida.' });
    }

    // Iteramos sobre el array que manda el frontend para hacer UPSERT (Insertar si no existe, Actualizar si ya existe)
    for (const item of lista_asistencia) {
      const registroExistente = await Asistencia.findOne({
        where: {
          alumno_id: item.alumno_id,
          materia_id: materia_id,
          fecha: fecha
        }
      });

      if (registroExistente) {
        await registroExistente.update({ presente: item.presente });
      } else {
        await Asistencia.create({
          alumno_id: item.alumno_id,
          docente_id: docente_id,
          materia_id: materia_id,
          escuela_id: escuela_id,
          curso: curso,
          division: division,
          fecha: fecha,
          presente: item.presente
        });
      }
    }

    res.json({ success: true, message: 'Asistencia guardada correctamente.' });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

module.exports = {
  obtenerAlumnosParaAsistencia,
  guardarAsistenciaDiaria
};