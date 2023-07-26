// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/inputs/file_uploader_fields/file_uploader_field.dart';
import 'package:sulala_app/test/draft.dart';

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
              width: 300,
              height: 50,
              child: DividedElevatedButton(
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
            const SizedBox(height: 16.0),
            SizedBox(
              height: 400,
              width: 350,
              child: Focus(
                onFocusChange: (hasFocus) {}, // Dummy onFocusChange callback
                child: const SizedBox(
                  // height: 100,
                  width: 350,
                  child: FileUploaderField(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
