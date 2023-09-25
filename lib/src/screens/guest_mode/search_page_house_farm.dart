import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/inputs/search_bars/button_search_bar.dart';
import 'package:sulala_app/src/widgets/lists/animal_list/animal_list_widget.dart';
import 'package:sulala_app/src/screens/guest_mode/user_details.dart';

class SearchPageHouseFarm extends StatefulWidget {
  const SearchPageHouseFarm({super.key});

  @override
  State<SearchPageHouseFarm> createState() => _SearchPageHouseFarmState();
}

class _SearchPageHouseFarmState extends State<SearchPageHouseFarm> {
  List<Map<String, dynamic>> farms = [
    {
      'imagePath': 'assets/avatars/120px/Staff1.png',
      'title': 'Paul Rivera',
      'subtitle': 'Viewer',
      'email': 'paul@example.com',
      'phoneNumber': '+1 234 567 890',
    },
    {
      'imagePath': 'assets/avatars/120px/Staff3.png',
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
      'imagePath': 'assets/avatars/120px/Staff3.png',
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

  List<Map<String, dynamic>> filteredOptions = [];
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> filteredFarms = [];

  @override
  void initState() {
    super.initState();
    filteredFarms = farms;
    // Initialize filteredOptions with all options
  }

  void filterOptions(String searchText) {
    setState(() {
      filteredFarms = farms
          .where(
            (option) => option['title']
                .toLowerCase()
                .contains(searchText.toLowerCase()),
          )
          .toList();
    });
  }

  void navigateToUserDetailsPage(Map<String, dynamic> option) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetails(
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            color: AppColors.grayscale90,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.042,
                  MediaQuery.of(context).size.width * 0.01,
                  MediaQuery.of(context).size.width * 0.042,
                  MediaQuery.of(context).size.width * 0.01),
              child: Text("House Farm",
                  style: AppFonts.title3(color: AppColors.grayscale90)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.042,
                  MediaQuery.of(context).size.width * 0.01,
                  MediaQuery.of(context).size.width * 0.042,
                  MediaQuery.of(context).size.width * 0.01),
              child: ButtonSearchBar(
                onChange: filterOptions,
                hintText: "Search by name or ID",
                icon: Icons.filter_alt_outlined,
                controller: _searchController,
                onIconPressed: () {
                  // print("Filter Pressed");
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            if (filteredFarms.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredFarms.length, //change it later please
                  itemBuilder: (context, index) {
                    final option = filteredFarms[index];
                    if (filteredOptions.isNotEmpty) {
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Image(
                                  image: AssetImage(
                                      'assets/illustrations/home_search.png')),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.04),
                              Text(
                                "No farms found",
                                style: AppFonts.headline3(
                                    color: AppColors.grayscale90),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.005),
                              Text(
                                "Try adjusting the filters",
                                style: AppFonts.body2(
                                    color: AppColors.grayscale70),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.026),
                        child: AnimalListWidget(
                          avatarRadius:
                              MediaQuery.of(context).size.width * 0.064,
                          imagePath: option['imagePath'],
                          textHead: option['title'],
                          textBody: option['subtitle'],
                          onPressed: () {
                            navigateToUserDetailsPage(option);
                          },
                        ),
                      );
                    }
                    return null;
                  },
                ),
              ),
            if (filteredFarms.isEmpty)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Image(
                          image: AssetImage(
                              'assets/illustrations/home_search.png')),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      Text(
                        "No farms found",
                        style: AppFonts.headline3(color: AppColors.grayscale90),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005),
                      Text(
                        "Try adjusting the filters",
                        style: AppFonts.body2(color: AppColors.grayscale70),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
