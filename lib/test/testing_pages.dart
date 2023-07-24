// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/inputs/paragraph_text_fields/disabled_paragraph_text_field.dart';
import 'package:sulala_app/src/widgets/inputs/paragraph_text_fields/paragraph_text_field.dart'; // Replace with the actual path to your PasswordField widget

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

String _enteredText = '';
bool _hasError = false;

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const SizedBox(
              width: 350,
              child: DisabledParagraphTextField(
                labelText: 'Enter your paragraph text',
                hintText: 'Start typing your text here...',
                maxLines: 5, // Adjust the number of lines you want to display
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.done),
      ),
    );
  }
}
