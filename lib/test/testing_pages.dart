import 'package:flutter/material.dart';
import 'package:sulala_app/src/lists/avatar_text_checkbox.dart';

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
              height: MediaQuery.of(context).size.height * 0.1,
              child: AvatarTextCheckbox(
                avatarRadius:
                    30.0, // Set the desired radius for the circle avatar
                imagePath:
                    'assets/avatars/120px/Duck.png', // Replace with the actual image path
                text:
                    'Text', // Replace with the actual text you want to display
                checked:
                    true, // Replace with the actual boolean value for the radio button state
                onChanged: (isActive) {
                  // Do something when the radio button is toggled
                  if (isActive) {
                    // Handle the case when the radio button is active
                  } else {
                    // Handle the case when the radio button is not active
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
