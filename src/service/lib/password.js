'use strict';

const {compare, hash, hashSync} = require(`bcrypt`);

const SALT_ROUNDS = 10;

module.exports = {
  compare,
  hash: (password) => hash(password, SALT_ROUNDS),
  hashSync: (password) => hashSync(password, SALT_ROUNDS)
};
