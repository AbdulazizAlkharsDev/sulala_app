import 'package:flutter/material.dart';

import 'package:sulala_app/src/widgets/buttons/secondary/secondary_button.dart';

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
        child: SecondaryButton(
          status: ButtonStatus.loading,
          text: 'Submit',
          onPressed: () {
            // Handle button press
          },
        ),
      ),
    );
  }
}
