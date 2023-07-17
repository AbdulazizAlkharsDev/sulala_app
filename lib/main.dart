import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/main_widgets/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sulala App',
      home: MyAppHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
