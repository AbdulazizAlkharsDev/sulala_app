// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/other/one_information_block.dart';
import 'package:sulala_app/src/screens/breeding/list_of_breeding_events.dart';
import 'package:sulala_app/src/screens/breeding/list_of_children.dart';
import 'package:sulala_app/src/screens/breeding/list_of_mates.dart';
import '../../../screens/breeding/parents_page.dart';
import '../../../theme/colors/colors.dart';
import '../../../theme/fonts/fonts.dart';
import '../../other/two_information_block.dart';

class BreedingInfo extends StatelessWidget {
  const BreedingInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool animalGender = true;
    double heightMediaQuery = MediaQuery.of(context).size.height / 812;
    double widthMediaQuery = MediaQuery.of(context).size.width / 375;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (animalGender)
          SizedBox(
            width: widthMediaQuery * 343,
            child: const OneInformationBlock(
                head1: 'Pregnant', subtitle1: 'Current State'),
          ),
        if (animalGender)
          SizedBox(
            height: heightMediaQuery * 8,
          ),
        if (animalGender)
          SizedBox(
            width: 343 * widthMediaQuery,
            child: const TwoInformationBlock(
              head1: '12.02.2023',
              head2: '12.02.2023',
              subtitle1: "Last Breeding Date",
              subtitle2: 'Next Breeding Date',
            ),
          ),
        if (animalGender)
          SizedBox(
            height: heightMediaQuery * 24,
          ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.only(right: 0, left: 0),
                  leading: Image.asset(
                      'assets/icons/frame/24px/breeding_history.png'),
                  title: Text(
                    'Breeding History',
                    style: AppFonts.headline3(color: AppColors.grayscale90),
                  ),
                  trailing: Icon(Icons.chevron_right_rounded,
                      size: 24 * widthMediaQuery),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ListOfBreedingEvents(
                            selectedBreedChildren: 'fff',
                            selectedBreedDam: 'dd',
                            selectedBreedSire: 'xx',
                            selectedDeliveryDate: '2222',
                            selectedBreedingDate: '321',
                            selectedBreedPartner: 'fsdsdf',
                            breedingEventNumberController:
                                TextEditingController(),
                            breedingNotesController: TextEditingController(),
                          );
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(right: 0, left: 0),
                  leading: Image.asset('assets/icons/frame/24px/parents.png'),
                  title: Text(
                    'Parents',
                    style: AppFonts.headline3(color: AppColors.grayscale90),
                  ),
                  trailing: Icon(Icons.chevron_right_rounded,
                      size: 24 * widthMediaQuery),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ParentsPage(
                            selectedMammalDam: '',
                            selectedMammalSire: '',
                            selectedOviDam: '',
                            selectedOviSire: '',
                          );
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(right: 0, left: 0),
                  leading:
                      Image.asset('assets/icons/frame/24px/family_tree.png'),
                  title: Text(
                    'Family Tree',
                    style: AppFonts.headline3(color: AppColors.grayscale90),
                  ),
                  trailing: Icon(Icons.chevron_right_rounded,
                      size: 24 * widthMediaQuery),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(right: 0, left: 0),
                  leading: animalGender
                      ? Image.asset('assets/icons/frame/24px/male_mates.png')
                      : Image.asset('assets/icons/frame/24px/female_mates.png'),
                  title: animalGender
                      ? Text(
                          'Male Mates',
                          style:
                              AppFonts.headline3(color: AppColors.grayscale90),
                        )
                      : Text(
                          'Female Mates',
                          style:
                              AppFonts.headline3(color: AppColors.grayscale90),
                        ),
                  trailing: Icon(Icons.chevron_right_rounded,
                      size: 24 * widthMediaQuery),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ListOfMates();
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(
                      right: 0, left: 0, bottom: 32 * heightMediaQuery),
                  leading: Image.asset('assets/icons/frame/24px/children.png'),
                  title: Text(
                    'Children',
                    style: AppFonts.headline3(color: AppColors.grayscale90),
                  ),
                  trailing: Icon(Icons.chevron_right_rounded,
                      size: 24 * widthMediaQuery),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ListOfChildren();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
