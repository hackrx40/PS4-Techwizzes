import 'package:bajaj_hackrx_techwizzes/features/all_stocks/widgets/stack_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../main_representation/ui/home_representation.dart';

class AllStocks extends StatefulWidget {
  const AllStocks({super.key});

  @override
  State<AllStocks> createState() => _AllStocksState();
}

class _AllStocksState extends State<AllStocks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'All Stocks',
          style: TextStyle(
              color: AppColors.textColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          itemCount: 15,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return const StocksListTile2();
          }),
    );
  }
}
