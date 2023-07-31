// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:sulala_app/test/default_text_widget.dart';
import 'package:sulala_app/test/text_checkbox_widget.dart';
import 'package:sulala_app/test/text_radio_widget.dart';
import 'package:sulala_app/test/text_toggle_widget.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

bool _isRowChecked = false;

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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultTextWidget(
                    textHead: 'Hello',
                    onPressed: (isChecked) {
                      setState(() {
                        _isRowChecked = isChecked;
                      });
                      if (_isRowChecked) {
                        // Do something when the row is checked
                      } else {
                        // Do something else when the row is unchecked
                      }
                    },
                  ),
                  TextCheckboxWidget(
                    text: 'Text Radio Widget',
                    checked: true,
                    onChanged: (isActive) {
                      // Do something when the radio button is toggled
                      if (isActive) {
                        // Handle the case when the radio button is active
                        print('Box Checked is active');
                      } else {
                        // Handle the case when the radio button is not active
                        print('Box Ckecked is not active');
                      }
                    },
                  ),
                  TextRadioWidget(
                    text: 'Text Radio Widget',
                    isActive:
                        true, // Replace with the actual boolean value for the radio button state
                    onChanged: (isActive) {
                      // Do something when the radio button is toggled
                      if (isActive) {
                        // Handle the case when the radio button is active
                        print('Radio button is active');
                      } else {
                        // Handle the case when the radio button is not active
                        print('Radio button is not active');
                      }
                    },
                  ),
                  TextToggleWidget(
                    text: 'Text Toggle Widget',
                    isActive:
                        true, // Replace with the actual boolean value for the radio button state
                    onChanged: (isActive) {
                      // Do something when the radio button is toggled
                      if (isActive) {
                        // Handle the case when the radio button is active
                        print('Toggle button is active');
                      } else {
                        // Handle the case when the radio button is not active
                        print('Toggle button is not active');
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
