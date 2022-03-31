'use strict';

const {Model} = require(`sequelize`);
const defineCategory = require(`./category`);
const defineComment = require(`./comment`);
const defineArticle = require(`./article`);
const Aliase = require(`./aliase`);

const defineModels = (sequelize) => {
  const Category = defineCategory(sequelize);
  const Comment = defineComment(sequelize);
  const Article = defineArticle(sequelize);

  Article.hasMany(Comment, {
    as: Aliase.COMMENTS,
    foreignKey: `articleId`,
    onDelete: `cascade`
  });
  Comment.belongsTo(Article, {
    foreignKey: `articleId`
  });

  class ArticleCategory extends Model {}
  ArticleCategory.init({}, {sequelize});
  Article.belongsToMany(Category, {
    through: ArticleCategory,
    as: Aliase.CATEGORIES,
  });
  Category.belongsToMany(Article, {
    through: ArticleCategory,
    as: Aliase.ARTICLES,
  });
  Category.hasMany(ArticleCategory, {as: Aliase.ARTICLES_CATEGORIES});

  return {Category, Comment, Article, ArticleCategory};
};

module.exports = defineModels;
