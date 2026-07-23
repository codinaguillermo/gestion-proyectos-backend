const nodemailer = require('nodemailer');

/**
 * email.service.js
 * Propósito: Gestionar la configuración del transporte SMTP en modo Pool controlado y el envío transaccional de notificaciones institucionales del sistema GEPRES, optimizado para evitar penalizaciones antispam y bloqueos de IP en ráfagas masivas.
 * Alimentado por: Las variables de entorno de configuración (.env) y los controladores del backend (ej: usuario.controller.js).
 * Datos que retorna: Objeto modular con las funciones de envío de correos que devuelven promesas con el estado y metadatos del despacho.
 */

// Configuración del transbordador SMTP en modo Pool con Rate Limiting para ráfagas escolares
const transporter = nodemailer.createTransport({
    pool: true,                // Mantiene conexiones abiertas para reutilizarlas en aprobaciones masivas
    maxConnections: 5,         // Número máximo de conexiones simultáneas contra el servidor de Gmail
    maxMessages: 100,          // Límite de mensajes por cada conexión abierta antes de renovarla
    rateDelta: 1000,           // Ventana de tiempo de control en milisegundos (1 segundo)
    rateLimit: 5,              // Máximo 5 correos despachados por segundo para no disparar alertas anti-spam en Gmail
    host: process.env.EMAIL_HOST || 'smtp.gmail.com',
    port: Number(process.env.EMAIL_PORT) || 465,
    secure: true,              // true para el puerto 465 (SSL/TLS directo)
    auth: {
        user: process.env.EMAIL_USER || 'gepresbot.edu@gmail.com',
        pass: process.env.EMAIL_PASS || 'clave_no_configurada'
    }
});

/**
 * Propósito: Enviar un correo electrónico institucional de bienvenida y notificación de habilitación de cuenta a un nuevo usuario (Alumno o Docente), informándole sus credenciales iniciales en formato dual (HTML + Texto plano) y con cabeceras RFC de automatización antispam.
 * Quién la llama: Invocada por la función `aprobarSolicitud` en el archivo `usuario.controller.js` inmediatamente después de cambiar el estado del usuario a activo en la base de datos.
 * Qué datos retorna: Objeto JSON con la estructura `{ success: boolean, mensaje: string, error?: any }` para auditar si el despacho fue exitoso o capturar fallos sin detener la transacción principal de la base de datos.
 */
