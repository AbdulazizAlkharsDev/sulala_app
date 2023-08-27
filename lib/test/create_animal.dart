import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/text_buttons/primary_textbutton.dart';
import 'package:sulala_app/src/widgets/inputs/draw_ups/draw_up_widget.dart';
import 'package:sulala_app/src/widgets/inputs/search_bars/search_bar.dart';
import 'package:sulala_app/test/select_options.dart';

class CreateAnimalPage extends StatefulWidget {
  const CreateAnimalPage({Key? key}) : super(key: key);

  @override
  State<CreateAnimalPage> createState() => _CreateAnimalPageState();
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
  List<String> modalAnimalSpeciesList = [
    'Tiger',
    'Elephant',
    'Elephant',
    'Elephant',
    'Elephant',
    'Elephant',
    'Elephant',
    'Elephant',
    'Elephant',
    'Elephant',
    'Elephant',
    'Elephant',
    'Elephant',
    'Elephant',
    'Elephant',
    'Elephant',
    'Elephant',
    'Elephant',
    'Giraffe'
  ];
  List<String> animalBreedsList = ['Bengal', 'African', 'Reticulated'];
  List<String> modalAnimalBreedsList = ['Bengali', 'Africani', 'Reticulatedii'];

  final Map<String, String> animalImages = {
    'Mammal': 'assets/avatars/120px/Horse_avatar.png',
    'Oviparous': 'assets/avatars/120px/Duck.png',
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
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                if (showAnimalSpeciesSection)
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
                    ],
                  ),
                if (showAnimalBreedsSection)
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
                            _showAnimalSpecies('breeds', context);
                          },
                          text: 'Show More',
                          status: TextStatus.idle,
                          position: TextButtonPosition.right,
                        ),
                      ]),
                const SizedBox(height: 20),
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
    List<String> filteredModalList = List.from(modalAnimalSpeciesList);
    TextEditingController searchValue = TextEditingController();

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
            height: MediaQuery.of(context).size.height * 0.68,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PrimarySearchBar(
                    controller: searchValue,
                    onChange: (value) {
                      setState(() {
                        value = searchValue.text;
                        filteredModalList = modalAnimalSpeciesList
                            .where((element) => element
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                    hintText: 'Search by species'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.029,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredModalList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(
                              'assets/avatars/120px/Horse_avatar.png'),
                          backgroundColor: Colors.transparent,
                        ),
                        title: Text(filteredModalList[index],
                            style:
                                AppFonts.body2(color: AppColors.grayscale90)),
                        onTap: () {
                          Navigator.pop(context, filteredModalList[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          primaryButton: PrimaryButton(
            status: PrimaryButtonStatus.idle,
            text: 'Confirm',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );

    if (selectedValue != null) {
      setState(() {
        animalSpeciesList.remove(selectedValue);
        animalSpeciesList.insert(0, selectedValue);
        selectedAnimalSpecies = selectedValue;
      });
    }
  }
}
