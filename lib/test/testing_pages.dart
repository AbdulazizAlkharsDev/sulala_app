// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/other/three_information_block.dart';
import 'package:sulala_app/src/widgets/other/family_tree_item.dart';

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
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FamilyTreeItem(
                    id: "12345",
                    name: "Harry",
                    sex: "Male",
                    tag: "Borrower",
                    imageUrl: null,
                  ),
                  ThreeInformationBlock(
                    head1: "Head 1",
                    head2: "Head 2",
                    head3: "Head 3",
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
