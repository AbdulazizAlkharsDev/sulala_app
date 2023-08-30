import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class ShimmerListOfStaff extends StatelessWidget {
  const ShimmerListOfStaff({super.key});

  @override
  Widget build(BuildContext context) {
    double heightMediaQuery = MediaQuery.of(context).size.height / 812;
    double widthMediaQuery = MediaQuery.of(context).size.width / 375;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < 5; i++)
                Column(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                          height: 60 * heightMediaQuery,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(20 * widthMediaQuery),
                          )),
                    ),
                    SizedBox(height: 10 * heightMediaQuery),
                  ],
                ),
              SizedBox(height: 14 * heightMediaQuery),
              Text(
                'Requests',
                style: AppFonts.headline3(color: AppColors.grayscale80),
              ),
              SizedBox(height: 8 * heightMediaQuery),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                    height: 60 * heightMediaQuery,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20 * widthMediaQuery),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
