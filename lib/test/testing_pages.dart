// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../src/widgets/controls_and_buttons/buttons/social_media/apple_button.dart';

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
            AppleButton(
              status: ButtonStatus.idle,
              onPressed: () {
                // print("idle");
              },
            ),
            const SizedBox(height: 16),
            AppleButton(
              status: ButtonStatus.pressed,
              onPressed: () {
                // print("pressed");
              },
            ),
            const SizedBox(height: 16),
            const AppleButton(
              status: ButtonStatus.loading,
            ),
            const SizedBox(height: 16),
            const AppleButton(
              status: ButtonStatus.disabled,
            )
          ],
        ),
      ),
    );
  }
}
