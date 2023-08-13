import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/icon_secondary_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/secondary_button.dart';
import 'package:sulala_app/src/widgets/inputs/draw_ups/draw_up_widget.dart';
import 'package:sulala_app/src/widgets/lists/table_lsit/table_clickable_link.dart';
import 'package:sulala_app/src/widgets/other/two_information_block.dart';

class UserDetails extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String email;
  final String phoneNumber;

  const UserDetails({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.email,
    required this.phoneNumber,
  });

  @override
  State<UserDetails> createState() => _SearchDetails();
}

class _SearchDetails extends State<UserDetails> {
  bool isHelperSelected = false;
  bool isWorkerSelected = false;
  bool isViewOnlySelected = true;
  bool isCanEditSelected = false;
  bool showList = false;
  bool isGeneralInfoSelected = false;
  bool isBreedingInfoSelected = false;
  bool isMedicalInfoSelected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            color: AppColors.grayscale90,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.042,
            0,
            MediaQuery.of(context).size.width * 0.042,
            0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.029,
                ),
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: MediaQuery.of(context).size.width * 0.16,
                    backgroundImage: AssetImage(widget.imagePath),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.019,
                ),
                Text(
                  widget.title,
                  style: AppFonts.title4(color: AppColors.grayscale90),
                ),
                Text(
                  widget.email,
                  style: AppFonts.body2(color: AppColors.primary30),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.019,
                ),
                Text(
                  'House Farm',
                  style: AppFonts.body2(color: AppColors.grayscale70),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.029,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: IconSecondaryButton(
                          iconPath:
                              'assets/icons/frame/24px/20_Status-farm.png',
                          onPressed: () {
                            _showFilterModalSheet(context);
                          },
                          text: "Join farm",
                          status: SecondaryIconStatus.idle,
                        ),
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        // width: MediaQuery.of(context).size.width * 0.42,
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: IconSecondaryButton(
                          iconPath:
                              'assets/icons/frame/24px/Outlined_Cow_green_icon.png',
                          onPressed: () {
                            Navigator.pushNamed(context, '/search_house_farm');
                          },
                          text: "View animals",
                          status: SecondaryIconStatus.idle,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                const TwoInformationBlock(head1: '24', head2: '4'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Details',
                      style: AppFonts.title5(
                        color: AppColors.grayscale90,
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.017),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: TableClickableText(
                        text1: 'Phone number',
                        urlText: widget.phoneNumber,
                        url: '',
                        iconPath: 'assets/icons/frame/24px/Outlined_Phone.png',
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: TableClickableText(
                        text1: 'Email address',
                        urlText: widget.email,
                        url: '',
                        iconPath: 'assets/icons/frame/24px/16_Mail.png',
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.065),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          height: MediaQuery.of(context).size.height * 0.064,
          width: MediaQuery.of(context).size.width * 0.4,
          child: PrimaryButton(
            text: "Start your farm",
            onPressed: () {},
            status: PrimaryButtonStatus.idle,
            position: PrimaryButtonPosition.primary,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  void _showFilterModalSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return Container(
          color: Colors.transparent,
          child: DrowupWidget(
            heightFactor: 0.46,
            // heading: 'Filter',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Image(
                      image: AssetImage('assets/illustrations/farm_gray.png')),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.029,
                ),
                Text(
                  'Join this farm?',
                  style: AppFonts.title3(color: AppColors.grayscale90),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.019),
                Text(
                  "If you join ${widget.title}, you won't be able to create your own farm.",
                  style: AppFonts.body2(color: AppColors.grayscale70),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.029),
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
                        text: "Cancel",
                        status: SecondaryButtonStatus.idle,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.064,
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: PrimaryButton(
                        onPressed: () {},
                        text: "Join farm",
                        status: PrimaryButtonStatus.idle,
                      ),
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
