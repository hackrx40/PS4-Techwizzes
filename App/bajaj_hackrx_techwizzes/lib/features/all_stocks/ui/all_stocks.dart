import 'dart:convert';

import 'package:bajaj_hackrx_techwizzes/features/all_stocks/widgets/stack_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/stock_model/stock_model.dart';
import '../../../utils/app_colors.dart';

class AllStocks extends StatefulWidget {
  const AllStocks({super.key});

  @override
  State<AllStocks> createState() => _AllStocksState();
}

class _AllStocksState extends State<AllStocks> {
  List? stockMarket = [];
  var stockMarketList;
  @override
  void initState() {
    getStockMarket();
    super.initState();
  }

  void startTimer() {}

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              'assets/icons/market.png',
              scale: 2,
            ),
            const SizedBox(width: 15),
            const Text(
              'All Stocks',
              style: TextStyle(
                  color: AppColors.textColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
            itemCount: stockMarket!.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              StockModel data = stockMarket![index];
              return StocksListTile2(
                data: data,
              );
            }),
      ),
    );
  }
}
