import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class TwoInformationBlock extends StatelessWidget {
  final String head1;
  final String head2;
  final String subtitle1;
  final String subtitle2;

  const TwoInformationBlock({
    required this.head1,
    required this.head2,
    required this.subtitle1,
    required this.subtitle2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  subtitle1,
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
                  subtitle2,
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


// Example of use:

// InformationBlock(
//                     head1: "Head 1",
//                     head2: "Head 2",
//                   ),