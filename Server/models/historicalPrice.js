const mongoose = require('mongoose');

const marketDataSchema = new mongoose.Schema({
  token: { type: String, required: true }, // Represents the token
  exchid: { type: Number, required: true }, // Represents the exchange ID
  open: { type: Number, required: true }, // Represents the opening price
  high: { type: Number, required: true }, // Represents the highest price during the trading session
  low: { type: Number, required: true }, // Represents the lowest price during the trading session
  close: { type: Number, required: true }, // Represents the closing price
  volume: { type: Number, required: true }, // Represents the trading volume
  tradeDate: { type: Date, required: true }, // Represents the date of the trading session
  symbol: { type: String, required: true }, // Represents the ticker symbol
});


const MarketData = mongoose.model('MarketData', marketDataSchema);

module.exports = MarketData;
