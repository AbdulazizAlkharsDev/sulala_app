import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:sulala_app/src/widgets/pages/main_widgets/navigation_bar.dart';
import 'package:sulala_app/test/guest_mode_tutorial.dart';
import '../src/theme/colors/colors.dart';
import '../src/theme/fonts/fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading =
      true; // Set this to false when you want to hide the loading indicator

  @override
  void initState() {
    super.initState();

    // Simulate loading for 2 seconds (you can adjust this duration)
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false; // Hide the loading indicator
      });

      // After the delay, navigate to the Home Page Based on the user Auth
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ShowCaseWidget(
            builder: Builder(
              builder: (context) => const GuestModeTutorial(),
            ),
            onFinish: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const MyAppHomePage()),
              );
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double heightMediaQuery = MediaQuery.of(context).size.height / 812;
    double widthMediaQuery = MediaQuery.of(context).size.width / 375;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: 375 * widthMediaQuery,
              child: Padding(
                padding: EdgeInsets.fromLTRB(24 * widthMediaQuery,
                    50 * heightMediaQuery, 24 * widthMediaQuery, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50 * heightMediaQuery,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/graphic/Logotype.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    SizedBox(
                      height: 125 * heightMediaQuery,
                    ),
                    Text(
                      'Stay Connected',
                      style: AppFonts.title2(color: AppColors.grayscale90),
                    ),
                    Text(
                      'to your beloved animals',
                      style: AppFonts.headline1(color: AppColors.grayscale90),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/graphic/Splash_p.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
