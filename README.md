Análisis Técnico y Conceptual: Migración de GEPRES de HTTP a HTTPS

Fecha: 21 de julio de 2026

Proyecto: GEPRES (Gestión de Proyectos)

Autor/Responsable: Guillermo Codina
1. Introducción y Motivación del Cambio

Actualmente, el sistema GEPRES opera bajo el protocolo HTTP en el servidor de producción de la escuela (un equipo con Debian). Debido a esta condición, los navegadores modernos y los dispositivos móviles utilizados por los alumnos bloquean ciertas peticiones o muestran alertas de seguridad al intentar acceder al sitio.

El objetivo principal de este análisis es planificar la transición hacia HTTPS para garantizar una comunicación cifrada y segura, permitiendo que los alumnos accedan sin bloqueos de seguridad, sin alterar la infraestructura de red institucional ni modificar los puertos existentes.
2. Infraestructura de Red Analizada (Escuela)

Se evaluó el estado actual de la red perimetral e interna de la institución:

    Router Perimetral de la Escuela: Maneja múltiples servicios institucionales de forma simultánea, entre ellos:

        El sitio web oficial de la escuela.

        La plataforma de aprendizaje Moodle.

        El sistema GEPRES.

    Mapeo de Puertos (Port Forwarding): El tráfico externo hacia GEPRES ingresa y se deriva específicamente a través del puerto 3000.

    Servidor de Producción (Debian): Recibe las solicitudes en el puerto 3000 de manera local.

    Decisión arquitectónica clave: No se modificará el router institucional ni se cambiará el puerto 3000. El servicio pasará a hablar en formato cifrado (HTTPS) utilizando dicho puerto directamente en el Debian, garantizando que Moodle y el sitio oficial sigan operando sin interrupciones ni riesgos de ruptura.

3. Enfoque Tecnológico: Let's Encrypt vs. Alternativas

Para proveer el cifrado SSL/TLS en el servidor de producción (Debian), se seleccionó Let's Encrypt frente a otras alternativas.

    ¿Por qué Let's Encrypt?:

        Es una autoridad de certificación (CA) gratuita, automatizada y de código abierto respaldada por la comunidad global.

        Permite emitir certificados de confianza válidos que los navegadores y dispositivos móviles reconocen instantáneamente sin mostrar advertencias de seguridad.

    Ventajas sobre otras alternativas (como certificados autofirmados):

        Los certificados autofirmados generan alertas rojas de "Sitio no seguro" en los navegadores de los celulares de los alumnos, obligándolos a aceptar excepciones manuales (lo cual es inviable pedagógicamente y confuso para el usuario final). Let's Encrypt resuelve esto de forma transparente al ser una entidad oficialmente confiable.

4. Estructura de Archivos Originales (Inventario Inicial)
Frontend (GESTION-PROYECTOS-FRONT)

    src/

        assets/

        components/

            modals/ (ConfirmarModal.vue, crearSugerenciaModal.vue, DetalleSeguimientoModal.vue, editarSugerenciaModal.vue, escuelaModal.vue, ExportarNotasModal.vue, SeguimientoModal.vue, usuarioModal.vue)

            StatsProyecto.vue

            userStoryCard.vue

        middlewares/

        router/ (index.js)

        services/ (api.js, auth.service.js, calificacion.service.js, config.service.js, nota.service.js, project.services.js, reporte.service.js, seguimiento.service.js, sugerencia.service.js, tarea.service.js, userStory.service.js, usuario.services.js)

        stores/ (auth.js)

        views/ (DashboardView.vue, EscuelasLista.vue, HomeView.vue, LoginView.vue, MateriasConfigView.vue, MensajeriaView.vue, ProyectoConfigView.vue, SugerenciasView.vue, TareaDetailView.vue, TutorialesView.vue, userStoriesView.vue, UserStoryDetailView.vue, usuariosView.vue)

        App.vue

        main.js

        .env

Backend (GESTIONPROYECTOS)

    Directorios raíz:

        backup BD/

        dist/ (Contiene el frontend precompilado para producción)

        node_modules/

        public/

    src/

        config/ (db.js)

        controllers/ (auth.controller.js, common.controller.js, escuela.controller.js, nota.controller.js, proyecto.controller.js, reporte.controller.js, seguimiento.controller.js, stats.controller.js, sugerencia.controller.js, tarea.controller.js, userStory.controller.js, usuario.controller.js)

        middlewares/ (auth.middleware.js, autorizacion.middleware.js, upload.middleware.js)

        models/ (calificacionProyecto.model.js, entregable.model.js, escuela.model.js, especialidad.model.js, estadoProyecto.model.js, estadoTarea.model.js, estadoUS.model.js, hitoEvaluacion.model.js, index.js, materia.model.js, notaDocente.model.js, prioridad.model.js, prioridadUS.model.js, proyecto.model.js, rol.model.js, seguimiento.model.js, sugerencia.model.js, tarea.model.js, tipoTarea.model.js, tipoUs.model.js, userStory.model.js, usuario.model.js)

        routes/ (auth.routes.js, common.routes.js, escuela.routes.js, nota.routes.js, proyecto.routes.js, reporte.routes.js, seguimiento.routes.js, stats.routes.js, sugerencia.routes.js, tarea.routes.js, userStory.routes.js, usuario.routes.js)

    Archivos en raíz del Backend:

        .env, .gitignore, app.js, abrir proyecto.bat, run.bat, package.json, package-lock.json, debug.log, dump-gestion_proyectos-202606291009.sql, GEPRES - Análisis de pasar de http a https.docx

