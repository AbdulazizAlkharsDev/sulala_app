import 'package:flutter/material.dart';
import 'package:sulala_app/src/lists/notification_widget.dart';

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
              height: MediaQuery.of(context).size.height * 0.055,
              child: NotificationListWidget(
                avatarRadius: 30,
                imagePath: 'assets/avatars/120px/Cat.png',
                textBody: 'Text',
                // timeText: "1 hour ago",
                textHead:
                    'animal', // Replace with the actual text you want to display
                textTime: "1 hour ago",
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
