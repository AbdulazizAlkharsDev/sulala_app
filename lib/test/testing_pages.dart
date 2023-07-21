// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/inputs/dates_fields/label_date_field.dart';
import 'package:sulala_app/src/widgets/inputs/dates_fields/primary_date_field.dart';

// ... (Other imports)

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final TextEditingController _textEditingController = TextEditingController();
  DateTime? _selectedDate;
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
            // SizedBox(
            //   width: 300,
            //   child: LabelDateField(
            //     hintText: 'Select a date',
            //     labelText: 'Date of Birth',
            //     errorMessage: _hasError
            //         ? 'Selected date should not be in the future'
            //         : null,
            //     onChanged: (selectedDate) {
            //       final hasError = selectedDate.isAfter(DateTime.now());
            //       setState(() {
            //         _hasError = hasError;
            //         _selectedDate = hasError ? null : selectedDate;
            //       });
            //     },
            //     onErrorChanged: (hasError) {
            //       setState(() {
            //         _hasError = hasError;
            //       });
            //     },
            //   ),
            // ),
            const SizedBox(height: 100),
            // SizedBox(
            //   width: 300,
            //   child: PrimaryDateField(
            //     hintText: 'Select a date',
            //     errorMessage: _hasError
            //         ? 'Selected date should not be in the future'
            //         : null,
            //     onChanged: (selectedDate) {
            //       final hasError = selectedDate.isAfter(DateTime.now());
            //       setState(() {
            //         _hasError = hasError;
            //         _selectedDate = hasError ? null : selectedDate;
            //       });
            //     },
            //     onErrorChanged: (hasError) {
            //       setState(() {
            //         _hasError = hasError;
            //       });
            //     },
            //   ),
            // ),
            const SizedBox(height: 100),
            Text(
              'Entered Text: ${_selectedDate != null ? _formatDate(_selectedDate!) : ""}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString()}";
  }
}
