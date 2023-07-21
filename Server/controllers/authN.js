const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const User = require('../models/clientSchema');

//signup
exports.signup = async (req, res) => {
    try {
        const {name, clientCode, pin} = req.body;
        //checking if existing one
        const existingUser = await User.findOne({ clientCode: clientCode });
        if (existingUser) {
            return res.status(400).json({
                success: false,
                message: 'User already exists !!',
            });
        }
        //hashing the pin
        let hashedpin;
        try {
            hashedpin = await bcrypt.hash(pin, 10);
        } catch (error) {
            return res.status(500).json({
                success: false,
                message: 'Error in hashing the pin !!',
                error: error,
            });
        }
        //creating the new user
        
    } catch (error) {
        
    }
}