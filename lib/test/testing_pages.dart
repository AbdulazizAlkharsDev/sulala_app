import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/switches/switch_disabled.dart';
import 'package:sulala_app/src/widgets/checkbox/checkbox_active.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CheckBoxActive(
            checked: true, // or false depending on the initial state
            onChanged: (bool checked) {
              // Handle the checked status change here
            },
          ),
          const SizedBox(width: 20),
          const CheckBoxDisabled(
            checked: true,
          ),
        ],
      )),
    );
  }
}