5. Detalles de Archivos Específicos Analizados
A. Frontend: src/services/api.js y .env

    Archivo .env: Posee únicamente la definición base: VITE_API_BASE_URL=/api.

    Archivo api.js:

        Configura Axios utilizando la URL base relativa o /api.

        Incorpora un interceptor de peticiones (request) que extrae el token del localStorage y lo inyecta mediante la cabecera estándar Authorization: Bearer ${token}.

        Cuenta con un interceptor de respuestas (response) que detecta códigos de estado 401 (No autorizado / Token expirado), limpia el almacenamiento local y realiza una redirección forzada: window.location.href = "[http://eet24proyectos.ddns.net:3000/login?session=expired](http://eet24proyectos.ddns.net:3000/login?session=expired)".

B. Backend: app.js

    Configura Express, middlewares de CORS y recepción de JSON.

    Administra las rutas de la API bajo el prefijo /api/....

    Aloja y sirve de manera estática los archivos compilados del frontend desde la carpeta dist, aplicando políticas de control de caché (evitando cachear el index.html y aplicando caché prolongada a los recursos con hash).

    Utiliza un middleware genérico de respaldo para redirigir el tráfico que no pertenezca a la API hacia el index.html (comportamiento estándar de SPA para Vue Router).

    Inicializa la conexión con Sequelize y levanta el servidor mediante app.listen(PORT) utilizando protocolo HTTP estándar en el puerto 3000.

6. Listado de Dudas y Respuestas Obtenidas del Análisis

    ¿El backend o el frontend necesitan cambios en su lógica de negocio general?

        Respuesta: No en su lógica de negocio, pero sí en cómo manejan las redirecciones absolutas y la inicialización del servidor.

    ¿Cómo se gestiona la autenticación de usuarios y representa un problema al migrar a HTTPS?

        Respuesta: Se constató mediante api.js que se emplean Tokens JWT en el localStorage enviados por cabecera HTTP, por lo que no se utilizan cookies de sesión. Esto simplifica la migración ya que no requiere configurar banderas de cookies (Secure/SameSite); el protocolo HTTPS cifrará de forma transparente las cabeceras de autorización.

    ¿Es necesario modificar el puerto 3000 o alterar el router de la escuela?

        Respuesta: No. El puerto 3000 puede seguir operando con normalidad a través de HTTPS. El router seguirá derivando el tráfico externo al mismo Debian sin afectar a Moodle ni al sitio institucional.

    ¿Qué detalle específico requiere corrección obligatoria en el frontend debido al protocolo?

        Respuesta: En el interceptor de respuesta de api.js, la redirección ante un error 401 apunta explícitamente a un esquema http://. Con HTTPS activo, esto debe ajustarse para evitar conflictos de contenido mixto.

7. Plan de Cambios a Tener en Cuenta
A. Cambios en el Entorno de Desarrollo (Windows 10 Local)

    Uso conceptual de herramientas como mkcert para generar certificados locales de confianza en la PC de desarrollo.

    Verificación de que las pruebas locales simulen correctamente el comportamiento seguro sin alterar los entornos de producción.

B. Cambios a Realizar en el Servidor de Producción (Debian)

    Generación e instalación de certificados oficiales de Let's Encrypt directamente en el sistema operativo Debian.

    Adaptación de la inicialización en el archivo app.js (o integración del módulo https de Node.js) para que el servidor escuche de forma cifrada en el puerto 3000 utilizando las rutas de las claves de seguridad provistas por Let's Encrypt.

    Actualización del enlace absoluto de redirección por expiración de sesión (401) detectado en api.js para prevenir advertencias de contenido mixto en los navegadores.


    Reglas de trabajo vigentes
    Siempre que trabajamos con temas de desarrollo de SW, no simplifiques nada. No refactorices código existente. No supongas nada. Si no te acuerdas, pídeme lo que sea (archivo o dato) y lo buscamos. No mandes 3 parches a la vez, uno para cada archivo diferente. Manda el código completo. Cuando diga "pará", detente inmediatamente sin mandar explicaciones o más código nuevo. No saques conclusiones sin tener la información completa. Cada función que creemos o modifiquemos incluirá obligatoriamente un comentario detallado con su propósito, a quién alimenta (quién la llama) y qué datos retorna. Totalmente prohibido mezclar temas entre hilos de conversaciones (salgo que se indique explísitamente). 