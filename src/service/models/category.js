'use strict';

const {DataTypes, Model} = require(`sequelize`);

class Category extends Model {}

const define = (sequelize) => Category.init({
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  }
}, {
  sequelize,
  tableName: `categories`
});

module.exports = define;

