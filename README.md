# sulala_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
  double heightMediaQuery = MediaQuery.of(context).size.height / 812;
  double widthMediaQuery = MediaQuery.of(context).size.width / 375;
  import 'package:sulala_app/src/data/globals.dart' as globals;
  globals.widthMediaQuery * 16
  globals.heightMediaQuery * 16

  persistentFooterButtons: [
  SizedBox(
  width: MediaQuery.of(context).size.width _ 0.914,
  height: MediaQuery.of(context).size.height _ 0.065,
  child: PrimaryButton(
  onPressed: () {
  List<String> selectedFiltersList = [];
  selectedAnimals.forEach((key, value) {
  if (value != null) {
  selectedFiltersList.add(value);
  }
  });
  selectedAnimals1.forEach((key, value) {
  if (value != null) {
  selectedFiltersList.add(value);
  }
  });
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) => UserListOfAnimals(
  selectedFilters: selectedFiltersList,
  ),
  ),
  );
  },
  text: "Continue",
  ),
  ),
  ],

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
