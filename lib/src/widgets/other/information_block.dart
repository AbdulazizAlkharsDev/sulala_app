import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class InformationBlock extends StatelessWidget {
  final String head1;

  final String head2;

  final String head3;

  const InformationBlock({
    required this.head1,
    required this.head2,
    required this.head3,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.0763,
      width: MediaQuery.of(context).size.width * 0.833,
      decoration: BoxDecoration(
        color: const Color(0xFFF9F5EC),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  head1,
                  style: AppFonts.body2(color: AppColors.grayscale90),
                ),
                Text(
                  "Type",
                  style: AppFonts.caption2(color: AppColors.grayscale70),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.027,
            width: 1,
            color: AppColors.grayscale30,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  head2,
                  style: AppFonts.body2(color: AppColors.grayscale90),
                ),
                Text(
                  "Age",
                  style: AppFonts.caption2(color: AppColors.grayscale70),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.027,
            width: 1,
            color: AppColors.grayscale30,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  head3,
                  style: AppFonts.body2(color: AppColors.grayscale90),
                ),
                Text(
                  "Sex",
                  style: AppFonts.caption2(color: AppColors.grayscale70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
