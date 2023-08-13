import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/pages/main_widgets/navigation_bar.dart';
import 'package:sulala_app/test/search_page.dart';
import 'package:sulala_app/test/search_page_house_farm.dart';

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
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
