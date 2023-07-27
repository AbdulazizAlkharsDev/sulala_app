// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:sulala_app/test/phone_number_field.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

// ignore: unused_element
String _enteredText = '';

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Example Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              // height: 200,
              child: PhoneNumberField(
                leftText: 'Left',
                rightText: 'Right',
                onLeftPressed: () {
                  print("left");
                },
                onRightPressed: () {
                  print("right");
                },
              ),
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
