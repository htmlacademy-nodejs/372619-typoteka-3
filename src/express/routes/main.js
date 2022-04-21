'use strict';

const {Router} = require(`express`);
const api = require(`../api`).getAPI();

const ARTICLES_PER_PAGE = 8;

const mainRouter = new Router();

const IMAGE_FORMATS = [`.jpg`, `.jpeg`, `.png`, `.webp`];
const getArticlesWithCorrectImageFormat = (articles, postfix = `@1x`, ext = `jpg`) => {
  return articles.map((article) => {
    const hasFormat = IMAGE_FORMATS.some((format) => article.picture && article.picture.includes(format));
    if (!hasFormat) {
      article.picture = `${article.picture}${postfix}.${ext}`;
    }

    return article;
  });
};

mainRouter.get(`/`, async (req, res) => {
  let {page = 1} = req.query;
  page = Number(page);

  const [{count, articles}, categories] = await Promise.all([
    api.getArticles({
      withComments: true,
      offset: (page - 1) * ARTICLES_PER_PAGE,
      limit: ARTICLES_PER_PAGE
    }),
    api.getCategories({withCount: true})
  ]);
  const mappedArticles = getArticlesWithCorrectImageFormat(articles);
  const totalPages = Math.ceil(count / ARTICLES_PER_PAGE);
  res.render(`main/index`, {articles: mappedArticles, page, totalPages, categories});
});

mainRouter.get(`/login`, (req, res) => res.render(`main/login`));
mainRouter.get(`/register`, (req, res) => res.render(`main/sign-up`));

mainRouter.get(`/search`, async (req, res) => {
  const {query} = req.query;
  try {
    const results = await api.search(query);
    const resultsWithHighlightTitle = results.map((article) => {
      const index = article.title.toLowerCase().indexOf(query.toLowerCase());
      return {
        ...article,
        title: [
          {text: article.title.slice(0, index), type: `simple`},
          {text: article.title.slice(index, index + query.length), type: `bold`},
          {text: article.title.slice(index + query.length), type: `simple`},
        ]
      };
    });
    res.render(`main/search`, {results: resultsWithHighlightTitle, query});
  } catch (err) {
    res.render(`main/search`, {results: [], query});
  }
});

mainRouter.get(`/categories`, async (req, res) => {
  const categories = await api.getCategories();
  res.render(`main/all-categories`, {categories});
});

module.exports = mainRouter;
