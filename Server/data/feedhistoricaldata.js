const Hisdata = require('../models/historicalPrice');
const data = require('./pastPrices.json');

exports.feedData = async(req, res) => {
    for(i in data){
        let feed = await Hisdata.create(data[i]);
        console.log(data[i]);
    }
}