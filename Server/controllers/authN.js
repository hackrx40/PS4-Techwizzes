const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const User = require('../models/clientSchema');
require('dotenv').config();

const secret_key = process.env.SECRET;
//signup
exports.signup = async (req, res) => {
    try {
        const { name, clientCode, pin } = req.body;
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
        const newuser = await User.create({
            name: name,
            clientCode: clientCode,
            pin: hashedpin,
            watchlist: [],
        });
        return res.status(200).json({
            success: true,
            message: "New user created successfully !!",
        });
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: "Something went wrong !!",
        })
    }
};

//login
exports.login = async (req, res) => {
    try {
        const { clientCode, pin } = req.body;
        if (!clientCode || !pin) {
            return res.status(400).json({
                success: false,
                message: "Please fill all the fields !!",
            });
        }
        const user = await User.findOne({ clientCode: clientCode });
        if (!user) {
            return res.status(401).json({
                success: false,
                message: "User not found!!",
            });
        }
        //verify password and return jwt token
        const payload = {
            clientCode: user.clientCode,
            id: user._id,
        };
        if (await bcrypt.compare(pin, user.pin)) {
            let token = jwt.sign(payload, secret_key);
            return res.status(200).json({
                success: true,
                token: token,
                message: 'Logged in successfully!!',
            })
        }
        else {
            return res.status(403).json({
                success: false,
                message: "Password incorrect!!",
            })
        }
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: "Something went wrong while logging in!!",
        })
    }
}