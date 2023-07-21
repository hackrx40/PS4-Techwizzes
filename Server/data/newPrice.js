const fs = require('fs');

function isWithinTradingHours() {
  const now = new Date();
  const tradingStartTime = new Date(now);
  tradingStartTime.setHours(9, 15, 0, 0);
  const tradingEndTime = new Date(now);
  tradingEndTime.setHours(23, 55, 0, 0);
  return now >= tradingStartTime && now <= tradingEndTime;
}

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
  })
}

function runStocksUpdate() {
  fs.readFile('livePrice.json', 'utf8', (err, data) => {
    if (err) {
      console.error('Error reading stock data from the JSON file:', err);
    } else {
      try {
        const jsonData = JSON.parse(data);
        if (!jsonData || !jsonData.stocks || !Array.isArray(jsonData.stocks)) {
          console.error('Invalid JSON format or missing "stocks" array.');
        } else {
          if (isWithinTradingHours()) {
            updateStocksData(jsonData);
          } else {
            console.log("Market is closed");
          }
        }
      } catch (error) {
        console.error('Error parsing JSON data:', error);
      }
    }
  });
}

if (isWithinTradingHours()) {
  setInterval(runStocksUpdate, 1000);
} else {
  console.log("Market is closed");
}

console.log('Stock update process initiated.');