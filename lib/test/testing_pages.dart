import 'package:flutter/material.dart';

import '../src/widgets/buttons/primary/primary_button.dart';

class FarmsListView extends StatelessWidget {
  const FarmsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farms List'),
      ),
      body: Center(
        child: PrimaryButton(
          status: ButtonStatus.idle,
          text: 'Submit',
          onPressed: () {
            // Handle button press
          },
        ),
      ),
    );
  }
}
