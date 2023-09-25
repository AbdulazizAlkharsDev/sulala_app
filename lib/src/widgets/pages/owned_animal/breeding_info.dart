// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/other/one_information_block.dart';
import 'package:sulala_app/test/ListOfBreedingEvents.dart';
import 'package:sulala_app/test/ListOfChildren.dart';
import 'package:sulala_app/test/ListOfPartners.dart';
import '../../../../test/ListOfParents.dart';
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
        SizedBox(
          height: heightMediaQuery * 8,
        ),
        SizedBox(
          width: 343 * widthMediaQuery,
          child: const TwoInformationBlock(
            head1: '12.02.2023',
            head2: '12.02.2023',
            subtitle1: "Last Breeding Date",
            subtitle2: 'Next Breeding Date',
          ),
        ),
        SizedBox(
          height: heightMediaQuery * 24,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(
                      top: 8 * heightMediaQuery, bottom: 8 * heightMediaQuery),
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
                  contentPadding: EdgeInsets.only(
                      top: 8 * heightMediaQuery, bottom: 8 * heightMediaQuery),
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
                          return const ListOfParents(
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
                  contentPadding: EdgeInsets.only(bottom: 8 * heightMediaQuery),
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
                  contentPadding: EdgeInsets.only(
                      top: 8 * heightMediaQuery, bottom: 8 * heightMediaQuery),
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
                          return ListOfPartners();
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(
                      top: 8 * heightMediaQuery, bottom: 32 * heightMediaQuery),
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
                          return ListOfChildren();
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
