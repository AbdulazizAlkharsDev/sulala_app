import 'package:flutter/material.dart';

import 'package:sulala_app/src/widgets/tags/tags.dart';

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Tags(
              text: 'Tag 1',
              icon: Icons.ac_unit,
              onPress: () {
                // Handle tag click
              },
              status: TagStatus.active,
            ),
            Tags(
              text: 'Tag 1',
              icon: Icons.ac_unit,
              onPress: () {
                // Handle tag click
              },
              status: TagStatus.notActive,
            ),
            Tags(
              text: 'Tag 1',
              icon: Icons.ac_unit,
              onPress: () {
                // Handle tag click
              },
              status: TagStatus.disabled,
            ),
          ],
        ),
      ),
    );
  }
}
