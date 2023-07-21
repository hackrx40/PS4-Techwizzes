import 'dart:ui';

import 'package:bajaj_hackrx_techwizzes/features/main_representation/ui/home_representation.dart';
import 'package:bajaj_hackrx_techwizzes/features/watchlist/ui/watchlist_screen.dart';
import 'package:bajaj_hackrx_techwizzes/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = const [
    HomeRepresentation(),
    WatchlistScreen(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _buildBottomBar(),
        body: IndexedStack(
          children: _screens,
        ));
  }

  Widget _buildBottomBar() {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.white.withOpacity(0.0),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            // backgroundColor: Colors.blue,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 24,
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: const IconThemeData(color: Colors.black),
            items: [
              const BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: Icon(Icons.home),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 2
                    ? const Icon(Icons.add)
                    : const Icon(Icons.network_ping_sharp),
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
      ),
    );
  }
}
