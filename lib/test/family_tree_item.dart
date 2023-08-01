import 'package:flutter/material.dart';

import '../src/theme/colors/colors.dart';
import '../src/theme/fonts/fonts.dart';

class FamilyTreeItem extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final String sex;
  final String id;
  final String tag;

  const FamilyTreeItem({
    super.key,
    this.imageUrl,
    required this.name,
    required this.sex,
    required this.tag,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage:
              // imageUrl != null ? NetworkImage(imageUrl!) :
              // NetworkImage(imageUrl!),
              const AssetImage("assets/avatars/120px/Horse.png"),
          radius: MediaQuery.of(context).size.width * 0.0875,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.009),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: AppFonts.body1(
                color: AppColors.grayscale90,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            sex.toLowerCase() != "male"
                ? Image.asset("assets/icons/frame/24px/16_Gender_female.png")
                : Image.asset("assets/icons/frame/24px/16_Gender_male.png")
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.004),
        Text(
          'ID #$id',
          style: AppFonts.caption2(
            color: AppColors.grayscale80,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.004),
        Text(
          tag,
          style: AppFonts.caption3(
            color: AppColors.grayscale80,
          ),
        ),
      ],
    );
  }
}
// 'assets/avatars/80px/Horse_80.png'