// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/inputs/text_fields/disabled_label_text_field.dart';
import 'package:sulala_app/src/widgets/inputs/text_fields/disabled_primary_text_field.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final TextEditingController _textEditingController = TextEditingController();
  final String _enteredText = '';

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
            const SizedBox(
                width: 300,
                child: DisabledPrimaryTextField(
                  hintText: 'Enter your text',
                )),
            const SizedBox(height: 100),
            const SizedBox(
              width: 300,
              child: DisabledLabelTextField(
                labelText: 'Text label',
                hintText: 'Enter your text',
              ),
            ),
            const SizedBox(height: 100),
            Text(
              'Entered Text: $_enteredText',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