const enviarCorreoAprobacion = async (emailDestino, nombre, apellido, rolNombre, passwordTemporal) => {
    try {
        const remitente = process.env.EMAIL_USER || 'gepresbot.edu@gmail.com';
        
        // Versión en texto plano (Plain Text) exigida por los escáneres anti-spam para validar la legitimidad
        const contenidoTextoPlano = `
GEPRES - PLATAFORMA DE GESTIÓN DE PROYECTOS ESCOLARES
---------------------------------------------------------------------

¡Hola, ${nombre} ${apellido}!

Te informamos que tu solicitud de registro con el perfil de ${rolNombre} ha sido revisada y APROBADA por la administración escolar.

A partir de este momento ya puedes ingresar a la plataforma utilizando tu correo electrónico y la siguiente contraseña temporal de acceso:

Contraseña temporal: ${passwordTemporal}

* Por motivos de seguridad, te recomendamos dirigirte a la sección "Mi Perfil" y cambiar esta contraseña luego de iniciar sesión por primera vez.

---------------------------------------------------------------------
Este es un mensaje automático enviado por el sistema GEPRES.
Por favor, no respondas directamente a esta dirección de correo.
        `.trim();

        // Estructura visual HTML adaptada a los estándares de diseño y colores institucionales de GEPRES
        const contenidoHtml = `
            <div style="background-color: #0f1419; padding: 30px; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; color: #ffffff; line-height: 1.6;">
                <div style="max-width: 600px; margin: 0 auto; background: #1a222b; border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 12px; overflow: hidden; box-shadow: 0 8px 20px rgba(0,0,0,0.5);">
                    
                    <!-- Encabezado -->
                    <div style="background-color: #141b22; padding: 20px 30px; border-bottom: 2px solid #56ccf2; text-align: center;">
                        <h1 style="color: #ffffff; margin: 0; font-size: 24px; letter-spacing: 1px;">GEPRES</h1>
                        <p style="color: #8ce0eb; margin: 5px 0 0 0; font-size: 14px; font-weight: 600;">PLATAFORMA DE GESTIÓN DE PROYECTOS ESCOLARES</p>
                    </div>

                    <!-- Cuerpo del Mensaje -->
                    <div style="padding: 30px;">
                        <h2 style="color: #ffffff; font-size: 20px; margin-top: 0;">¡Hola, ${nombre} ${apellido}!</h2>
                        
                        <p style="color: #d1d5db; font-size: 16px;">
                            Te informamos que tu solicitud de registro con el perfil de <strong style="color: #56ccf2;">${rolNombre}</strong> ha sido revisada y <strong style="color: #23d160;">APROBADA</strong> por la administración escolar.
                        </p>

                        <p style="color: #d1d5db; font-size: 16px;">
                            A partir de este momento ya puedes ingresar a la plataforma utilizando tu correo electrónico y la contraseña inicial asignada para tu cuenta:
                        </p>

                        <!-- Caja de Credenciales -->
                        <div style="background-color: #0f1419; border: 1px dashed #56ccf2; border-radius: 8px; padding: 15px 20px; margin: 25px 0; text-align: center;">
                            <p style="margin: 0; color: #9ca3af; font-size: 14px;">Tu contraseña temporal de acceso:</p>
                            <p style="margin: 8px 0 0 0; color: #ffdd57; font-size: 20px; font-weight: bold; letter-spacing: 1.5px;">${passwordTemporal}</p>
                        </div>

                        <p style="color: #9ca3af; font-size: 14px; font-style: italic;">
                            * Por motivos de seguridad, te recomendamos dirigirte a la sección "Mi Perfil" y cambiar esta contraseña luego de iniciar sesión por primera vez.
                        </p>
                    </div>

                    <!-- Pie del Correo -->
                    <div style="background-color: #141b22; padding: 15px 30px; border-top: 1px solid rgba(255, 255, 255, 0.08); text-align: center; font-size: 12px; color: #6b7280;">
                        <p style="margin: 0;">Este es un mensaje automático enviado por el sistema GEPRES.</p>
                        <p style="margin: 4px 0 0 0;">Por favor, no respondas directamente a esta dirección de correo.</p>
                    </div>

                </div>
            </div>
        `;

        const opcionesCorreo = {
            from: `"GEPRES Notificaciones" <${remitente}>`,
            to: emailDestino,
            replyTo: remitente,
            subject: '¡Tu cuenta en GEPRES ha sido habilitada!',
            text: contenidoTextoPlano,
            html: contenidoHtml,
            // Cabeceras RFC para servidores de correo: identifican el tráfico transaccional automatizado y previenen rebotes y sanciones
            headers: {
                'X-Priority': '3',
                'X-Mailer': 'GEPRES School Management System',
                'Auto-Submitted': 'auto-generated',
                'X-Auto-Response-Suppress': 'All'
            }
        };

        const info = await transporter.sendMail(opcionesCorreo);
        console.log(`[EMAIL SERVICE] Correo de aprobación enviado con éxito a ${emailDestino}. MessageID: ${info.messageId}`);
        
        return { 
            success: true, 
            mensaje: 'Notificación enviada al correo del usuario.' 
        };

    } catch (error) {
        // Capturamos el error sin propagar una excepción para no cortar la transacción en la Base de Datos
        console.warn(`[EMAIL SERVICE - ADVERTENCIA] No se pudo enviar el correo a ${emailDestino}:`, error.message);
        return { 
            success: false, 
            mensaje: 'La cuenta fue aprobada en el sistema, pero el envío del correo de notificación falló (revisar credenciales o límites SMTP).',
            error: error.message 
        };
    }
};

module.exports = {
    enviarCorreoAprobacion
};