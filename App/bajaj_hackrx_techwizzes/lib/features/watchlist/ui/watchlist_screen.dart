import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../widgets/text_logo.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Most Activities',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.grey.shade100, //color of border
                              width: 3, //width of border
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey[300],
                                  ),
                                  child: Image.asset(
                                    'assets/icons/apple.png',
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    LogoTexts(
                                      size: 17,
                                      color: Colors.black,
                                      texts: 'Apple Inc.',
                                      isBold: true,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    LogoTexts(
                                        size: 13,
                                        color: Colors.grey,
                                        texts: 'AAPL',
                                        isBold: false)
                                  ],
                                ),
                                SizedBox(
                                  width: 45,
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    height: 50,
                                    width: 60,
                                    child: LineChart(
                                      LineChartData(
                                          minX: 0,
                                          minY: 0,
                                          maxX: 10,
                                          maxY: 10,
                                          titlesData: const FlTitlesData(
                                            show: true,
                                            rightTitles: AxisTitles(
                                              sideTitles:
                                                  SideTitles(showTitles: false),
                                            ),
                                            topTitles: AxisTitles(
                                              sideTitles:
                                                  SideTitles(showTitles: false),
                                            ),
                                            bottomTitles: AxisTitles(
                                              sideTitles: SideTitles(
                                                showTitles: false,
                                              ),
                                            ),
                                            leftTitles: AxisTitles(
                                              sideTitles: SideTitles(
                                                showTitles: false,
                                              ),
                                            ),
                                          ),
                                          borderData: FlBorderData(
                                            show: false,
                                          ),
                                          gridData: FlGridData(
                                            getDrawingHorizontalLine: (value) =>
                                                const FlLine(
                                              strokeWidth: 0,
                                            ),
                                            getDrawingVerticalLine: (value) =>
                                                const FlLine(strokeWidth: 0),
                                          ),
                                          lineBarsData: [
                                            LineChartBarData(
                                              spots: const [
                                                FlSpot(0, 1),
                                                FlSpot(0.5, 0.5),
                                                FlSpot(1, 2),
                                                FlSpot(1.5, 2.5),
                                                FlSpot(2, 4),
                                                FlSpot(2.2, 4.8),
                                                FlSpot(2.5, 4.5),
                                                FlSpot(3, 1),
                                                FlSpot(4, 3),
                                                FlSpot(5, 8),
                                                FlSpot(6, 3),
                                                FlSpot(7, 5),
                                                FlSpot(8, 1),
                                                FlSpot(9, 3),
                                                FlSpot(10, 6)
                                              ],
                                              isCurved: true,
                                              dotData:
                                                  const FlDotData(show: false),
                                              barWidth: 3,
                                              belowBarData: BarAreaData(
                                                show: false,
                                              ),
                                              gradient:
                                                  const LinearGradient(colors: [
                                                Color(0XFFA4BEF4),
                                                Color(0XFF3BA8B3),
                                              ]),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0XFF2ECB7F),
                                      ),
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '+2.65',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ),
                                    const Text(
                                      '176.23',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
