import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/secondary_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/tags/tags.dart';

class ShowFilterReg extends StatefulWidget {
  const ShowFilterReg({super.key});

  @override
  State<ShowFilterReg> createState() => _ShowFilterRegState();
}

TagStatus borrowed = TagStatus.active;

class _ShowFilterRegState extends State<ShowFilterReg> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.025,
        ),
        Text(
          'Current State',
          style: AppFonts.headline3(color: AppColors.grayscale90),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.012,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Tags(
              text: 'Borrowed',
              onPress: () {
                setState(() {
                  if (borrowed == TagStatus.active) {
                    borrowed = TagStatus.notActive;
                  } else {
                    borrowed = TagStatus.active;
                  }
                });
              },
              status: borrowed,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.021),
            Tags(
              text: 'Adopted',
              onPress: () {
                // Handle tag click
              },
              status: TagStatus.notActive,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.021),
            Tags(
              text: 'Donated',
              onPress: () {
                // Handle tag click
              },
              status: TagStatus.disabled,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Tags(
              text: 'Escaped',
              onPress: () {
                // Handle tag click
              },
              status: TagStatus.active,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.021),
            Tags(
              text: 'Stolen',
              onPress: () {
                // Handle tag click
              },
              status: TagStatus.notActive,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.021),
            Tags(
              text: 'Transferred',
              onPress: () {
                // Handle tag click
              },
              status: TagStatus.disabled,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.029,
        ),
        Text('Medical State',
            style: AppFonts.headline3(color: AppColors.grayscale90)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.012,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Tags(
              text: 'Injured',
              onPress: () {
                // Handle tag click
              },
              status: TagStatus.active,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.021),
            Tags(
              text: 'Sick',
              onPress: () {
                // Handle tag click
              },
              status: TagStatus.notActive,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.021),
            Tags(
              text: 'Quarantined',
              onPress: () {
                // Handle tag click
              },
              status: TagStatus.disabled,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Tags(
              text: 'Medication',
              onPress: () {
                // Handle tag click
              },
              status: TagStatus.active,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.021),
            Tags(
              text: 'Testing',
              onPress: () {
                // Handle tag click
              },
              status: TagStatus.notActive,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.029,
        ),
        Text(
          'Others',
          style: AppFonts.headline3(color: AppColors.grayscale90),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.012,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Tags(
              text: 'Sold',
              onPress: () {
                // Handle tag click
              },
              status: TagStatus.active,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.021),
            Tags(
              text: 'Dead',
              onPress: () {
                // Handle tag click
              },
              status: TagStatus.notActive,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.039,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.064,
              width: MediaQuery.of(context).size.width * 0.44,
              child: SecondaryButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'Clear All',
                status: SecondaryButtonStatus.idle,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.064,
              width: MediaQuery.of(context).size.width * 0.44,
              child: PrimaryButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'Apply',
                status: PrimaryButtonStatus.idle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
