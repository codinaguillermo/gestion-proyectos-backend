module.exports = (sequelize, DataTypes) => {
  const Prioridad = sequelize.define('Prioridad', {
    id: {
      type: DataTypes.BIGINT.UNSIGNED,
      primaryKey: true,
      autoIncrement: true
    },
    nombre: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    peso: {
      type: DataTypes.INTEGER,
      defaultValue: 0
    }
  }, {
    tableName: 'prioridades',
    timestamps: false // No necesitamos createdAt/updatedAt para diccionarios
  });
  return Prioridad;
};