import 'dart:convert';

import 'package:bajaj_hackrx_techwizzes/features/detail_view/widgets/base64conv.dart';
import 'package:bajaj_hackrx_techwizzes/models/stock_model/stock_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class DetailScreen extends StatefulWidget {
  final StockModel stockModel;
  const DetailScreen({super.key, required this.stockModel});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int tappedIndex = -1;
  bool istaped = false;
  List<String> texts = [
    '1D',
    '5D',
    '1M',
    '6M',
    'YTD',
    '1Y',
    '5Y',
    'MAX',
  ];
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('9PM', style: style);
        break;
      case 3:
        text = const Text('10PM', style: style);
        break;
      case 5:
        text = const Text('11PM', style: style);
        break;
      case 7:
        text = const Text('12AM', style: style);
        break;
      case 9:
        text = const Text('1AM', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = "175.90";
        break;
      case 3:
        text = "176.00";
        break;
      case 5:
        text = "176.10";
        break;
      case 7:
        text = "176.20";
        break;
      case 9:
        text = "176.30";
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  String url =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhJUhflI9wpU_FfEramW3wvLayvpPQaIIYiQ&usqp=CAU';
  var base64ConvertedString = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(color: AppColors.textColor),
          centerTitle: true,
          title: Text(
            'Detail Screen',
            style: TextStyle(color: AppColors.textColor, fontSize: 16.sp),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 13, right: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[300],
                      ),
                      child: Image.network(
                        widget.stockModel.image,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.stockModel.name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          widget.stockModel.symbol,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 110,
                    ),
                    Container(
                      height: 43,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0XFF2ECB7F),
                      ),
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'BUY',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 43,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: const Icon(Icons.show_chart),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  height: 350,
                  child: LineChart(
                    LineChartData(
                        minX: 0,
                        minY: 0,
                        maxX: 10,
                        maxY: 10,
                        titlesData: FlTitlesData(
                          show: true,
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30,
                              interval: 1,
                              getTitlesWidget: bottomTitleWidgets,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 1,
                              getTitlesWidget: leftTitleWidgets,
                              reservedSize: 42,
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        gridData: FlGridData(
                          getDrawingHorizontalLine: (value) => const FlLine(
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
                            dotData: FlDotData(show: false),
                            barWidth: 3,
                            belowBarData: BarAreaData(
                              show: true,
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  colors: [
                                    const Color.fromARGB(0, 163, 235, 194)
                                        .withOpacity(0.3),
                                    const Color.fromARGB(0, 86, 194, 239)
                                        .withOpacity(0.3),
                                  ]),
                            ),
                            gradient: const LinearGradient(colors: [
                              Color(0XFFA4BEF4),
                              Color(0XFF3BA8B3),
                            ]),
                          ),
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(13)),
                  child: ListView.builder(
                    itemCount: texts.length,
                    itemBuilder: (context, index) {
                      bool isTapped = (index == tappedIndex);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            tappedIndex = index;
                            istaped = true;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3.0, vertical: 5.0),
                          child: Container(
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: tappedIndex == index
                                  ? Colors.black
                                  : Colors.transparent,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                texts[index],
                                style: TextStyle(
                                    color: tappedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Image Processing",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
                const SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.network(url),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
