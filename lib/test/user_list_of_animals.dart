import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/src/widgets/inputs/search_bars/button_search_bar.dart';
import 'package:sulala_app/test/animal_filters.dart';
import 'package:sulala_app/test/create_animal.dart';
import 'package:sulala_app/test/test_animal_info.dart';

class UserListOfAnimals extends StatefulWidget {
  final List<String> selectedFilters;

  const UserListOfAnimals({super.key, required this.selectedFilters});

  @override
  State<UserListOfAnimals> createState() => _UserListOfAnimalsState();
}

class _UserListOfAnimalsState extends State<UserListOfAnimals> {
  final List<Map<String, dynamic>> mammals = [
    {
      'name': 'Kenneth',
      'image': 'assets/avatars/120px/Cat.png',
      'subtitle': 'Oviparous',
    },
    {
      'name': 'Beverly',
      'image': 'assets/avatars/120px/Dog.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'John',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Patrick',
      'image': 'assets/avatars/120px/Horse.png',
      'subtitle': 'Oviparous',
    },
    {
      'name': 'Brian',
      'image': 'assets/avatars/120px/Duck.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Joyce',
      'image': 'assets/avatars/120px/Cat.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/avatars/120px/Sheep.png',
      'subtitle': 'Mammal',
    },
  ];

  List<Map<String, dynamic>> _filteredMammals = [];

  @override
  void initState() {
    super.initState();
    _updateFilteredMammals();
  }

  void _filterMammals(String query) {
    setState(() {
      _updateFilteredMammals(query: query);
    });
  }

  void _updateFilteredMammals({String? query}) {
    _filteredMammals = mammals.where((mammal) {
      final name = mammal['name'].toString().toLowerCase();
      final subtitle = mammal['subtitle'].toString().toLowerCase();
      return (query == null ||
              query.isEmpty ||
              name.contains(query.toLowerCase()) ||
              subtitle.contains(query.toLowerCase())) &&
          (widget.selectedFilters.isEmpty ||
              widget.selectedFilters.contains(mammal['subtitle']));
    }).toList();
  }

  void _removeSelectedFilter(String filter) {
    setState(() {
      widget.selectedFilters.remove(filter);
      _updateFilteredMammals();
    });
  }

  void navigateToAnimalInfo(Map<String, dynamic> mammal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnimalInfo(
          image: mammal['image'],
          name: mammal['name'],
          subtitle: mammal['subtitle'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Animals',
                style: AppFonts.title3(color: AppColors.grayscale90),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.width * 0.1,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary50,
                    ),
                    child: const Icon(Icons.add)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateAnimalPage()),
                  );
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.042,
                right: MediaQuery.of(context).size.width * 0.042),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ButtonSearchBar(
                  onChange: _filterMammals,
                  hintText: "Search by name or ID",
                  icon: Icons.filter_alt_outlined,
                  // controller: _searchController,
                  onIconPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AnimalFilters()),
                    );
                  },
                ),
                mammals.isNotEmpty
                    ? Visibility(
                        visible: widget.selectedFilters
                            .isNotEmpty, // Show space if there are selected filters
                        child: Wrap(
                          spacing: MediaQuery.of(context).size.width * 0.02,
                          children: widget.selectedFilters.map((filter) {
                            return Chip(
                              deleteIcon: Icon(
                                Icons.close_rounded,
                                color: AppColors.grayscale90,
                                size: MediaQuery.of(context).size.width * 0.05,
                              ),
                              labelStyle:
                                  AppFonts.body2(color: AppColors.grayscale90),
                              label: Text(filter),
                              backgroundColor: AppColors
                                  .grayscale10, // Set the background color

                              onDeleted: () {
                                _removeSelectedFilter(filter);
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    50), // Adjust the radius as needed
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    : const SizedBox(
                        height: 0,
                      ),
                mammals.isNotEmpty
                    ? _filteredMammals.isNotEmpty
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _filteredMammals.length,
                              itemBuilder: (context, index) {
                                final mammal = _filteredMammals[index];
                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: MediaQuery.of(context).size.width *
                                        0.064,
                                    backgroundImage:
                                        AssetImage(mammal['image']),
                                  ),
                                  title: Text(mammal['name']),
                                  subtitle: Text(mammal['subtitle']),
                                  onTap: () {
                                    navigateToAnimalInfo(mammal);
                                  },
                                );
                              },
                            ),
                          )
                        : SingleChildScrollView(
                            child: Center(
                              heightFactor: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/illustrations/cow_search.png',
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                  ),
                                  Text(
                                    'No Animals Found',
                                    style: AppFonts.headline3(
                                        color: AppColors.grayscale90),
                                  ),
                                  Text(
                                    'Try adjusting the filters',
                                    style: AppFonts.body2(
                                        color: AppColors.grayscale70),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                ],
                              ),
                            ),
                          )
                    : Center(
                        heightFactor: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/illustrations/cow_search.png',
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            Text(
                              'No Animals Added',
                              style: AppFonts.headline3(
                                  color: AppColors.grayscale90),
                            ),
                            Text(
                              'Add an animal to get started',
                              style:
                                  AppFonts.body2(color: AppColors.grayscale70),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: PrimaryButton(
                                  text: 'Add',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CreateAnimalPage()),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
