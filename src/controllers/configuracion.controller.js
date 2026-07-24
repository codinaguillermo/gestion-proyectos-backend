const { Configuracion } = require('../models');

/**
 * Propósito: Consultar en la base de datos el año lectivo activo del sistema (registro con id: 1). Si no existe, lo inicializa automáticamente con el valor por defecto '2026'.
 * A quién alimenta (quién la llama): Rutas de configuración (GET /api/configuraciones/anio-lectivo), accionado por el NavBar, modales y componentes curriculares.
 * Qué datos retorna: Objeto JSON con la propiedad success (boolean) y el objeto data conteniendo la configuración { id: 1, nombre: 'anio_lectivo', valor: '2026' }.
 */
const obtenerAnioLectivo = async (req, res) => {
  try {
    let config = await Configuracion.findByPk(1);

    if (!config) {
      config = await Configuracion.create({
        id: 1,
        nombre: 'anio_lectivo',
        valor: '2026'
      });
    }

    return res.status(200).json({
      success: true,
      data: config
    });
  } catch (error) {
    console.error('Error al obtener el año lectivo global:', error);
    return res.status(500).json({
      success: false,
      mensaje: 'Error interno del servidor al consultar la configuración del año lectivo.'
    });
  }
};

/**
 * Propósito: Modificar el valor del año lectivo global en el registro con id: 1 de la base de datos.
 * A quién alimenta (quién la llama): Rutas de configuración (PUT /api/configuraciones/anio-lectivo), accionado desde el modal de configuración en el NavBar.
 * Qué datos retorna: Objeto JSON con la propiedad success (boolean), mensaje de confirmación y el objeto data con el registro actualizado.
 */
const actualizarAnioLectivo = async (req, res) => {
  const { valor } = req.body;

  if (!valor || isNaN(Number(valor)) || String(valor).trim().length !== 4) {
    return res.status(400).json({
      success: false,
      mensaje: 'El año lectivo debe ser un valor numérico válido de 4 dígitos.'
    });
  }

  try {
    let config = await Configuracion.findByPk(1);

    if (!config) {
      config = await Configuracion.create({
        id: 1,
        nombre: 'anio_lectivo',
        valor: String(valor).trim()
      });
    } else {
      config.valor = String(valor).trim();
      await config.save();
    }

    return res.status(200).json({
      success: true,
      mensaje: 'Año lectivo actualizado correctamente en el sistema.',
      data: config
    });
  } catch (error) {
    console.error('Error al actualizar el año lectivo global:', error);
    return res.status(500).json({
      success: false,
      mensaje: 'Error interno del servidor al intentar modificar el año lectivo.'
    });
  }
};

/**
 * Propósito: Recuperar el listado completo de configuraciones globales registradas en el sistema.
 * A quién alimenta (quién la llama): Rutas de configuración (GET /api/configuraciones).
 * Qué datos retorna: Objeto JSON con la propiedad success (boolean) y el array data con todas las filas de la tabla configuraciones.
 */
const obtenerTodas = async (req, res) => {
  try {
    const configuraciones = await Configuracion.findAll({
      order: [['id', 'ASC']]
    });

    return res.status(200).json({
      success: true,
      data: configuraciones
    });
  } catch (error) {
    console.error('Error al obtener las configuraciones del sistema:', error);
    return res.status(500).json({
      success: false,
      mensaje: 'Error interno del servidor al consultar las configuraciones.'
    });
  }
};

module.exports = {
  obtenerAnioLectivo,
  actualizarAnioLectivo,
  obtenerTodas
};