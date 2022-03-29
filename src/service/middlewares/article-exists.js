'use strict';

const {HttpCode} = require(`../../constants`);

const articleExists = (articleService) => async (req, res, next) => {
  const {articleId} = req.params;
  const article = await articleService.find(articleId);

  if (!article) {
    return res.status(HttpCode.NOT_FOUND).send(`Not found article with id "${articleId}"`);
  }

  res.locals.article = article;
  return next();
};

module.exports = articleExists;
