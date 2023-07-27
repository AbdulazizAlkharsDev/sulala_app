import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/flat/flat_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/navigate/navigate_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary/primary_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/secondary/secondary_button.dart';

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
              height: MediaQuery.of(context).size.height * 0.05,
              child: FlatButton(
                text: 'Button Text',
                onPressed: () {
                  // Your onPressed logic here
                },
                status: FlatButtonStatus.loading,
                position: FlatButtonPosition.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
