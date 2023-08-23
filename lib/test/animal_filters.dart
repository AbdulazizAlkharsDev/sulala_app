import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/text_buttons/primary_textbutton.dart';
import 'package:sulala_app/test/user_list_of_animals.dart';

class AnimalFilters extends StatefulWidget {
  const AnimalFilters({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimalFilters createState() => _AnimalFilters();
}

class _AnimalFilters extends State<AnimalFilters> {
  Map<String, List<String>> sectionItemsRadio = {
    'Animal Type': ['Mammal', 'Oviparous'],
    'Animal Species': ['Sheep', 'Cow', 'Horse'],
    'Animal Breed': ['Altafai stoat', 'East Siberian stoat', 'Gobi stoat'],
    'Animal Sex': ['Male', 'Female'],
  };

  Map<String, List<String>> sectionItemsCheckBox = {
    'Breeding Stage': ['Ready for breeding', 'Pregnant', 'Lactating'],
    'Tags': ['Borrowed', 'Adopted', 'Donated'],
  };

  Map<String, String?> selectedAnimals = {};
  Map<String, String?> selectedAnimals1 = {};

  @override
  void initState() {
    super.initState();
    for (var heading in sectionItemsRadio.keys) {
      selectedAnimals[heading] = null;
    }
    for (var heading in sectionItemsCheckBox.keys) {
      selectedAnimals1[heading] = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Filter Animals',
            style: AppFonts.headline3(color: AppColors.grayscale90),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.042,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    selectedAnimals.clear();
                    selectedAnimals1.clear();
                    for (var heading in sectionItemsRadio.keys) {
                      selectedAnimals[heading] = null;
                    }
                    for (var heading in sectionItemsCheckBox.keys) {
                      selectedAnimals1[heading] = null;
                    }
                  });
                  Navigator.pop(context);
                },
                icon: Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.width * 0.1,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.grayscale10,
                  ),
                  child: const Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            for (var sectionIndex = 0;
                sectionIndex < sectionItemsRadio.length;
                sectionIndex++)
              _buildSectionRadio(sectionIndex),
            for (var sectionIndex = 0;
                sectionIndex < sectionItemsCheckBox.length;
                sectionIndex++)
              _buildSectionCheckBox(sectionIndex),
          ],
        ),
        floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width * 0.914,
          height: MediaQuery.of(context).size.height * 0.065,
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
      ),
    );
  }

  Widget _buildSectionRadio(int sectionIndex) {
    String sectionHeading = sectionItemsRadio.keys.elementAt(sectionIndex);
    List<String> sectionLanguages = sectionItemsRadio[sectionHeading]!;
    String? selectedLanguage = selectedAnimals[sectionHeading];

    bool showShowMoreButton =
        sectionHeading != 'Animal Type' && sectionHeading != 'Animal Sex';

    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.042,
          right: MediaQuery.of(context).size.width * 0.042),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sectionHeading,
            style: AppFonts.headline3(color: AppColors.grayscale90),
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              for (var index = 0;
                  index <
                      (showShowMoreButton
                          ? sectionLanguages.length + 1
                          : sectionLanguages.length);
                  index++)
                if (showShowMoreButton && index == sectionLanguages.length)
                  PrimaryTextButton(
                    text: 'Show more',
                    onPressed: () {
                      // _showDialog(
                      //     context, sectionHeading); // Show dialog on tap
                    },
                    status: TextStatus.idle,
                    position: TextButtonPosition.right,
                  )
                else
                  _buildListItem(sectionHeading, sectionLanguages[index],
                      selectedLanguage),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCheckBox(int sectionIndex) {
    String sectionHeading = sectionItemsRadio.keys.elementAt(sectionIndex);
    List<String> sectionLanguages = sectionItemsRadio[sectionHeading]!;
    String? selectedLanguage = selectedAnimals[sectionHeading];

    bool showShowMoreButton =
        sectionHeading != 'Animal Type' && sectionHeading != 'Animal Sex';

    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.042,
          right: MediaQuery.of(context).size.width * 0.042),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sectionHeading,
            style: AppFonts.headline3(color: AppColors.grayscale90),
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              for (var index = 0;
                  index <
                      (showShowMoreButton
                          ? sectionLanguages.length + 1
                          : sectionLanguages.length);
                  index++)
                if (showShowMoreButton && index == sectionLanguages.length)
                  PrimaryTextButton(
                    text: 'Show more',
                    onPressed: () {
                      // _showDialog(
                      //     context, sectionHeading); // Show dialog on tap
                    },
                    status: TextStatus.idle,
                    position: TextButtonPosition.right,
                  )
                else
                  _buildListItem(sectionHeading, sectionLanguages[index],
                      selectedLanguage),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(
      String sectionHeading, String language, String? selectedLanguage) {
    bool isSelected = language == selectedLanguage;
    bool isMaleSelected = selectedAnimals['Animal Sex'] == 'Male';
    bool isBreedingStage = sectionHeading == 'Breeding Stage';
    bool isPregnantOrLactating =
        language == 'Pregnant' || language == 'Lactating';

    if (isMaleSelected && isBreedingStage && isPregnantOrLactating) {
      isSelected = false;
    }

    Color borderColor =
        isSelected ? AppColors.primary20 : AppColors.grayscale50;
    Color trailingColor = isPregnantOrLactating && isMaleSelected
        ? AppColors.grayscale30
        : Colors.transparent;
    Color textColor = isPregnantOrLactating && isMaleSelected
        ? AppColors.grayscale50
        : AppColors.grayscale90;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        language,
        style: AppFonts.body2(color: textColor),
      ),
      trailing: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor,
            width: isSelected ? 6.0 : 1.0,
          ),
          color: trailingColor,
        ),
      ),
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedAnimals[sectionHeading] = null;
          } else {
            selectedAnimals[sectionHeading] = language;
          }
        });
      },
    );
  }
}
