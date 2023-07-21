const express = require('express');
const { login, signup } = require('../controllers/authN');
const { pushStocks } = require('../controllers/addStocks');
const { readDataFile } = require('../data/realtime');
// const { feedData } = require('../data/feedhistoricaldata');
const router = express.Router();

router.post('/login', login);
router.post('/signup', signup);
router.post('/addstocks', pushStocks);
router.get('/getrealtime', readDataFile);
// router.post('/feeddata', feedData);

module.exports = router;