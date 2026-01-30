module.exports = (sequelize, DataTypes) => {
  const EstadoTarea = sequelize.define('EstadoTarea', {
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
    tableName: 'estados_tarea',
    timestamps: false
  });
  return EstadoTarea;
};