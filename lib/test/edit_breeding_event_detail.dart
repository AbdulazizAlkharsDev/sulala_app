import 'package:flutter/material.dart';
import 'package:sulala_app/src/screens/breeding/list_of_breeding_events.dart';
import 'package:sulala_app/src/screens/breeding/search_children.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/navigate_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/text_buttons/primary_textbutton.dart';
import '../src/theme/colors/colors.dart';
import '../src/theme/fonts/fonts.dart';
import '../src/widgets/inputs/date_fields/primary_date_field.dart';
import '../src/widgets/inputs/paragraph_text_fields/paragraph_text_field.dart';
import '../src/widgets/inputs/text_fields/primary_text_field.dart';

class EditBreedingEventDetails extends StatefulWidget {
  final BreedingEventVariables
      breedingEvent; // Event selected in the SecondPage

  const EditBreedingEventDetails({
    super.key,
    required this.breedingEvent,
  });

  @override
  State<EditBreedingEventDetails> createState() =>
      _EditBreedingEventDetailsState();
}

class _EditBreedingEventDetailsState extends State<EditBreedingEventDetails> {
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16 * widthMediaQuery),
        child: SingleChildScrollView(
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
              PrimaryTextField(
                controller: TextEditingController(
                    text: widget.breedingEvent.eventNumber),
                hintText: 'Edit Breeding Event',
                labelText: 'Breeding Event',
              ),
              SizedBox(
                height: 26 * heightMediaQuery,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Breeding ID',
                    style: AppFonts.body2(color: AppColors.grayscale70),
                  ),
                  Text(
                    '001-1',
                    style: AppFonts.body2(color: AppColors.grayscale90),
                  ),
                ],
              ),
              SizedBox(
                height: 6 * heightMediaQuery,
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
              SizedBox(
                height: 6 * heightMediaQuery,
              ),
              PrimaryDateField(
                labelText: 'Breeding Date',
                hintText: widget.breedingEvent.breedingDate.isNotEmpty
                    ? widget.breedingEvent.breedingDate
                    : "DD/MM/YYYY",
                onChanged: (value) {
                  setState(() {
                    widget.breedingEvent.breedingDate;
                  });
                },
              ),
              SizedBox(
                height: 20 * heightMediaQuery,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery Date',
                    style: AppFonts.body2(color: AppColors.grayscale70),
                  ),
                  widget.breedingEvent.deliveryDate.isEmpty
                      ? Text(
                          'No Date Added',
                          style: AppFonts.body2(color: AppColors.grayscale90),
                        )
                      : Text(
                          widget.breedingEvent.deliveryDate,
                          style: AppFonts.body2(color: AppColors.grayscale90),
                        ),
                ],
              ),
              SizedBox(
                height: 34 * heightMediaQuery,
              ),
              Text(
                "Children",
                style: AppFonts.title5(color: AppColors.grayscale90),
              ),
              SizedBox(
                height: 16 * heightMediaQuery,
              ),
              widget.breedingEvent.children.isEmpty
                  ? Column(
                      children: [
                        SizedBox(
                          height: 8 * heightMediaQuery,
                        ),
                        Center(
                            child: Image.asset(
                                'assets/illustrations/cow_childx.png')),
                      ],
                    )
                  : ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {
                        // Add your onPressed functionality here
                      },
                      leading: CircleAvatar(
                        radius: 24 * widthMediaQuery,
                        backgroundColor: Colors.black,
                      ),
                      title: Text(
                        'Hello',
                        // widget.breedingEvent.children,
                        style: AppFonts.headline3(color: AppColors.grayscale90),
                      ),
                      subtitle: Text(
                        'Age',
                        style: AppFonts.body2(color: AppColors.grayscale70),
                      ),
                      trailing: Text(
                        'ID#090909',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                    ),
              SizedBox(height: 16 * heightMediaQuery),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const SearchChildren()),
                  );
                },
                child: Row(
                  children: [
                    const PrimaryTextButton(
                      status: TextStatus.idle,
                      text: 'Add Children',
                    ),
                    SizedBox(
                      width: 8 * widthMediaQuery,
                    ),
                    Icon(
                      Icons.add_rounded,
                      color: AppColors.primary40,
                      size: 20 * widthMediaQuery,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24 * heightMediaQuery,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notes",
                    style: AppFonts.title5(color: AppColors.grayscale90),
                  ),
                  InkWell(
                      onTap: () {},
                      child: Image.asset('assets/icons/frame/24px/24_Edit.png'))
                ],
              ),
              SizedBox(
                height: 16 * heightMediaQuery,
              ),
              ParagraphTextField(
                hintText: 'Add Notes',
                maxLines: 6,
                onChanged: (value) {
                  setState(() {
                    TextEditingController(text: 'the notes');
                  });
                },
              ),
              SizedBox(
                height: 100 * heightMediaQuery,
              ),
              SizedBox(
                height: 52 * heightMediaQuery,
                width: 343 * widthMediaQuery,
                child: PrimaryButton(
                  text: 'Save Changes',
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 8 * heightMediaQuery,
              ),
              SizedBox(
                height: 52 * heightMediaQuery,
                width: 343 * widthMediaQuery,
                child: NavigateButton(
                  text: 'Delete Event',
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 16 * heightMediaQuery,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
