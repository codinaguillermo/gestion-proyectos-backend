const { DataTypes } = require('sys'); // se mantiene tu estructura de definición

module.exports = (sequelize, DataTypes) => {
  const Configuracion = sequelize.define('configuracion', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: false,
      allowNull: false,
      comment: 'Identificador estático manual (1 = anio_lectivo)'
    },
    nombre: {
      type: DataTypes.STRING(100),
      allowNull: false,
      unique: true,
      comment: 'Nombre identificador de la configuración del sistema'
    },
    valor: {
      type: DataTypes.STRING(255),
      allowNull: false,
      comment: 'Valor asignado a la configuración (almacenado como texto genérico para permitir versatilidad)'
    }
  }, {
    tableName: 'configuraciones',
    timestamps: true,
    paranoid: false,
    underscored: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at'
  });

  return Configuracion;
};