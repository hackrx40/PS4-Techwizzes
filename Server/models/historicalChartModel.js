const mongoose = require('mongoose');

const hisChartSchema = new mongoose.Schema({
    symbol: {
        type: String,
        required: true,
    },
    w1chart: {
        type: String,
        required: true,
    },
    m1chart: {
        type: String,
        required: true,
    },
    m3chart: {
        type: String,
        required: true,
    }
});

module.exports = mongoose.model('hisChart', hisChartSchema);