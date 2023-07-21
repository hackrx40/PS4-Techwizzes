const mongoose = require('mongoose');


const tickerSchema = new mongoose.Schema({
  ltp: { type: Number, required: true }, // Represents the last traded price
  pClose: { type: Number, required: true }, // Represents the previous close price
  lastUpdated: { type: Date, required: true }, // Represents the timestamp when the data was last updated
  symbol: { type: String, required: true }, // Represents the ticker symbol
});


const Ticker = mongoose.model('Ticker', tickerSchema);

module.exports = Ticker;
