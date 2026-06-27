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

/**
 * @ruta GET /api/common/materias/especialidad/:especialidadId
 * @propósito Retornar las materias oficiales asociadas a la especialidad técnica del alumno evaluado.
 * @alimenta seguimientoService.obtenerMateriasPorEspecialidad (Frontend -> SeguimientoModal.vue y Gestión Curricular)
 * @retorna {Object} JSON con { success: true, data: [Materias ordenadas alfabéticamente] }
 */
router.get('/materias/especialidad/:especialidadId', verificarToken, async (req, res) => {
    try {
        const { especialidadId } = req.params;
        const { curso } = req.query; // Recibimos "6to", "3ro", etc.
        
        // --- LIMPIADOR DE CURSO ---
        // Expresión regular que saca solo los números de cualquier string
        // Si viene "6to", el match nos da ['6']. Si viene "3ro", ['3'].
        const match = curso ? curso.match(/(\d+)/) : null;
        const anio = match ? parseInt(match[0]) : 1; 
        
        const listaMaterias = await Materia.findAll({
            where: { 
                especialidad_id: Number(especialidadId),
                anio: anio // Asumiendo que ahora normalizaste tu tabla 'materias' con el campo 'anio'
            },
            order: [['nombre', 'ASC']]
        });

        res.json({ success: true, data: listaMaterias });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

/**
 * @ruta POST /api/common/materias
 * @propósito Registrar una nueva materia curricular asociándola directamente a una especialidad técnica.
 * @alimenta Modal de alta en la vista de Especialidades y Materias (Frontend -> MateriasConfigView.vue)
 * @retorna {Object} JSON con { success: true, data: [Objeto Materia recién creado] }
 */
router.post('/materias', verificarToken, async (req, res) => {
    try {
        const { nombre, especialidad_id, anio } = req.body; // Ahora recibís anio

        if (!nombre || !especialidad_id || !anio) {
            return res.status(400).json({ success: false, error: "Faltan datos obligatorios." });
        }

        const nuevaMateria = await Materia.create({
            nombre: nombre.trim().toUpperCase(),
            especialidad_id: Number(especialidad_id),
            anio: Number(anio) // Lo guardamos en BD
        });

        res.status(201).json({ success: true, data: nuevaMateria });
    } catch (error) {
        res.status(500).json({ success: false, error: "Error al registrar." });
    }
});


module.exports = router;