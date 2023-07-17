// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../../test/testing_pages.dart';
import '../../screens/homescreen.dart';
import '../../theme/colors/colors.dart';
import '../../theme/fonts/fonts.dart';

class MyAppHomePage extends StatefulWidget {
  const MyAppHomePage({Key? key}) : super(key: key);

  @override
  _MyAppHomePageState createState() => _MyAppHomePageState();
}

class _MyAppHomePageState extends State<MyAppHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const FarmsListView(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Icon(Icons.home_outlined),
            ),
            activeIcon: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Column(
                children: [
                  Image.asset("assets/icons/frame/24px/Outlined_Cow_Icon.png"),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Column(
                children: [
                  Image.asset("assets/icons/frame/24px/Filled_Cow_Icon.png"),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            label: 'Farms',
          ),
          const BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Icon(Icons.account_circle_outlined),
            ),
            activeIcon: Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Icon(Icons.account_circle),
            ),
            label: 'Profile',
          )
        ],
        selectedItemColor: AppColors.primary20,
        unselectedItemColor: AppColors.grayscale50,
        selectedLabelStyle: AppFonts.caption3(color: AppColors.primary20),
        unselectedLabelStyle: AppFonts.caption3(color: AppColors.grayscale50),
      ),
    );
  }
}
