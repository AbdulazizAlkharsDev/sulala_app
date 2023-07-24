// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/inputs/paragraph_text_fields/paragraph_text_field.dart';
import 'package:sulala_app/src/widgets/inputs/draw_ups/draw_up_widget.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

// ignore: unused_element
String _enteredText = '';
bool _hasError = false;

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
              width: 350,
              child: ParagraphTextField(
                hintText: 'Text label',
                labelText: 'Text',
                maxLines: 5,
                errorMessage:
                    _hasError ? 'Text should not contain numbers' : null,
                onChanged: (value) {
                  setState(() {
                    _enteredText = value;
                    _hasError =
                        value.contains(RegExp(r'[0-9]')); // Set the error state
                  });
                },
                onErrorChanged: (hasError) {
                  setState(() {
                    _hasError = hasError; // Update the error state
                  });
                },
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _showFilterModalSheet(context);
              },
              child: const Text('Open Filter Modal Sheet'),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterModalSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return Container(
          color: Colors.transparent,
          child: const DrowupWidget(
            // heading: 'Filter',
            content: Column(
              children: [
                Text('Hello World'),
                // Add Your Widgets Here
              ],
            ),
          ),
        );
      },
    );
  }
}
