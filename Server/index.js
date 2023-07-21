const express = require('express');
const { dbConnect } = require('./config/database');
const router = require('./routes/users');
const app = express();
require('dotenv').config();
app.use(express.json());

app.use('/api/v1', router)
dbConnect();
app.listen(3000, () => {
    console.log("Server started!!");
})

app.get('/', (req, res) => {
    res.send("This is homepage");
});