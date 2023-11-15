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


  AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Create Animal',
          style: AppFonts.headline3(color: AppColors.grayscale90),
        ),
        leadingWidth: globals.widthMediaQuery * 56,
        leading: Padding(
          padding: EdgeInsets.only(left: globals.widthMediaQuery * 16),
          child: Container(
            decoration: const BoxDecoration(
                color: AppColors.grayscale10, shape: BoxShape.circle),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: globals.widthMediaQuery * 24,
              ),
              onPressed: () {
                // Handle close button press
                Navigator.pop(context);
              },
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: globals.widthMediaQuery * 16),
            child: Container(
              width: globals.widthMediaQuery * 40,
              decoration: const BoxDecoration(
                  color: AppColors.grayscale10, shape: BoxShape.circle),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.close_rounded,
                  color: Colors.black,
                  size: globals.widthMediaQuery * 24,
                ),
                onPressed: () {
                  // Handle close button press
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
