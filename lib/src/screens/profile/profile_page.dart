import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/src/widgets/other/three_information_block.dart';
import 'package:sulala_app/test/about_app.dart';
import 'package:sulala_app/test/app_setting.dart';
import 'package:sulala_app/test/customer_support.dart';
import 'package:sulala_app/src/screens/profile/edit_profile_information.dart';
import 'package:sulala_app/test/list_of_staff.dart';
import 'package:sulala_app/test/notifications_pause.dart';
import 'package:sulala_app/test/privacy_security.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profile',
          style: AppFonts.title3(color: AppColors.grayscale90),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfileInformation(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: (16 * MediaQuery.of(context).size.width) / 375,
                  right: (16 * MediaQuery.of(context).size.width) / 375),
              child: Column(
                children: [
                  SizedBox(
                    height: (40 * MediaQuery.of(context).size.height) / 812,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: (60 * MediaQuery.of(context).size.width) / 375,
                    backgroundImage:
                        const AssetImage('assets/avatars/120px/Staff1.png'),
                  ),
                  SizedBox(
                    height: (16 * MediaQuery.of(context).size.height) / 812,
                  ),
                  Text(
                    'John Smith',
                    style: AppFonts.title4(color: AppColors.grayscale90),
                  ),
                  Text(
                    '123-456-7890',
                    style: AppFonts.body2(color: AppColors.grayscale70),
                  ),
                  SizedBox(
                      height: (16 * MediaQuery.of(context).size.height) / 812),
                  Text(
                    'Head of Farm',
                    style: AppFonts.body2(color: AppColors.grayscale70),
                  ),
                  SizedBox(
                      height: (32 * MediaQuery.of(context).size.height) / 812),
                  SizedBox(
                    height: (40 * MediaQuery.of(context).size.height) / 812,
                    child: PrimaryButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListOfStaff()),
                        );
                        // Add function of the button below
                      },
                      text: 'Collaboration',
                      position: PrimaryButtonPosition.right,
                    ),
                  ),
                  SizedBox(
                      height: (24 * MediaQuery.of(context).size.height) / 812),
                  const ThreeInformationBlock(
                    head1: '24',
                    head2: '1',
                    head3: '4',
                  ),
                  SizedBox(
                      height: (24 * MediaQuery.of(context).size.height) / 812),
                ],
              ),
            ),
            Container(
              height: 12,
              color: AppColors.grayscale10,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: (16 * MediaQuery.of(context).size.width) / 375,
                  right: (16 * MediaQuery.of(context).size.width) / 375),
              child: Column(
                children: [
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        padding: EdgeInsets.all(
                            (6 * MediaQuery.of(context).size.width) / 375),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grayscale0,
                        ),
                        child: const Icon(
                          Icons.person_outline_rounded,
                          color: AppColors.primary30,
                        ),
                      ),
                      title: Text(
                        'Accounts',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           const AuthorizationMethodsPage()),
                        // );
                      }),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        padding: EdgeInsets.all(
                            (6 * MediaQuery.of(context).size.width) / 375),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grayscale0,
                        ),
                        child: const Icon(
                          Icons.payment_rounded,
                          color: AppColors.primary30,
                        ),
                      ),
                      title: Text(
                        'Payment Methods',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const PaymentPage()),
                        // );
                      }),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        padding: EdgeInsets.all(
                            (6 * MediaQuery.of(context).size.width) / 375),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grayscale0,
                        ),
                        child: const Icon(
                          Icons.star_outline_rounded,
                          color: AppColors.primary30,
                        ),
                      ),
                      title: Text(
                        'Subscriptions',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => SubscriptionPage()),
                        // );
                      }),
                ],
              ),
            ),
            Container(
              height: 12,
              color: AppColors.grayscale10,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: (16 * MediaQuery.of(context).size.width) / 375,
                  right: (16 * MediaQuery.of(context).size.width) / 375),
              child: Column(
                children: [
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        padding: EdgeInsets.all(
                            (6 * MediaQuery.of(context).size.width) / 375),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grayscale0,
                        ),
                        child: const Icon(
                          Icons.notifications_outlined,
                          color: AppColors.primary30,
                        ),
                      ),
                      title: Text(
                        'Notifications',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const NotificationSettingsPage()),
                        );
                      }),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        padding: EdgeInsets.all(
                            (6 * MediaQuery.of(context).size.width) / 375),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grayscale0,
                        ),
                        child: const Icon(
                          Icons.lock_outline,
                          color: AppColors.primary30,
                        ),
                      ),
                      title: Text(
                        'Privacy and Security',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PrivacySecurityPage()),
                        );
                      }),
                ],
              ),
            ),
            Container(
              height: 12,
              color: AppColors.grayscale10,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: (16 * MediaQuery.of(context).size.width) / 375,
                  right: (16 * MediaQuery.of(context).size.width) / 375),
              child: Column(
                children: [
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        padding: EdgeInsets.all(
                            (6 * MediaQuery.of(context).size.width) / 375),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grayscale0,
                        ),
                        child: const Icon(
                          Icons.settings_outlined,
                          color: AppColors.primary30,
                        ),
                      ),
                      title: Text(
                        'App Settings',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AppSettings()),
                        );
                      }),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        padding: EdgeInsets.all(
                            (6 * MediaQuery.of(context).size.width) / 375),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grayscale0,
                        ),
                        child: const Icon(
                          Icons.warning_amber_rounded,
                          color: AppColors.primary30,
                        ),
                      ),
                      title: Text(
                        'About App',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutApp()),
                        );
                      }),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                          padding: EdgeInsets.all(
                              (6 * MediaQuery.of(context).size.width) / 375),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.grayscale0,
                          ),
                          child: const Icon(Icons.contact_support_outlined,
                              color: AppColors.primary30)),
                      title: Text(
                        'Customer Support',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CustomerSupport()),
                        );
                      }),
                ],
              ),
            ),
            Container(
              height: 12,
              color: AppColors.grayscale10,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: (16 * MediaQuery.of(context).size.width) / 375,
                  right: (16 * MediaQuery.of(context).size.width) / 375),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      padding: EdgeInsets.all(
                          (6 * MediaQuery.of(context).size.width) / 375),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.grayscale0,
                      ),
                      child: const Icon(Icons.logout_rounded,
                          color: AppColors.grayscale90),
                    ),
                    title: Text(
                      'Sign Out',
                      style: AppFonts.body2(color: AppColors.error100),
                    ),
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Sign Out?',
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 25),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: const Color.fromARGB(
                                          255, 232, 232, 232),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    child: const Text(
                                      'Yes',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: const Color.fromARGB(
                                          255, 232, 232, 232),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 12,
              color: AppColors.grayscale10,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
