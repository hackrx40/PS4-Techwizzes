
const express = require('express');
const fs = require('fs');

const app = express();
const port = 3000;


app.get('/api/live-prices', (req, res) => {
  fs.readFile('livePrice.json', 'utf8', (err, data) => {
    if (err) {
      console.error('Error reading stock data from the JSON file:', err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    try {
      const jsonData = JSON.parse(data);
      if (!jsonData || !jsonData.stocks || !Array.isArray(jsonData.stocks)) {
        console.error('Invalid JSON format or missing "stocks" array.');
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      return res.json(jsonData.stocks);
    } catch (error) {
      console.error('Error parsing JSON data:', error);
      return res.status(500).json({ error: 'Internal Server Error' });
    }
  });
});


function modifyPrice(ltp) {
  const rupeeOptions = [-1.01,-2.12,-3.64,-4.43,-5.2,1,2.21,3.43,4.25,5];
  const getRandomValue = (options) => options[Math.floor(Math.random() * options.length)];
  const randomRupee = getRandomValue(rupeeOptions);
  const newPrice = ltp + randomRupee;
  return parseFloat(newPrice.toFixed(2));
}


function updateStocksData(jsonData) {
  for (let i = 0; i < jsonData.stocks.length; i++) {
    const stock = jsonData.stocks[i];
    stock.ltp = modifyPrice(stock.ltp);
    stock.lastUpdated = new Date().toISOString();
  }

  const updatedData = JSON.stringify(jsonData, null, 2);

  fs.writeFile('livePrice.json', updatedData, 'utf8', (err) => {
    if (err) {
      console.error('Error updating stock data in the JSON file:', err);
    } else {
      console.log('Updated stock prices:', jsonData.stocks);
    }
  });
}

setInterval(() => {
  fs.readFile('livePrice.json', 'utf8', (err, data) => {
    if (err) {
      console.error('Error reading stock data from the JSON file:', err);
    } else {
      try {
        const jsonData = JSON.parse(data);
        if (!jsonData || !jsonData.stocks || !Array.isArray(jsonData.stocks)) {
          console.error('Invalid JSON format or missing "stocks" array.');
        } else {
          updateStocksData(jsonData);
        }
      } catch (error) {
        console.error('Error parsing JSON data:', error);
      }
    }
  });
}, 1000);
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});


