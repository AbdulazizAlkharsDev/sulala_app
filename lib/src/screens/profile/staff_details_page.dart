import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/navigate_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/secondary_button.dart';
import 'package:sulala_app/src/widgets/inputs/draw_ups/draw_up_widget.dart';
import 'package:sulala_app/src/widgets/lists/table_lsit/table_clickable_link.dart';
import 'package:sulala_app/src/screens/profile/list_of_staff.dart';
import 'package:sulala_app/src/widgets/other/custom_snack_bar.dart';
import 'package:sulala_app/src/screens/profile/manage_permissions.dart';

class StaffDetailsPage extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String email;
  final String phoneNumber;

  const StaffDetailsPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.email,
    required this.phoneNumber,
  });

  @override
  State<StaffDetailsPage> createState() => _StaffDetailsPageState();
}

class _StaffDetailsPageState extends State<StaffDetailsPage> {
  bool isViewOnlySelected = true;
  bool isCanEditSelected = false;
  bool isWorkerSelected = false;
  bool isGeneralInfoSelected = false;
  bool isBreedingInfoSelected = false;
  bool isMedicalInfoSelected = false;

  void updatePermissions({
    bool? isViewOnlySelected,
    bool? isCanEditSelected,
    bool? isWorkerSelected,
    bool? isGeneralInfoSelected,
    bool? isBreedingInfoSelected,
    bool? isMedicalInfoSelected,
  }) {
    setState(() {
      this.isViewOnlySelected = isViewOnlySelected!;
      this.isCanEditSelected = isCanEditSelected!;
      this.isWorkerSelected = isWorkerSelected!;
      this.isGeneralInfoSelected = isGeneralInfoSelected!;
      this.isBreedingInfoSelected = isBreedingInfoSelected!;
      this.isMedicalInfoSelected = isMedicalInfoSelected!;
    });
  }

  @override
  Widget build(BuildContext context) {
    double heightMediaQuery = MediaQuery.of(context).size.height / 812;
    double widthMediaQuery = MediaQuery.of(context).size.width / 375;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Member Of Your Staff',
            style: AppFonts.headline3(color: AppColors.grayscale90),
          ),
          leading: IconButton(
            padding: EdgeInsets.zero,
            icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.grayscale10,
                ),
                child:
                    const Icon(Icons.arrow_back, color: AppColors.grayscale90)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 6.0 * widthMediaQuery),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.grayscale10,
                  ),
                  child: const Icon(
                    Icons.delete_outline_rounded,
                    color: AppColors.error100,
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    isScrollControlled: true,
                    isDismissible: true,
                    builder: (BuildContext context) {
                      return DrowupWidget(
                        heightFactor: 0.4,
                        heading: 'Delete Member?',
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Delete ',
                                    style: AppFonts.body2(
                                        color: AppColors.grayscale90),
                                  ),
                                  TextSpan(
                                    text: widget.title,
                                    style: AppFonts.body1(
                                        color: AppColors.primary30),
                                  ),
                                  TextSpan(
                                    text:
                                        ' from your staffs?\nThis action cannot be undone',
                                    style: AppFonts.body2(
                                        color: AppColors.grayscale90),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 32 * heightMediaQuery,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 52 * heightMediaQuery,
                              child: NavigateButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ListOfStaff(), // Replace with the appropriate StaffListPage widget
                                    ),
                                  );
                                  CustomSnackBar.show(
                                    context,
                                    'Member was Deleted',
                                    Icons.check_circle_rounded,
                                    color: AppColors.primary10,
                                  );
                                },
                                text: 'Delete',
                              ),
                            ),
                            SizedBox(
                              height: 8 * heightMediaQuery,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 52 * heightMediaQuery,
                              child: SecondaryButton(
                                onPressed: () {},
                                text: 'Cancel',
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                right: 16.0 * widthMediaQuery, left: 16.0 * widthMediaQuery),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 44 * heightMediaQuery),
                Center(
                  child: CircleAvatar(
                    radius: 60 * widthMediaQuery,
                    backgroundImage: AssetImage(widget.imagePath),
                  ),
                ),
                SizedBox(height: 16 * heightMediaQuery),
                Center(
                  child: Text(
                    widget.title,
                    style: AppFonts.title4(color: AppColors.grayscale90),
                  ),
                ),
                Center(
                  child: Text(
                    widget.email,
                    style: AppFonts.body2(color: AppColors.grayscale70),
                  ),
                ),
                SizedBox(
                  height: 32 * heightMediaQuery,
                ),
                Text(
                  'Member Permissions',
                  style: AppFonts.title5(color: AppColors.grayscale90),
                ),
                SizedBox(
                  height: 14 * heightMediaQuery,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Access level',
                        style: AppFonts.body2(color: AppColors.grayscale70),
                      ),
                      Text(
                        widget.subtitle,
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32 * heightMediaQuery,
                ),
                Text(
                  'Contact Details',
                  style: AppFonts.title5(color: AppColors.grayscale90),
                ),
                SizedBox(
                  height: 14 * heightMediaQuery,
                ),
                TableClickableText(
                  iconPath: 'assets/icons/frame/24px/Outlined_Phone.png',
                  text1: 'Phone Number',
                  url: widget.phoneNumber,
                  urlText: widget.phoneNumber,
                ),
                SizedBox(
                  height: 20 * heightMediaQuery,
                ),
                TableClickableText(
                  iconPath: 'assets/icons/frame/24px/16_Mail.png',
                  text1: 'Email Address',
                  url: widget.email,
                  urlText: widget.email,
                ),
                SizedBox(
                  height: 35 * heightMediaQuery,
                ),
                Text(
                  'Address',
                  style: AppFonts.title5(color: AppColors.grayscale90),
                ),
                SizedBox(
                  height: 14 * heightMediaQuery,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Address',
                    style: AppFonts.body2(color: AppColors.grayscale70),
                  ),
                  trailing: Text(
                    'United Arab Emirates',
                    style: AppFonts.body2(color: AppColors.grayscale90),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          width: 343 * widthMediaQuery,
          height: 52 * heightMediaQuery,
          child: PrimaryButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManagePermissions(
                      onPermissionsChanged: updatePermissions,
                    ),
                  ),
                );
              },
              text: 'Manage Permissions'),
        ),
      ),
    );
  }
}
