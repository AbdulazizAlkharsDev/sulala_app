import 'package:flutter/material.dart';
import '../../../screens/guest_mode/homescreen_guest_mode.dart';
import '../../../screens/profile/profile_page.dart';
import '../../../../test/testing_pages.dart';
import '../../../theme/colors/colors.dart';
import '../../../theme/fonts/fonts.dart';
import 'package:sulala_app/src/data/globals.dart' as globals;

class MyAppHomePage extends StatefulWidget {
  const MyAppHomePage({Key? key}) : super(key: key);

  @override
  State<MyAppHomePage> createState() => _MyAppHomePageState();
}

class _MyAppHomePageState extends State<MyAppHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const ExamplePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
        bottomNavigationBar: SizedBox(
          height: globals.heightMediaQuery * 60,
          child: BottomNavigationBar(
            iconSize: globals.widthMediaQuery * 24,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/frame/24px/Outlined_Cow_Icon.png",
                  scale: 24 / (globals.widthMediaQuery * 24),
                ),
                activeIcon: Image.asset(
                  "assets/icons/frame/24px/Filled_Cow_Icon.png",
                  scale: 24 / (globals.widthMediaQuery * 24),
                ),
                label: 'Animals',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                activeIcon: Icon(Icons.account_circle),
                label: 'Profile',
              )
            ],
            selectedItemColor: AppColors.primary20,
            unselectedItemColor: AppColors.grayscale50,
            selectedLabelStyle: AppFonts.caption3(color: AppColors.primary20),
            unselectedLabelStyle:
                AppFonts.caption3(color: AppColors.grayscale50),
          ),
        ),
      ),
    );
  }
}
