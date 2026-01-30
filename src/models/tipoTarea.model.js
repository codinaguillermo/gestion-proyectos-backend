module.exports = (sequelize, DataTypes) => {
  const TipoTarea = sequelize.define('TipoTarea', {
    id: {
      type: DataTypes.BIGINT.UNSIGNED,
      primaryKey: true,
      autoIncrement: true
    },
    nombre: {
      type: DataTypes.STRING(50),
      allowNull: false
    }
  }, {
    tableName: 'tipos_tarea',
    timestamps: false
  });
  return TipoTarea;
};