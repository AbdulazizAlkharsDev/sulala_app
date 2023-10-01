import 'package:flutter/material.dart';
import 'package:sulala_app/src/screens/breeding/list_of_breeding_events.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/text_buttons/primary_textbutton.dart';

import '../src/theme/colors/colors.dart';
import '../src/theme/fonts/fonts.dart';

class BreedingEventDetails extends StatefulWidget {
  final BreedingEventVariables
      breedingEvent; // Event selected in the SecondPage

  const BreedingEventDetails({
    super.key,
    required this.breedingEvent,
  });

  @override
  State<BreedingEventDetails> createState() => _BreedingEventDetailsState();
}

class _BreedingEventDetailsState extends State<BreedingEventDetails> {
  @override
  Widget build(BuildContext context) {
    double heightMediaQuery = MediaQuery.of(context).size.height / 812;
    double widthMediaQuery = MediaQuery.of(context).size.width / 375;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Harry',
          style: AppFonts.headline3(color: AppColors.grayscale90),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grayscale10,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              // Handle edit button tap
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.grayscale10,
                ),
                child: const Image(
                  image: AssetImage(
                      'assets/icons/frame/24px/edit_icon_button.png'),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16 * widthMediaQuery),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.breedingEvent.eventNumber,
              style: AppFonts.title3(
                color: AppColors.grayscale90,
              ),
            ),
            SizedBox(
              height: 24 * heightMediaQuery,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Text(
                'Breeding ID',
                style: AppFonts.body2(color: AppColors.grayscale70),
              ),
              trailing: Text(
                '001-1',
                style: AppFonts.body2(color: AppColors.grayscale90),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sire (Father)',
                  style: AppFonts.body2(color: AppColors.grayscale70),
                ),
                PrimaryTextButton(
                  text: '${widget.breedingEvent.sire} (ID Needed)',
                  onPressed: () {},
                  position: TextButtonPosition.right,
                  status: TextStatus.idle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dam (Mother)',
                  style: AppFonts.body2(color: AppColors.grayscale70),
                ),
                PrimaryTextButton(
                  text: '${widget.breedingEvent.sire} (ID Needed)',
                  onPressed: () {},
                  position: TextButtonPosition.right,
                  status: TextStatus.idle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Breeding Partner',
                  style: AppFonts.body2(color: AppColors.grayscale70),
                ),
                PrimaryTextButton(
                  text: '${widget.breedingEvent.sire} (ID Needed)',
                  onPressed: () {},
                  position: TextButtonPosition.right,
                  status: TextStatus.idle,
                ),
              ],
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Text(
                'Breeding Date',
                style: AppFonts.body2(color: AppColors.grayscale70),
              ),
              trailing: widget.breedingEvent.breedingDate.isEmpty
                  ? Text(
                      'No Date Added',
                      style: AppFonts.body2(color: AppColors.grayscale90),
                    )
                  : Text(
                      widget.breedingEvent.breedingDate,
                      style: AppFonts.body2(color: AppColors.grayscale90),
                    ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Text(
                'Breeding Date',
                style: AppFonts.body2(color: AppColors.grayscale70),
              ),
              trailing: widget.breedingEvent.deliveryDate.isEmpty
                  ? Text(
                      'No Date Added',
                      style: AppFonts.body2(color: AppColors.grayscale90),
                    )
                  : Text(
                      widget.breedingEvent.deliveryDate,
                      style: AppFonts.body2(color: AppColors.grayscale90),
                    ),
            ),

            SizedBox(
              height: 15,
            ),
            const Text(
              "Children",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              onTap: () {
                // Add your onPressed functionality here
              },
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 36, 86, 38),
                child: Text(
                  '${widget.breedingEvent.children}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              title: Text(
                '${widget.breedingEvent.children}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Age',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                'ID',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            const Text(
              "Notes",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              ('${widget.breedingEvent.notes}'),
              style: TextStyle(
                fontSize: 20,
              ),
            ),

            // Display the selected event details separately
          ],
        ),
      ),
    );
  }
}
