import 'package:flutter/material.dart';

import '../src/theme/colors/colors.dart';
import '../src/widgets/controls_and_buttons/buttons/primary_button.dart';
import '../src/widgets/inputs/draw_ups/draw_up_widget.dart';

// ignore: must_be_immutable
class PregnantStatusWidget extends StatelessWidget {
  bool? newMammalpregnantStatus;
  bool? mammalpregnantStatuses;

  PregnantStatusWidget(
      {super.key, this.newMammalpregnantStatus, this.mammalpregnantStatuses});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Container(
          color: Colors.transparent,
          child: DrowupWidget(
            heightFactor: 0.45,
            heading: 'Pregnancy Status',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Not Pregnant'),
                      trailing: mammalpregnantStatuses == false
                          ? Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primary30,
                                  width: 6.0,
                                ),
                              ),
                            )
                          : Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.grayscale20,
                                  width: 1.0,
                                ),
                              ),
                            ),
                      onTap: () {
                        setState(
                          () {
                            mammalpregnantStatuses = false;
                          },
                        );
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Pregnant'),
                      trailing: mammalpregnantStatuses == true
                          ? Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primary30,
                                  width: 6.0,
                                ),
                              ),
                            )
                          : Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.grayscale20,
                                  width: 1.0,
                                ),
                              ),
                            ),
                      onTap: () {
                        setState(() {
                          mammalpregnantStatuses = true;
                        });
                      },
                    ),
                    SizedBox(
                      height: 55 * MediaQuery.of(context).size.height / 812,
                    ),
                    SizedBox(
                      width: 343 * MediaQuery.of(context).size.width / 375,
                      height: 52 * MediaQuery.of(context).size.height / 812,
                      child: PrimaryButton(
                          text: 'Confirm',
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
