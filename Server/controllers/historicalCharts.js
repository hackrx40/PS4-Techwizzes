const HisPrice = require('../models/historicalPrice');
const HisChart = require('../models/historicalChartModel');
const ChartJsImage = require('chartjs-to-image');

stocks_array = [
    "BHARTIARTL", "POWERGRID", "ICICIBANK", "ASIANPAINT", "BRITANNIA", "INFY", "NTPC",
    "CIPLA", "ONGC", "HDFCBANK", "SUNPHARMA", "EICHERMOT", "TECHM", "M&M", "AXISBANK",
    "RELIANCE", "WIPRO", "HINDALCO", "HINDUNILVR", "SBILIFE", "ULTRACEMCO", "APOLLOHOSP",
    "HDFC", "BAJAJFINSV", "COALINDIA", "DRREDDY", "ITC", "HEROMOTOCO", "DIVISLAB", "GRASIM",
    "HCLTECH", "TCS", "UPL", "KOTAKBANK", "TATACONSUM", "INDUSINDBK", "JSWSTEEL", "LT", "SBIN",
    "TATAMOTORS", "HDFCLIFE", "MARUTI", "BPCL", "TITAN", "BAJFINANCE", "ADANIPORTS", "NESTLEIND",
    "TATASTEEL", "ADANIENT", "BAJAJ-AUTO"
]


const gethistory = async(req,res) => {
    let hisprices = await HisPrice.find({});
    console.log(hisprices);
}
gethistory();