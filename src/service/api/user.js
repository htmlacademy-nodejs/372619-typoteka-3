'use strict';

const {Router} = require(`express`);
const {HttpCode} = require(`../../constants`);
const asyncHandler = require(`../../middlewares/async-handler`);
const userValidator = require(`../middlewares/user-validator`);
const passwordUtils = require(`../lib/password`);

const ErrorAuthMessage = {
  EMAIL: `Электронный адрес не существует`,
  PASSWORD: `Неверный пароль`
};

module.exports = (app, userService) => {
  const route = new Router();
  app.use(`/user`, route);

  route.post(`/`, userValidator(userService), asyncHandler(async (req, res) => {
    const userData = req.body;

    userData.passwordHash = await passwordUtils.hash(userData.password);
    const newUser = await userService.create(userData);
    delete newUser.passwordHash;

    res.status(HttpCode.CREATED).json(newUser);
  }));

  route.post(`/auth`, asyncHandler(async (req, res) => {
    const {email, password} = req.body;

    const user = await userService.findByEmail(email);
    if (!user) {
      res.status(HttpCode.UNAUTHORIZED).send(ErrorAuthMessage.EMAIL);
      return;
    }

    const passwordIsCorrect = await passwordUtils.compare(password, user.passwordHash);
    if (passwordIsCorrect) {
      delete user.passwordHash;
      res.status(HttpCode.OK).json(user);
    } else {
      res.status(HttpCode.UNAUTHORIZED).send(ErrorAuthMessage.PASSWORD);
    }
  }));
};
