// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/inputs/phone_number_field.dart/phone_number_field.dart';
import 'package:sulala_app/src/widgets/inputs/phone_number_field.dart/disabled_phone_number_field.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  String? savedPhoneNumber;

  void savePhoneNumber(String phoneNumber) {
    setState(() {
      savedPhoneNumber = phoneNumber;
    });
  }

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
              child: PhoneNumberField(
                  label: 'Phone Number', onSave: savePhoneNumber),
            ),
            const SizedBox(height: 16),
            Text(
              savedPhoneNumber != null
                  ? 'Saved Phone Number: $savedPhoneNumber'
                  : 'Phone number not saved yet',
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: const DisabledPhoneNumberField(
                label: 'Phone Number',
                countryCode: '+966',
                countryFlag: 'assets/icons/flags/Country=SA.png',
                phoneNumber: '60909090',
              ),
            )
          ],
        ),
      ),
    );
  }
}
