// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/lists/table_lsit/table_clickable_link.dart';
import 'package:sulala_app/src/widgets/lists/table_lsit/table_text.dart';
import 'package:sulala_app/src/widgets/lists/table_lsit/table_textbutton.dart';

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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TableTextButton(
                    textHead: 'Text Button',
                    textButton: 'Button',
                    onPressed: (bool isChecked) {
                      print('Text Button Pressed');
                    },
                  ),
                  const TableText(
                    text1: 'Text',
                    text2: 'Text',
                  ),
                  const TableClickableText(
                    text1: 'Clickable Text',
                    urlText: 'Email@gmail.com',
                    url: "https://www.royalbabycenter.com/",
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
