import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/widgets/pages/main_widgets/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sulala App',
      theme: ThemeData(
        primaryColor: AppColors.primary30,
        
      ),
      home: const MyAppHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
