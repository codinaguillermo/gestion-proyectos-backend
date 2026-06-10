const express = require('express');
const router = express.Router();
// Importamos todo lo que necesitamos del controlador common
const commonCtrl = require('../controllers/common.controller');
const { verificarToken } = require('../middlewares/auth.middleware'); 
const notaRoutes = require('./nota.routes');
const { Materia } = require('../models'); // Importación directa del modelo v2.7.0

// Usamos el objeto commonCtrl para llamar a las funciones
router.get('/prioridades-us', verificarToken, commonCtrl.getPrioridadesUS);
router.get('/estados-us', verificarToken, commonCtrl.getEstadosUS);

router.get('/escuelas', verificarToken, commonCtrl.listarEscuelas);
router.get('/roles', verificarToken, commonCtrl.listarRoles);

// Para el combo de especialidades en el modal de alumnos
router.get('/especialidades', commonCtrl.listarEspecialidades);

// ============================================================================
// --- RUTAS NUEVAS v2.6.0: ENDPOINTS MAESTROS DE EVALUACIÓN ------------------
// ============================================================================
router.get('/hitos-evaluacion', verificarToken, commonCtrl.listarHitosEvaluacion);

router.use('/notas-docentes', notaRoutes);

// ============================================================================
// --- RUTA NUEVA v2.7.0: SEGMENTACIÓN CURRICULAR POR ASIGNATURA --------------
// ============================================================================
/**
 * @ruta GET /api/common/materias/especialidad/:especialidadId
 * @propósito Retornar las materias oficiales asociadas a la especialidad técnica del alumno evaluado.
 * @alimenta seguimientoService.obtenerMateriasPorEspecialidad (Frontend -> SeguimientoModal.vue y Gestión Curricular)
 * @retorna {Object} JSON con { success: true, data: [Materias ordenadas alfabéticamente] }
 */
router.get('/materias/especialidad/:especialidadId', verificarToken, async (req, res) => {
    try {
        const { especialidadId } = req.params;
        
        if (!especialidadId) {
            return res.status(400).json({ success: false, error: "El ID de la especialidad es requerido." });
        }

        const listaMaterias = await Materia.findAll({
            where: { especialidad_id: Number(especialidadId) },
            order: [['nombre', 'ASC']] // Orden alfabético prolijo para el combo select
        });

        res.json({ success: true, data: listaMaterias });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// ============================================================================
// --- RUTA NUEVA v2.8.0: CREACIÓN DE MATERIA (GESTIÓN CURRICULAR) ------------
// ============================================================================
/**
 * @ruta POST /api/common/materias
 * @propósito Registrar una nueva materia curricular asociándola directamente a una especialidad técnica.
 * @alimenta Modal de alta en la vista de Especialidades y Materias (Frontend -> MateriasConfigView.vue)
 * @retorna {Object} JSON con { success: true, data: [Objeto Materia recién creado] }
 */
router.post('/materias', verificarToken, async (req, res) => {
    try {
        const { nombre, especialidad_id } = req.body;

        // Validación de datos entrantes
        if (!nombre || !especialidad_id) {
            return res.status(400).json({ success: false, error: "El nombre de la materia y la especialidad son obligatorios." });
        }

        // Creación del registro
        const nuevaMateria = await Materia.create({
            nombre: nombre.trim().toUpperCase(), // Guardamos en mayúsculas para mantener consistencia
            especialidad_id: Number(especialidad_id)
        });

        res.status(201).json({ success: true, data: nuevaMateria });
    } catch (error) {
        console.error("ERROR EN POST /materias:", error);
        res.status(500).json({ success: false, error: "Error del servidor al intentar registrar la materia." });
    }
});


module.exports = router;