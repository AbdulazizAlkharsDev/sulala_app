// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/radio/radio_active.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/radio/radio_disabled.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  int selectedValue = 1; // Provide a default non-null value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RadioActive(
              isActive: true,
              onChanged: (isActive) {
                if (isActive) {
                } else {}
              },
            ),
            const SizedBox(height: 16),
            const RadioDisabled(isActive: false)
          ],
        ),
      ),
    );
  }
}
