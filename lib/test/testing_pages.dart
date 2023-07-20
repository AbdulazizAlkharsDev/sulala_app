// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/inputs/text_fields/label_text_field.dart';
import 'package:sulala_app/src/widgets/inputs/text_fields/primary_text_field.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final TextEditingController _textEditingController = TextEditingController();
  String _enteredText = '';
  bool _hasError = false;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

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
            SizedBox(
              width: 300,
              child: PrimaryTextField(
                hintText: 'Enter your username',
                errorMessage:
                    _hasError ? 'Username should not contain numbers' : null,
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
            const SizedBox(height: 100),
            // SizedBox(
            //   width: 300,
            //   child: LabelTextField(
            //     hintText: 'Enter your username',
            //     labelText: 'Text label',
            //     errorMessage:
            //         _hasError ? 'Username should not contain numbers' : null,
            //     onChanged: (value) {
            //       setState(() {
            //         _enteredText = value;
            //         _hasError =
            //             value.contains(RegExp(r'[0-9]')); // Set the error state
            //       });
            //     },
            //     onErrorChanged: (hasError) {
            //       setState(() {
            //         _hasError = hasError; // Update the error state
            //       });
            //     },
            //   ),
            // ),
            const SizedBox(height: 100),
            Text(
              'Entered Text: $_enteredText',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
