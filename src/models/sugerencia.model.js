module.exports = (sequelize, DataTypes) => {
  const Sugerencia = sequelize.define("sugerencia", {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    titulo: { type: DataTypes.STRING },
    descripcion: { type: DataTypes.TEXT },
    respuesta_admin: { type: DataTypes.TEXT },
    fecha_respuesta: { type: DataTypes.DATE },
    estado: { type: DataTypes.STRING },
    usuario_id: { type: DataTypes.INTEGER },
    admin_id: { type: DataTypes.INTEGER }
  }, {
    tableName: 'sugerencias',
    timestamps: true,
    underscored: true,
    updatedAt: false,
    createdAt: 'created_at' 
  });

  return Sugerencia;
};