const multer = require('multer');
const path = require('path');
const fs = require('fs');

/**
 * Propósito: Configurar el motor de almacenamiento (diskStorage) y las validaciones para la subida de imágenes (avatars).
 * Quién la llama: Es invocado como middleware en src/routes/usuario.routes.js para procesar archivos antes de llegar al controlador.
 * Retorna: Una instancia de Multer configurada para gestionar la carga de un archivo único en el servidor.
 */

// Definición de la ruta física absoluta para guardar los archivos
const uploadDir = path.join(__dirname, '../../public/uploads/avatars');

// Verificación y creación de directorios para evitar errores de ejecución si las carpetas no existen
if (!fs.existsSync(uploadDir)) {
    fs.mkdirSync(uploadDir, { recursive: true });
}

// Configuración del almacenamiento físico
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        // Indica a Multer la carpeta de destino final
        cb(null, uploadDir);
    },
    filename: (req, file, cb) => {
        // Genera un nombre de archivo único para evitar que un usuario pise la foto de otro
        // Formato: avatar-ID-TIMESTAMP.EXT
        const userId = req.params.id || 'new';
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
        const ext = path.extname(file.originalname);
        cb(null, `avatar-${userId}-${uniqueSuffix}${ext}`);
    }
});

// Configuración del middleware de Multer
const upload = multer({ 
    storage: storage,
    limits: {
        fileSize: 2 * 1024 * 1024 // Límite estricto de 2MB por archivo para proteger el disco
    },
    fileFilter: (req, file, cb) => {
        // Validación de tipo MIME para asegurar que el archivo sea efectivamente una imagen
        if (file.mimetype.startsWith('image/')) {
            cb(null, true);
        } else {
            cb(new Error('Solo se permiten archivos de imagen (.jpg, .png, etc.)'), false);
        }
    }
});

module.exports = upload;