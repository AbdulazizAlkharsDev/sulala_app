import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/pages/main_widgets/navigation_bar.dart';
import 'package:sulala_app/src/screens/home_page_guest/search_page.dart';
import 'package:sulala_app/src/screens/home_page_guest/search_page_animals.dart';
import 'package:sulala_app/src/screens/home_page_guest/search_page_house_farm.dart';
import 'package:sulala_app/src/screens/home_page_guest/join_now.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sulala App',
      home: Builder(
        builder: (context) {
          AppFonts.setWidthFactor(context);
          return const MyAppHomePage();
        },
      ),
      routes: {
        '/search': (context) => const SearchPage(),
        '/search_house_farm': (context) => const SearchPageHouseFarm(),
        '/search_animals': (context) => const SearchPageAnimals(),
        '/join_now': (context) => const JoinNow(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
