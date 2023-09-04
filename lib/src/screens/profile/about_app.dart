import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({super.key});

  @override
  State<AboutApp> createState() => _AboutApp();
}

class _AboutApp extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    double heightMediaQuery = MediaQuery.of(context).size.height / 812;
    double widthMediaQuery = MediaQuery.of(context).size.width / 375;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'About App',
            style: AppFonts.headline3(color: AppColors.grayscale90),
          ),
          leading: IconButton(
            padding: EdgeInsets.zero,
            icon: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.grayscale10,
              ),
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.grayscale90,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: 16 * widthMediaQuery,
                right: 16 * widthMediaQuery,
                top: 24 * heightMediaQuery),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 120 * widthMediaQuery,
                    height: 120 * widthMediaQuery,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 227, 227, 227),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        'LOGO',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16 * heightMediaQuery),
                Center(
                  child: Text('Version Of The App: 0.1.12',
                      style: AppFonts.body2(color: AppColors.grayscale70)),
                ),
                SizedBox(
                  height: 32 * heightMediaQuery,
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.grayscale20,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Terms & Conditions',
                      style: AppFonts.body2(color: AppColors.grayscale90),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      size: 30,
                      color: AppColors.grayscale50,
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Privacy Policy',
                    style: AppFonts.body2(color: AppColors.grayscale90),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right_rounded,
                    size: 30,
                    color: AppColors.grayscale50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
