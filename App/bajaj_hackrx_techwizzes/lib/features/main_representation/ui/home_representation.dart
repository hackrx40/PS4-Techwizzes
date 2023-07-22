import 'dart:async';
import 'dart:convert';

import 'package:bajaj_hackrx_techwizzes/data/temp_data.dart';
import 'package:bajaj_hackrx_techwizzes/features/detail_view/ui/detail_screen.dart';
import 'package:bajaj_hackrx_techwizzes/features/home/widegts/search_textfield.dart';
import 'package:bajaj_hackrx_techwizzes/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ternav_icons/ternav_icons.dart';
import 'package:http/http.dart' as http;

import '../../../models/stock_model/stock_model.dart';
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

  Timer? _timer;

  List? stockMarket = [];
  var stockMarketList;
  @override
  void initState() {
    getStockMarket();
    super.initState();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      setState(() {});
      getStockMarket();
    });
  }

  Future<List<StockModel>?> getStockMarket() async {
    const url =
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd";
    var response = await http.get(Uri.parse(url), headers: {
      "Content-type": "application/json",
      "Accept": "application/json"
    });

    if (response.statusCode == 200) {
      print(response.body);
      var x = jsonDecode(response.body);
      stockMarketList = x.map((e) => StockModel.fromJson(e)).toList();
      setState(() {
        stockMarket = stockMarketList;
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.w),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              'assets/images/user.png',
              fit: BoxFit.contain,
            ),
          ),
          centerTitle: true,
          title: Text(
            currentDateYear,
            style: TextStyle(color: AppColors.textColor, fontSize: 16.sp),
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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
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
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: GridView.builder(
                            itemCount: TopData().topData.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return TopPerformers(
                                data: TopData().topData[index],
                              );
                            })),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Most Actives',
                  style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      StockModel data = stockMarket![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                        stockModel: data,
                                      )));
                        },
                        child: Container(
                          height: 70.h,
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 8.w),
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
                              Container(
                                height: 45.h,
                                width: 45.h,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey.shade200,
                                ),
                                child: Image.network(
                                  data.image,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    LogoTexts(
                                      size: 14.sp,
                                      color: AppColors.textColor,
                                      texts: data.name,
                                      isLetterSpacing: true,
                                      isBold: true,
                                    ),
                                    LogoTexts(
                                      size: 13,
                                      color: Colors.grey,
                                      texts: data.symbol,
                                      isBold: false,
                                    )
                                  ],
                                ),
                              ),
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
                                          // spots: ,
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
                                          gradient:
                                              const LinearGradient(colors: [
                                            Color(0XFFA4BEF4),
                                            Color(0XFF3BA8B3),
                                          ]),
                                        ),
                                      ]),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 25.h,
                                    // width: 50,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 6.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: data.priceChangePercentage24H < 0
                                          ? Colors.red
                                          : const Color(0XFF2ECB7F),
                                    ),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          data.priceChangePercentage24H
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp),
                                        )),
                                  ),
                                  Text(
                                    data.currentPrice.toString(),
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
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
