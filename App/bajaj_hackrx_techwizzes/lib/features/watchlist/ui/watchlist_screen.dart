import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/stock_model/stock_model.dart';
import '../../../utils/app_colors.dart';
import '../../all_stocks/widgets/stack_list_tile.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
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
              'assets/icons/tag.png',
              scale: 2,
            ),
            const SizedBox(width: 15),
            const Text(
              'Watchlist',
              style: TextStyle(
                  color: AppColors.textColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              StockModel data = stockMarket![index];
              return StocksListTile2(data: data);
            }),
      ),
    );
  }
}
