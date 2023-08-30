import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sulala_app/src/screens/profile/list_of_staff.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';

class ShimmerProfilePage extends StatelessWidget {
  const ShimmerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double heightMediaQuery = MediaQuery.of(context).size.height / 812;
    double widthMediaQuery = MediaQuery.of(context).size.width / 375;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 40 * heightMediaQuery),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
                height: 120 * heightMediaQuery,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                )),
          ),
          SizedBox(height: 16 * heightMediaQuery),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
                height: 28 * heightMediaQuery,
                width: 160 * widthMediaQuery,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20 * widthMediaQuery),
                )),
          ),
          SizedBox(height: 4 * heightMediaQuery),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
                height: 18 * heightMediaQuery,
                width: 160 * widthMediaQuery,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20 * widthMediaQuery),
                )),
          ),
          SizedBox(height: 4 * heightMediaQuery),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
                height: 18 * heightMediaQuery,
                width: 160 * widthMediaQuery,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20 * widthMediaQuery),
                )),
          ),
          SizedBox(height: 16 * heightMediaQuery),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
                height: 20 * heightMediaQuery,
                width: 160 * widthMediaQuery,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20 * widthMediaQuery),
                )),
          ),
          SizedBox(height: 32 * heightMediaQuery),
          SizedBox(
            height: 40 * heightMediaQuery,
            width: 343 * widthMediaQuery,
            child: PrimaryButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListOfStaff()),
                );
                // Add function of the button below
              },
              text: 'Collaboration',
              position: PrimaryButtonPosition.right,
            ),
          ),
          SizedBox(height: 24 * heightMediaQuery),
          Container(
            height: 68 * heightMediaQuery,
            width: 343 * widthMediaQuery,
            decoration: BoxDecoration(
              color: AppColors.grayscale10,
              borderRadius: BorderRadius.circular(20 * widthMediaQuery),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < 3; i++)
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 40 * heightMediaQuery,
                      width: 84 * widthMediaQuery,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(20 * widthMediaQuery),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 24 * heightMediaQuery),
        ],
      ),
    );
  }
}
