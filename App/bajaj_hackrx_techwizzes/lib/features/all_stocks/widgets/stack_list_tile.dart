import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../../../utils/app_colors.dart';
import '../../watchlist/widgets/text_logo.dart';

class StocksListTile2 extends StatelessWidget {
  const StocksListTile2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      margin: const EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.shade100, //color of border
          width: 3, //width of border
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LogoTexts(
                size: 14.sp,
                color: AppColors.textColor,
                texts: 'Apple Inc.',
                isLetterSpacing: true,
                isBold: true,
              ),
              const LogoTexts(
                size: 13,
                color: Colors.grey,
                texts: 'AAPL',
                isBold: false,
              )
            ],
          ),
          const Spacer(),
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
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
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
                        dotData: const FlDotData(show: false),
                        barWidth: 3,
                        belowBarData: BarAreaData(
                          show: false,
                        ),
                        gradient: const LinearGradient(colors: [
                          Color(0XFFA4BEF4),
                          Color(0XFF3BA8B3),
                        ]),
                      ),
                    ]),
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 25.h,
                // width: 50,
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0XFF2ECB7F),
                ),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '+2.65',
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    )),
              ),
              Text(
                '176.23',
                style: TextStyle(
                    fontSize: 15.sp,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          IconButton(
              onPressed: () {},
              splashRadius: 20,
              icon: Icon(
                TernavIcons.light.bookmark,
                color: AppColors.textColor2,
              ))
        ],
      ),
    );
  }
}
