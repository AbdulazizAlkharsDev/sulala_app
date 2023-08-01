// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:sulala_app/test/family_tree_item.dart';

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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: const FamilyTreeItem(
                    id: "12345",
                    name: "Harry",
                    sex: "Male",
                    tag: "Borrower",
                    imageUrl: "assets/avatars/120px/Horse.png",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
