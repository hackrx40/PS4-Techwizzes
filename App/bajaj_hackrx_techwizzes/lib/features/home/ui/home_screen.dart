import 'package:bajaj_hackrx_techwizzes/features/main_representation/ui/home_representation.dart';
import 'package:bajaj_hackrx_techwizzes/features/watchlist/ui/watchlist_screen.dart';
import 'package:bajaj_hackrx_techwizzes/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../../all_stocks/ui/all_stocks.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final List<Widget> _screens = const [
    HomeRepresentation(),
    AllStocks(),
    WatchlistScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomBar(),
      body: IndexedStack(
        index: currentIndex,
        children: _screens,
      ),
    );
  }

  Widget _buildBottomBar() {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          // backgroundColor: Colors.blue,

          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 24,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: Colors.black),
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: currentIndex == 0
                  ? Icon(
                      TernavIcons.bold.home_2,
                      color: AppColors.blueColor,
                    )
                  : Icon(TernavIcons.bold.home_2),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: currentIndex == 1
                  ? Icon(
                      TernavIcons.bold.dollar,
                      color: AppColors.blueColor,
                    )
                  : Icon(TernavIcons.bold.dollar),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: currentIndex == 2
                  ? Icon(
                      TernavIcons.bold.bookmark,
                      color: AppColors.blueColor,
                    )
                  : Icon(TernavIcons.bold.bookmark),
              label: '',
            ),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
