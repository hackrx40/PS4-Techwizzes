const mongoose = require('mongoose');

const clientSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true,
    },
    clientCode: {
        type: String,
        required: true,
    },
    pin: {
        type: String,
        required: true,
    },
    watchlist: [{
        type: String,
    }]
});

module.exports = mongoose.model("client", clientSchema);