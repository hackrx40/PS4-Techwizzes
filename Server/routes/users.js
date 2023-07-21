const express = require('express');
const { login, signup } = require('../controllers/authN');
const { pushStocks } = require('../controllers/addStocks');
const router = express.Router();

router.post('/login', login);
router.post('/signup', signup);
router.post('/addstocks', pushStocks);

module.exports = router;