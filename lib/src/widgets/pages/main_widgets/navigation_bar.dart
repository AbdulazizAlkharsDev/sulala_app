import 'package:flutter/material.dart';
import '../../../../test/testing_pages.dart';
import '../../../screens/homescreen.dart';
import '../../../theme/colors/colors.dart';
import '../../../theme/fonts/fonts.dart';

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
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.074,
        child: BottomNavigationBar(
          iconSize: MediaQuery.of(context).size.width * 0.064,
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
                scale: 24 / (MediaQuery.of(context).size.width * 0.064),
              ),
              activeIcon: Image.asset(
                "assets/icons/frame/24px/Filled_Cow_Icon.png",
                scale: 24 / (MediaQuery.of(context).size.width * 0.064),
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
          unselectedLabelStyle: AppFonts.caption3(color: AppColors.grayscale50),
        ),
      ),
    );
  }
}
