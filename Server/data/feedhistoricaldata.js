const Hisdata = require('../models/historicalPrice');
const pastdata = require('./pastPrices.json');
const newdata = require('./livePrice.json');


const feedData = async(req, res) => {
    for(i in pastdata){
        let data = await Hisdata.create(pastdata[i]);
        console.log(data);
    }
}
feedData();