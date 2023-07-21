const User = require('../models/clientSchema');
const jwt = require('jsonwebtoken');
require('dotenv').config();

const secret_key = process.env.SECRET;

exports.pushStocks = async(req, res) => {
    const {token, stocks} = req.body;
    if(!token){
        return res.status(401).json({
            success: false,
            message: "Token missing!!",
        });
    }
    const decode = jwt.verify(token, secret_key);
    const filter = {clientCode: decode.clientCode};
    const update = {watchlist : stocks};
    const updatedClient = await User.findOneAndUpdate(filter, update, {new:true});
    return res.status(200).json({
        success: true,
        message: "Stocks added to watchlist successfully!!",
        client: updatedClient,
    })
}