const HisPrice = require('../data/pastPrices.json');
const ChartJsImage = require('chartjs-to-image');

exports.setChartLink = async (req, res) => {
    try {
        const { symbol } = req.body;
        let index = 0;
        let links = [];
        for (i = 0; i < 50; i++) {
            if (HisPrice[i].symbol == symbol) {
                index = i;
                break;
            }
        }
        let label = [];
        let data = [];
        let k = 0;
        for (i = index; i < HisPrice.length; i += 50) {
            label.push(k.toString());
            k++;
            data.push(parseFloat(HisPrice[i].close));
        }
        async function generateChart1w() {
            const myChart = new ChartJsImage();
            myChart.setConfig({
                type: 'line',
                data: { labels: label.slice(0, 7), datasets: [{ data: data.slice(0, 7), fill: false }] },
            });
            w1Url = await myChart.toDataUrl();
            links.push(String(w1Url));
        }
        generateChart1w();
        async function generateChart1m() {
            const myChart = new ChartJsImage();
            myChart.setConfig({
                type: 'line',
                data: { labels: label.slice(0, 20), datasets: [{ data: data.slice(0, 20), fill: false }] },
            });
            m1Url = await myChart.toDataUrl();
            links.push(String(m1Url));
        }
        generateChart1m();
        async function generateChart3m() {
            const myChart = new ChartJsImage();
            myChart.setConfig({
                type: 'line',
                data: { labels: label.slice(0, 60), datasets: [{ data: data.slice(0, 60), fill: false }] },
            });
            m3Url = await myChart.toDataUrl();
            console.log(m3Url);
            links.push(String(m3Url));
        }
        generateChart3m();
        res.status(200).json({
            success: true,
            links: links,
        })
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Something went wrong!!",
        })
    }
}