import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/flat_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/secondary_button.dart';
import '../../widgets/controls_and_buttons/buttons/primary_button.dart';
import '../../widgets/inputs/draw_ups/draw_up_widget.dart';

// ignore: must_be_immutable
class IsPregnantWidget extends StatelessWidget {
  bool? newMammalpregnantStatus;
  bool? mammalpregnantStatuses;

  IsPregnantWidget(
      {super.key, this.newMammalpregnantStatus, this.mammalpregnantStatuses});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Container(
          color: Colors.transparent,
          child: DrowupWidget(
            heightFactor: 0.45,
            heading: 'Is the Animal Pregnant?',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 343 * MediaQuery.of(context).size.width / 375,
                      height: 52 * MediaQuery.of(context).size.height / 812,
                      child: PrimaryButton(
                          text: 'Yes',
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    SizedBox(
                      height: 8 * MediaQuery.of(context).size.height / 812,
                    ),
                    SizedBox(
                      width: 343 * MediaQuery.of(context).size.width / 375,
                      height: 52 * MediaQuery.of(context).size.height / 812,
                      child: SecondaryButton(
                          text: 'No',
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    SizedBox(
                      height: 8 * MediaQuery.of(context).size.height / 812,
                    ),
                    SizedBox(
                      width: 343 * MediaQuery.of(context).size.width / 375,
                      height: 52 * MediaQuery.of(context).size.height / 812,
                      child: FlatButton(
                          text: 'Cancel',
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
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
