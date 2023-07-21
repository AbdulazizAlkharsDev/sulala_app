// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:sulala_app/src/widgets/inputs/dates_fields/disabled_date_field.dart';
import 'package:sulala_app/src/widgets/inputs/dates_fields/disabled_label_date_field.dart';


class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final TextEditingController _textEditingController = TextEditingController();

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
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: DisabledDateField(
                hintText: 'Select a date',
              ),
            ),
            SizedBox(height: 100),
            SizedBox(
              width: 300,
              child: DisabledLabelDateField(
                labelText: 'Date of Birth',
                hintText: 'Select a date',
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
