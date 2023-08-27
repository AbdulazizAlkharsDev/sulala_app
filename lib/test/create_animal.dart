import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/text_buttons/primary_textbutton.dart';
import 'package:sulala_app/src/widgets/inputs/draw_ups/draw_up_widget.dart';
import 'package:sulala_app/src/widgets/inputs/search_bars/search_bar.dart';
import 'package:sulala_app/test/select_options.dart';

class CreateAnimalPage extends StatefulWidget {
  const CreateAnimalPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CreateAnimalPageState createState() => _CreateAnimalPageState();
}

class _CreateAnimalPageState extends State<CreateAnimalPage> {
  String selectedAnimalType = '';
  String selectedAnimalSpecies = '';
  String selectedAnimalBreed = '';
  bool showAnimalSpeciesSection = false;
  bool showAnimalBreedsSection = false;
  bool areAllOptionsSelected() {
    return selectedAnimalType.isNotEmpty &&
        selectedAnimalSpecies.isNotEmpty &&
        selectedAnimalBreed.isNotEmpty;
  }

  List<String> animalSpeciesList = ['Sheep', 'Cow', 'Horse'];
  List<String> modalAnimalSpeciesList = ['Tiger', 'Elephant', 'Giraffe'];
  List<String> animalBreedsList = ['Bengal', 'African', 'Reticulated'];
  List<String> modalAnimalBreedsList = ['Bengali', 'Africani', 'Reticulatedii'];

