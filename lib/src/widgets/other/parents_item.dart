import 'package:flutter/material.dart';
import '../../theme/colors/colors.dart';
import '../../theme/fonts/fonts.dart';

class ParentsItem extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final String sex;
  final String id;
  final String age;

  const ParentsItem({
    Key? key, // Add 'Key?' type to the key parameter
    this.imageUrl,
    required this.name,
    required this.sex,
    required this.age,
    required this.id,
  }) : super(key: key); // Call the super constructor with the provided key

  @override
  Widget build(BuildContext context) {
    double heightMediaQuery = MediaQuery.of(context).size.height / 812;
    double widthMediaQuery = MediaQuery.of(context).size.width / 375;
    ImageProvider<Object>? getImage() {
      if (imageUrl != null) {
        return NetworkImage(imageUrl!);
      } else {
        return const AssetImage("assets/avatars/120px/Horse.png");
      }
    }

    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: getImage(),
          radius: 60 * widthMediaQuery,
        ),
        SizedBox(height: 16 * heightMediaQuery),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            sex.toLowerCase() != "male"
                ? Image.asset(
                    "assets/icons/frame/24px/16_Gender_female_1_5.png")
                : Image.asset("assets/icons/frame/24px/16_Gender_male_1_5.png"),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            Text(
              name,
              style: AppFonts.title5(
                color: AppColors.grayscale90,
              ),
            ),
          ],
        ),
        Text(
          'ID #$id',
          style: AppFonts.body2(
            color: AppColors.grayscale80,
          ),
        ),
        Text(
          age,
          style: AppFonts.body2(
            color: AppColors.grayscale80,
          ),
        ),
      ],
    );
  }
}


// Example of use:

// const FamilyTreeItem(
//                     id: "12345",
//                     name: "Harry",
//                     sex: "Male",
//                     tag: "Borrower",
//                     imageUrl: null,
//                   ),