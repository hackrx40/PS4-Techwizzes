const fs = require('fs');

exports.readDataFile = async (req, res) => {
  try {
    const jsonData = await fs.readFile('livePrice.json', 'utf8');
    console.log("stored in jsondata");
    console.log(jsonData);
    return res.status(200).json({
      success: true,
      data: jsonData,
    });
  } catch (error) {
    console.error('Error reading data file:', error);
    return res.status(500).json({
      success: false,
      error: error,
    });
  }
};