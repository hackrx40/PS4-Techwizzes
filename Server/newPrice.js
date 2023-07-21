const fs = require('fs');

function modifyPrice(price) {
  const rupeeOptions = [-1.01,-2.12,-3.64,-4.43,-5.2,1,2.21,3.43,4.25,5];
  const getRandomValue = (options) => options[Math.floor(Math.random() * options.length)];
  const randomRupee = getRandomValue(rupeeOptions);
  const newPrice = price + randomRupee;
  return parseFloat(newPrice.toFixed(2));
}

function updateStockPricesContinuously() {
  fs.readFile('livePrice.json', 'utf8', (err, data) => {
    if (err) {
      console.error('Error reading stock data from the JSON file:', err);
      return;
    }

    try {
      const jsonData = JSON.parse(data);
      if (!jsonData || !jsonData.stocks || !Array.isArray(jsonData.stocks)) {
        console.error('Invalid JSON format or missing "stocks" array.');
        return;
      }

      const stocks = jsonData.stocks;

      for (let i = 0; i < stocks.length; i++) {
        const stock = stocks[i];
        stock.price = modifyPrice(stock.price);
        stock.lastUpdated = new Date().toISOString(); // Add current timestamp to 'lastUpdated'
      }

      const updatedData = JSON.stringify(jsonData, null, 2);

      fs.writeFile('livePrice.json', updatedData, 'utf8', (err) => {
        if (err) {
          console.error('Error updating stock data in the JSON file:', err);
          return;
        }
        console.log('Updated stock prices:', jsonData.stocks);
      });
    } catch (error) {
      console.error('Error parsing JSON data:', error);
    }
  });
}

setInterval(updateStockPricesContinuously, 1000);
