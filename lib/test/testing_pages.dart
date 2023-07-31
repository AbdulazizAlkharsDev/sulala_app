import 'package:flutter/material.dart';
import 'package:sulala_app/src/lists/animal_list_widget.dart';
import 'package:sulala_app/src/lists/staff_list_widget.dart';
import 'package:sulala_app/src/lists/multi_lines_widget.dart';
import 'package:sulala_app/src/lists/single_line_widget.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

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
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.055,
              child: SingleLineWidget(
                textHead:
                    'Hello', // Replace with the actual text you want to display
                onPressed: () {
                  // Do something when the row is pressed
                  // For example, you can navigate to a new page, update the UI, etc.
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
