// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/icon_buttons/flat_icon_button.dart';
import 'package:sulala_app/src/widgets/inputs/search_bars/button_search_bar.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  int selectedValue = 1; // Provide a default non-null value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 48,
              width: 343,
              child: ButtonSearchBar(
                onChange: (value) {
                  print('Search query: $value');
                  print('###############)))add##');
                },
                hintText: 'Search',
                icon: Icons.filter_alt_outlined,
                onIconPressed: () {
                  print('Button pressed');
                },
              ),
            ),
            const SizedBox(height: 16),
            FlatIconButton(
              status: FlatIconButtonStatus.idle,
              icon: Icons.add,
              onPressed: () {
                print('Button pressed');
              },
            ),
            const SizedBox(height: 16),
            const FlatIconButton(
              status: FlatIconButtonStatus.disabled,
              icon: Icons.add,
            ),
            const SizedBox(height: 16),
            FlatIconButton(
              status: FlatIconButtonStatus.pressed,
              icon: Icons.add,
              onPressed: () {
                print('Button pressed');
              },
            ),
          ],
        ),
      ),
    );
  }
}
