import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/inputs/paragraph_text_fields/paragraph_text_field.dart';
import 'package:sulala_app/test/file_uploader_field.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
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
            Focus(
              onFocusChange: (hasFocus) {}, // Dummy onFocusChange callback
              child: const SizedBox(
                height: 300,
                width: 300,
                child: FileUploaderField(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