  // Define a map to associate animal types with their image asset paths
  final Map<String, String> animalImages = {
    'Mammal': 'assets/avatars/120px/Horse_avatar.png',
    'Oviparous': 'assets/avatars/120px/Duck.png',
    // Add more entries for other animal types and their images
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            'Create Animal',
            style: AppFonts.headline3(color: AppColors.grayscale90),
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.zero,
              icon: Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.width * 0.1,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.grayscale10,
                  ),
                  child: const Icon(
                    Icons.close_rounded,
                    color: AppColors.grayscale90,
                  )),
              onPressed: () {
                // Handle close button press
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.042,
                right: MediaQuery.of(context).size.width * 0.042),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Animal Type',
                  style: AppFonts.headline2(color: AppColors.grayscale90),
                ),
                Column(
                  children: [
                    _buildAnimalTypeOption('Mammal'),
                    _buildAnimalTypeOption('Oviparous'),
                    // Add more animal type options here
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),

                if (showAnimalSpeciesSection) // Conditionally show if selected
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width * 0.912,
                          color: AppColors.grayscale20,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Animal Species',
                        style: AppFonts.headline2(color: AppColors.grayscale90),
                      ),
                      for (String species in animalSpeciesList)
                        _buildAnimalSpeciesOption(species),

                      PrimaryTextButton(
                        status: TextStatus.idle,
                        position: TextButtonPosition.right,
                        onPressed: () {
                          _showAnimalSpecies('species', context);
                        },
                        text: 'Show More',
                      ),
                      // Divider between species and breeds
                    ],
                  ),
                if (showAnimalBreedsSection) // Conditionally show if selected
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.007,
                        ),
                        Center(
                          child: Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.912,
                            color: AppColors.grayscale20,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          'Animal Breeds',
                          style:
                              AppFonts.headline2(color: AppColors.grayscale90),
                        ),
                        for (String breed in animalBreedsList)
                          _buildAnimalBreedOption(breed),
                        PrimaryTextButton(
                          onPressed: () {
                            _showAnimalSpecies('breeds',
                                context); // Show modal sheet on button press
                          },
                          text: 'Show More',
                          status: TextStatus.idle,
                          position: TextButtonPosition.right,
                        ),
                      ]),
                // Add more customization options here
                const SizedBox(height: 20),

                // Add more customization options here
                // Add more sections as needed
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                showAnimalSpeciesSection = selectedAnimalType.isNotEmpty;
                showAnimalBreedsSection = selectedAnimalSpecies.isNotEmpty;
              });
              if (areAllOptionsSelected()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectedOptionsPage(
                      selectedAnimalType: selectedAnimalType,
                      selectedAnimalSpecies: selectedAnimalSpecies,
                      selectedAnimalBreed: selectedAnimalBreed,
                    ),
                  ),
                );
              }
              // Handle "Continue" button press
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 36, 86, 38),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: const Text(
              'Continue',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimalTypeOption(String animalType) {
    final imageAsset = animalImages[animalType]!;
    final isSelected = selectedAnimalType == animalType;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageAsset),
        backgroundColor: Colors.transparent,
      ),
      title:
          Text(animalType, style: AppFonts.body2(color: AppColors.grayscale90)),
      trailing: Container(
        width: MediaQuery.of(context).size.width * 0.064,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? AppColors.primary20 : AppColors.grayscale30,
            width: isSelected ? 6.0 : 1.0,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          selectedAnimalType = animalType;
        });
      },
    );
  }

  Widget _buildAnimalSpeciesOption(String optionText) {
    final isSelected = selectedAnimalSpecies == optionText;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      title:
          Text(optionText, style: AppFonts.body2(color: AppColors.grayscale90)),
      trailing: Container(
        width: MediaQuery.of(context).size.width * 0.064,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? AppColors.primary20 : AppColors.grayscale30,
            width: isSelected ? 6.0 : 1.0,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          selectedAnimalSpecies = isSelected ? '' : optionText;
        });
      },
    );
  }

  Widget _buildAnimalBreedOption(String optionText) {
    final isSelected = selectedAnimalBreed == optionText;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        optionText,
        style: AppFonts.body2(color: AppColors.grayscale90),
      ),
      trailing: Container(
        width: MediaQuery.of(context).size.width * 0.064,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? AppColors.primary20 : AppColors.grayscale30,
            width: isSelected ? 6.0 : 1.0,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          selectedAnimalBreed = isSelected ? '' : optionText;
        });
      },
    );
  }

  void _showAnimalSpecies(String section, BuildContext context) async {
    String searchText = ''; // Store the search text
    List<String> modalList;

    if (section == 'species') {
      modalList = modalAnimalSpeciesList;
    } else if (section == 'breeds') {
      modalList = modalAnimalBreedsList;
    } else {
      return;
    }

    final selectedValue = await showModalBottomSheet<String>(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return DrowupWidget(
          heading: 'Animal Species',
          heightFactor: 0.9,
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PrimarySearchBar(
                    onChange: (value) {
                      setState(() {
                        searchText = value;
                      });
                    },
                    hintText: 'Search by species'),
                Expanded(
                  child: ListView.builder(
                    itemCount: modalList.length,
                    itemBuilder: (context, index) {
                      final item = modalList[index];
                      if (searchText.isNotEmpty &&
                          !item.toLowerCase().contains(
                                searchText.toLowerCase(),
                              )) {
                        return const SizedBox.shrink();
                      }
                      return _buildAdditionalOption(item, section);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (selectedValue != null) {
      setState(() {
        if (section == 'species') {
          animalSpeciesList.remove(selectedValue);
          animalSpeciesList.insert(0, selectedValue);
          selectedAnimalSpecies = selectedValue;
        } else if (section == 'breeds') {
          animalBreedsList.remove(selectedValue);
          animalBreedsList.insert(0, selectedValue);
          selectedAnimalBreed = selectedValue;
        }
      });
    }
  }

  Widget _buildAdditionalOption(String optionText, String section) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage('assets/avatars/120px/Horse_avatar.png'),
        backgroundColor: Colors.transparent,
      ),
      title:
          Text(optionText, style: AppFonts.body2(color: AppColors.grayscale90)),
      onTap: () {
        Navigator.pop(context, optionText);
      },
    );
  }
}
