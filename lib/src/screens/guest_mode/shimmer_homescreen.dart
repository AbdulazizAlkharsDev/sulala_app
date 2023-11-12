import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:sulala_app/src/data/globals.dart' as globals;

import '../../theme/colors/colors.dart';

class ShimmerHomePageWidget extends StatelessWidget {
  const ShimmerHomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                  width: double.infinity,
                  height: globals.heightMediaQuery * 211,
                  decoration: BoxDecoration(
                    color: AppColors.grayscale10,
                    borderRadius:
                        BorderRadius.circular(globals.widthMediaQuery * 19),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all((globals.widthMediaQuery * 18)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: globals.widthMediaQuery * 48,
                            height: globals.heightMediaQuery * 49,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  globals.widthMediaQuery / 188),
                            ),
                          ),
                        ),
                        SizedBox(height: globals.heightMediaQuery * 14),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: double.infinity,
                            height: globals.heightMediaQuery * 55,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  globals.widthMediaQuery * 24),
                            ),
                          ),
                        ),
                        SizedBox(height: globals.heightMediaQuery * 14),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: double.infinity,
                            height: globals.heightMediaQuery * 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  globals.widthMediaQuery * 24),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            SizedBox(width: globals.widthMediaQuery * 13),
            Expanded(
              child: Container(
                  width: double.infinity,
                  height: globals.heightMediaQuery * 211,
                  decoration: BoxDecoration(
                    color: AppColors.grayscale10,
                    borderRadius:
                        BorderRadius.circular(globals.widthMediaQuery * 19),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(globals.widthMediaQuery * 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: globals.widthMediaQuery * 48,
                            height: globals.heightMediaQuery * 48,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  globals.widthMediaQuery / 187),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: globals.heightMediaQuery * 14,
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: double.infinity,
                            height: globals.heightMediaQuery * 55,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  globals.widthMediaQuery * 24),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: globals.heightMediaQuery * 14,
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: double.infinity,
                            height: globals.heightMediaQuery * 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  globals.widthMediaQuery * 24),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.135),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.832,
          child: Column(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.0788,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.053),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.064,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.053),
                    )),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.011),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.064,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.053),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
