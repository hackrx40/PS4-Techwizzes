import 'package:bajaj_hackrx_techwizzes/models/top_data/top_data_model.dart';
import 'package:bajaj_hackrx_techwizzes/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ternav_icons/ternav_icons.dart';

class TopPerformers extends StatelessWidget {
  final TopDataModel data;
  const TopPerformers({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
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
                      spots: data.stops,
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
          Row(
            children: [
              Text(
                data.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                data.perChnage,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.lightGreen,
                    fontSize: 13),
              )
            ],
          ),
          Row(
            children: [
              Text(
                data.price,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(
                TernavIcons.light.arrow_up_2,
                color: AppColors.lightGreen,
              )
            ],
          ),
        ],
      ),
    );
  }
}
