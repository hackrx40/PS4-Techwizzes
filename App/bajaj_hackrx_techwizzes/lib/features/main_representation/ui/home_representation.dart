import 'package:bajaj_hackrx_techwizzes/features/home/widegts/search_textfield.dart';
import 'package:bajaj_hackrx_techwizzes/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../../watchlist/widgets/text_logo.dart';
import '../widgets/top_performer.dart';

class HomeRepresentation extends StatefulWidget {
  const HomeRepresentation({super.key});

  @override
  State<HomeRepresentation> createState() => _HomeRepresentationState();
}

class _HomeRepresentationState extends State<HomeRepresentation> {
  String currentDateYear = DateFormat('MMM d, yyyy').format(DateTime.now());
  String currentTime = DateFormat('h:mm a').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          //  backgroundColor: Colors.red,
          leading: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.w),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              'assets/images/user.png',
              fit: BoxFit.contain,
            ),
          ),
          centerTitle: true,
          title: Column(
            children: [
              Text(
                currentDateYear,
                style: TextStyle(color: AppColors.textColor2, fontSize: 13.sp),
              ),
              Text(
                currentTime,
                style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
            ],
          ),
          actions: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.w),
              height: 40.w,
              width: 35.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.blueColor,
              ),
              child: Icon(
                TernavIcons.light.folder,
                color: AppColors.backgroundColor,
              ),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            searchTextField(
                hintText: 'Search stocks, funds, commodities,etc.',
                prefixIcon: Icon(
                  TernavIcons.lightOutline.search,
                  color: Colors.grey.shade400,
                )),
            const SizedBox(height: 15),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Today\'s Performers',
                  style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                )),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.grey.shade200, //color of border
                    width: 3, //width of border
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TopPerformers(),
                            TopPerformers(),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [TopPerformers(), TopPerformers()],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: LogoTexts(
                      size: 20,
                      color: Colors.black,
                      texts: 'Most Activities',
                      isBold: true)),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 80,
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
                              const SizedBox(
                                width: 45,
                              ),
                              Flexible(
                                flex: 2,
                                child: SizedBox(
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
                                          style: TextStyle(color: Colors.white),
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
    );
  }
}
