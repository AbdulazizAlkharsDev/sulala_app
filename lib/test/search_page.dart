import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/inputs/search_bars/search_bar.dart';
import 'package:sulala_app/src/widgets/lists/animal_list/animal_list_widget.dart';
import 'package:sulala_app/src/widgets/lists/staff_text/staff_list_widget.dart';
import 'package:sulala_app/test/search_details.dart';

import '../src/widgets/controls_and_buttons/icon_buttons/secondary_icon_button.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<String, dynamic>> allOptions = [];
  List<Map<String, dynamic>> filteredOptions = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDataFromBackend(); // Fetch initial data from the backend
  }

  Future<void> fetchDataFromBackend() async {
    // Simulate fetching data from the backend
    await Future.delayed(const Duration(seconds: 2));

    // Update the options list with the fetched data
    List<Map<String, dynamic>> newData = [
      {
        'imagePath': 'assets/avatars/120px/Staff1.png',
        'title': 'Paul Rivera',
        'subtitle': 'Viewer',
        'email': 'paul@example.com',
        'phoneNumber': '+1 234 567 890',
      },
      {
        'imagePath': 'assets/avatars/120px/Staff2.png',
        'title': 'Rebecca Wilson',
        'subtitle': 'Helper',
        'email': 'paul@example.com',
        'phoneNumber': '+1 234 567 890',
      },
      {
        'imagePath': 'assets/avatars/120px/Staff1.png',
        'title': 'Patricia Williams',
        'subtitle': 'Helper',
        'email': 'paul@example.com',
        'phoneNumber': '+1 234 567 890',
      },
      {
        'imagePath': 'assets/avatars/120px/Staff2.png',
        'title': 'Scott Simmons',
        'subtitle': 'Worker',
        'email': 'paul@example.com',
        'phoneNumber': '+1 234 567 890',
      },
      {
        'imagePath': 'assets/avatars/120px/Staff1.png',
        'title': 'Lee Hall',
        'subtitle': 'Worker',
        'email': 'paul@example.com',
        'phoneNumber': '+1 234 567 890',
      },
      // Your data here
    ];

    setState(() {
      allOptions = newData;
      filteredOptions = newData;
    });
  }

  void filterOptions(String searchText) {
    setState(() {
      filteredOptions = allOptions
          .where((option) =>
              option['title'].toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void navigateToDetailsPage(Map<String, dynamic> option) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchDetails(
          imagePath: option['imagePath'],
          title: option['title'],
          subtitle: option['subtitle'],
          email: option['email'],
          phoneNumber: option['phoneNumber'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.042,
                  MediaQuery.of(context).size.width * 0.01,
                  MediaQuery.of(context).size.width * 0.042,
                  MediaQuery.of(context).size.width * 0.01),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: PrimarySearchBar(
                        onChange: filterOptions,
                        hintText: "Search Staff",
                        controller: _searchController,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  SecondaryIconButton(
                    status: SecondaryIconButtonStatus.idle,
                    icon: Icons.clear,
                    onPressed: () {
                      setState(() {
                        _searchController.clear();
                        filterOptions('');
                        Navigator.pop(context);
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.042,
                  MediaQuery.of(context).size.width * 0.01,
                  MediaQuery.of(context).size.width * 0.042,
                  MediaQuery.of(context).size.width * 0.01),
              child: Text(
                'Farms',
                style: AppFonts.caption1(color: AppColors.grayscale80),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.167,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredOptions.length,
                itemBuilder: (context, index) {
                  final option = filteredOptions[index];

                  if (filteredOptions.isEmpty) {
                    return Center(
                      child: Text(
                        'No Farmers Found',
                        style: AppFonts.body1(color: AppColors.grayscale80),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.026),
                      child: StaffListWidget(
                        imagePath: option['imagePath'],
                        textHead: option['title'],
                        textBody: option['subtitle'],
                        avatarRadius: MediaQuery.of(context).size.width * 0.064,
                        onPressed: () => navigateToDetailsPage(option),
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.042,
                  MediaQuery.of(context).size.width * 0.01,
                  MediaQuery.of(context).size.width * 0.042,
                  MediaQuery.of(context).size.width * 0.01),
              child: Text(
                'Animals',
                style: AppFonts.caption1(color: AppColors.grayscale80),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.167,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1, //change it later please
                itemBuilder: (context, index) {
                  //final option = filteredOptions[index];

                  if (filteredOptions.isEmpty) {
                    return Center(
                      child: Text(
                        'No Farmers Found',
                        style: AppFonts.body1(color: AppColors.grayscale80),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.026),
                      child: AnimalListWidget(
                        avatarRadius: MediaQuery.of(context).size.width * 0.064,
                        imagePath: 'assets/avatars/120px/Horse_avatar.png',
                        textHead: 'Horse',
                        textBody: '',
                        onPressed: () {},
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
