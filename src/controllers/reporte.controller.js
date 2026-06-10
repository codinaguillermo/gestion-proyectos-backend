const { Usuario, Escuela, Seguimiento, Materia } = require('../models');

// ¡ATENCIÓN GUILLE! 
// Reemplazá este número por el ID real que tenga el rol "Alumno" en tu tabla 'roles'.
const ROL_ALUMNO_ID = 3; 

/**
 * @función obtenerFiltrosPlanilla
 * @propósito Recuperar de la base de datos las escuelas, cursos/divisiones y materias disponibles.
 * @quien_la_llama El frontend (ExportarNotasModal.vue) al montar el componente para poblar los selects.
 * @retorna {Object} JSON con { success: true, data: { escuelas: [...], cursosDivisiones: [...], materias: [...] } }
 */
exports.obtenerFiltrosPlanilla = async (req, res) => {
    try {
        const escuelas = await Escuela.findAll({
            attributes: ['id', 'nombre_corto', 'nombre_largo'],
            order: [['nombre_corto', 'ASC']]
        });

        const materias = await Materia.findAll({
            attributes: ['id', 'nombre'],
            order: [['nombre', 'ASC']]
        });

        const alumnos = await Usuario.findAll({
            where: { rol_id: ROL_ALUMNO_ID },
            attributes: ['curso', 'division']
        });

        const combinacionesUnicas = [];
        const mapa = new Set();

        alumnos.forEach(al => {
            if (al.curso && al.division) {
                const llave = `${al.curso}-${al.division}`;
                if (!mapa.has(llave)) {
                    mapa.add(llave);
                    combinacionesUnicas.push({ curso: al.curso, division: al.division });
                }
            }
        });

        combinacionesUnicas.sort((a, b) => {
            if (a.curso === b.curso) return a.division.localeCompare(b.division);
            return a.curso.localeCompare(b.curso);
        });

        res.json({ 
            success: true, 
            data: { 
                escuelas, 
                cursosDivisiones: combinacionesUnicas,
                materias 
            } 
        });
    } catch (error) {
        console.error("Error al obtener filtros para planilla:", error);
        res.status(500).json({ success: false, error: error.message });
    }
};

/**
 * @función generarDatosPlanillaExcel
 * @propósito Consultar la BD, pivotar las calificaciones como columnas dinámicas por fecha de evaluación y calcular el promedio final.
 * @quien_la_llama El frontend (ExportarNotasModal.vue) al hacer clic en el botón "Generar Excel".
 * @retorna {Object} JSON con { success: true, data: Array de objetos purificados }
 */
exports.generarDatosPlanillaExcel = async (req, res) => {
    try {
        const { escuela_id, curso, division, materia_id } = req.body;

        if (!escuela_id || !curso || !division || !materia_id) {
            return res.status(400).json({ success: false, error: "Debe seleccionar escuela, curso, división y materia." });
        }

        const materiaDatos = await Materia.findByPk(materia_id, { attributes: ['nombre'] });
        const nombreMateria = materiaDatos ? materiaDatos.nombre : 'Materia Desconocida';

        const alumnos = await Usuario.findAll({
            where: {
                curso: curso,
                division: division,
                rol_id: ROL_ALUMNO_ID
            },
            attributes: ['id', 'apellido', 'nombre', 'curso', 'division'],
            include: [
                {
                    model: Escuela,
                    as: 'escuelas',
                    where: { id: escuela_id },
                    attributes: ['nombre_corto'],
                    through: { attributes: [] } 
                },
                {
                    model: Seguimiento,
                    as: 'seguimientosRecibidos',
                    // CORRECCIÓN: Usamos snake_case exacto como está en tu base de datos
                    attributes: ['desempeno', 'created_at'],
                    where: { materia_id: materia_id }, 
                    required: false 
                }
            ],
            order: [
                ['apellido', 'ASC'],
                ['nombre', 'ASC']
            ]
        });

        // PASO 1: Recolectar todas las fechas exactas de evaluación que existen en este grupo
        const setFechas = new Set();
        
        alumnos.forEach(al => {
            if (al.seguimientosRecibidos && al.seguimientosRecibidos.length > 0) {
                al.seguimientosRecibidos.forEach(nota => {
                    // CORRECCIÓN: Usamos created_at
                    const d = new Date(nota.created_at);
                    const dia = String(d.getDate()).padStart(2, '0');
                    const mes = String(d.getMonth() + 1).padStart(2, '0');
                    const anio = d.getFullYear();
                    setFechas.add(`${dia}/${mes}/${anio}`);
                });
            }
        });

        // Ordenar las fechas cronológicamente para que las columnas del Excel tengan sentido temporal
        const columnasFechas = Array.from(setFechas).sort((a, b) => {
            const [diaA, mesA, añoA] = a.split('/');
            const [diaB, mesB, añoB] = b.split('/');
            return new Date(añoA, mesA - 1, diaA) - new Date(añoB, mesB - 1, diaB);
        });

        // PASO 2: Armar la fila de cada alumno asegurando que el orden de las propiedades sea estricto
        const datosPurificados = alumnos.map(al => {
            const fila = {
                "Apellido": al.apellido.toUpperCase(),
                "Nombre": al.nombre,
                "Escuela": al.escuelas[0]?.nombre_corto || "N/A",
                "Curso": al.curso,
                "División": al.division,
                "Asignatura": nombreMateria
            };

            let suma = 0;
            let cantidadNotas = 0;

            // Pre-cargamos todas las columnas de fechas con vacío.
            columnasFechas.forEach(fechaCol => {
                fila[fechaCol] = ""; 
            });

            if (al.seguimientosRecibidos && al.seguimientosRecibidos.length > 0) {
                al.seguimientosRecibidos.forEach(nota => {
                    // CORRECCIÓN: Usamos created_at
                    const d = new Date(nota.created_at);
                    const dia = String(d.getDate()).padStart(2, '0');
                    const mes = String(d.getMonth() + 1).padStart(2, '0');
                    const anio = d.getFullYear();
                    const fechaStr = `${dia}/${mes}/${anio}`;
                    
                    const valorNota = Number(nota.desempeno);
                    fila[fechaStr] = valorNota;
                    
                    suma += valorNota;
                    cantidadNotas++;
                });
            }

            let promedio = cantidadNotas > 0 ? (suma / cantidadNotas).toFixed(2) : 0;
            fila["Promedio_GEPRES"] = promedio > 0 ? Number(promedio) : "Sin calificar";

            return fila;
        });

        res.json({ success: true, data: datosPurificados });
    } catch (error) {
        console.error("Error al procesar los datos para el Excel:", error);
        res.status(500).json({ success: false, error: error.message });
    }
};