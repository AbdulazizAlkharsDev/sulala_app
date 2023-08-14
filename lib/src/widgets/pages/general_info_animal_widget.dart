import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/lists/table_lsit/table_textbutton.dart';
import 'package:sulala_app/src/widgets/other/three_information_block.dart';

class GeneralInfoAnimalWidget extends StatelessWidget {
  final VoidCallback onDateOfBirthPressed;
  final VoidCallback onDateOfWeaningPressed;
  final VoidCallback onDateOfMatingPressed;
  final VoidCallback onDateOfDeathPressed;
  final VoidCallback onDateOfSalePressed;
  final String type;
  final String age;
  final String sex;

  const GeneralInfoAnimalWidget({
    Key? key,
    required this.onDateOfBirthPressed,
    required this.onDateOfWeaningPressed,
    required this.onDateOfMatingPressed,
    required this.onDateOfDeathPressed,
    required this.onDateOfSalePressed,
    required this.type,
    required this.age,
    required this.sex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.91,
          child: ThreeInformationBlock(
            head1: type,
            head2: age,
            head3: sex,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Text(
          "General Information",
          style: AppFonts.title5(color: AppColors.grayscale90),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TableTextButton(
                  onPressed: onDateOfBirthPressed,
                  textButton: "Add",
                  textHead: "Date of Birth",
                ),
                TableTextButton(
                  onPressed: onDateOfWeaningPressed,
                  textButton: "Add",
                  textHead: "Date of weaning",
                ),
                TableTextButton(
                  onPressed: onDateOfMatingPressed,
                  textButton: "Add",
                  textHead: "Date of mating",
                ),
                TableTextButton(
                  onPressed: onDateOfDeathPressed,
                  textButton: "Add",
                  textHead: "Date of death",
                ),
                TableTextButton(
                  onPressed: onDateOfSalePressed,
                  textButton: "Add",
                  textHead: "Date of sale",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
