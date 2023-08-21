import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/secondary_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/tags/tags.dart';

class ShowFilterReg extends StatefulWidget {
  const ShowFilterReg({
    super.key,
  });

  @override
  State<ShowFilterReg> createState() => _ShowFilterRegState();
}

TagStatus borrowed = TagStatus.active;

class _ShowFilterRegState extends State<ShowFilterReg> {
  TagStatus borrowed = TagStatus.notActive;
  TagStatus adopted = TagStatus.notActive;
  TagStatus donated = TagStatus.notActive;
  TagStatus escaped = TagStatus.notActive;
  TagStatus stolen = TagStatus.notActive;
  TagStatus transferred = TagStatus.notActive;
  TagStatus injured = TagStatus.notActive;
  TagStatus sick = TagStatus.notActive;
  TagStatus quarantined = TagStatus.notActive;
  TagStatus medication = TagStatus.notActive;
  TagStatus testing = TagStatus.notActive;
  TagStatus sold = TagStatus.notActive;
  TagStatus dead = TagStatus.notActive;

  TagStatus? newBorrowed;
  TagStatus? newAdopted;
  TagStatus? newDonated;
  TagStatus? newEscaped;
  TagStatus? newStolen;
  TagStatus? newTransferred;
  TagStatus? newInjured;
  TagStatus? newSick;
  TagStatus? newQuarantined;
  TagStatus? newMedication;
  TagStatus? newTesting;
  TagStatus? newSold;
  TagStatus? newDead;

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
              text: "Borrowed",
              onPress: () {
                setState(() {
                  borrowed == TagStatus.active
                      ? borrowed = TagStatus.notActive
                      : borrowed = TagStatus.active;

                  borrowed = newBorrowed!;
                });
              },
              status: newBorrowed == null ? borrowed : newBorrowed!,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.021),
            Tags(
              text: 'Adopted',
              onPress: () {
                setState(() {
                  adopted == TagStatus.active
                      ? adopted = TagStatus.notActive
                      : adopted = TagStatus.active;
                });
              },
              status: adopted,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.021),
            Tags(
              text: 'Donated',
              onPress: () {
                setState(() {
                  donated == TagStatus.active
                      ? donated = TagStatus.notActive
                      : donated = TagStatus.active;
                });
              },
              status: donated,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Tags(
              text: 'Escaped',
              onPress: () {
                setState(() {
                  escaped == TagStatus.active
                      ? escaped = TagStatus.notActive
                      : escaped = TagStatus.active;
                });
              },
              status: escaped,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.021),
            Tags(
              text: 'Stolen',
              onPress: () {
                setState(() {
                  stolen == TagStatus.active
                      ? stolen = TagStatus.notActive
                      : stolen = TagStatus.active;
                });
              },
              status: stolen,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.021),
            Tags(
              text: 'Transferred',
              onPress: () {
                setState(() {
                  transferred == TagStatus.active
                      ? transferred = TagStatus.notActive
                      : transferred = TagStatus.active;
                });
              },
              status: transferred,
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
                setState(() {
                  injured == TagStatus.active
                      ? injured = TagStatus.notActive
                      : injured = TagStatus.active;
                });
              },
              status: injured,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.021),
            Tags(
              text: 'Sick',
              onPress: () {
                setState(() {
                  sick == TagStatus.active
                      ? sick = TagStatus.notActive
                      : sick = TagStatus.active;
                });
              },
              status: sick,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.021),
            Tags(
              text: 'Quarantined',
              onPress: () {
                setState(() {
                  quarantined == TagStatus.active
                      ? quarantined = TagStatus.notActive
                      : quarantined = TagStatus.active;
                });
              },
              status: quarantined,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Tags(
              text: 'Medication',
              onPress: () {
                setState(() {
                  medication == TagStatus.active
                      ? medication = TagStatus.notActive
                      : medication = TagStatus.active;
                });
              },
              status: medication,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.021),
            Tags(
              text: 'Testing',
              onPress: () {
                setState(() {
                  testing == TagStatus.active
                      ? testing = TagStatus.notActive
                      : testing = TagStatus.active;
                });
              },
              status: testing,
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
                setState(() {
                  sold == TagStatus.active
                      ? sold = TagStatus.notActive
                      : sold = TagStatus.active;
                });
              },
              status: sold,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.021),
            Tags(
              text: 'Dead',
              onPress: () {
                setState(() {
                  dead == TagStatus.active
                      ? dead = TagStatus.notActive
                      : dead = TagStatus.active;
                });
              },
              status: dead,
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
                  setState(() {
                    borrowed = TagStatus.notActive;
                    adopted = TagStatus.notActive;
                    donated = TagStatus.notActive;
                    escaped = TagStatus.notActive;
                    stolen = TagStatus.notActive;
                    transferred = TagStatus.notActive;
                    injured = TagStatus.notActive;
                    sick = TagStatus.notActive;
                    quarantined = TagStatus.notActive;
                    medication = TagStatus.notActive;
                    testing = TagStatus.notActive;
                    sold = TagStatus.notActive;
                    dead = TagStatus.notActive;
                  });
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
