import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:sulala_app/test/GuestHomePage.dart';
import '../src/theme/colors/colors.dart';
import '../src/theme/fonts/fonts.dart';
import '../src/widgets/pages/homepage_widgets/card.dart';

class GuestModeTutorial extends StatefulWidget {
  const GuestModeTutorial({super.key});

  @override
  State<GuestModeTutorial> createState() => _GuestModeTutorial();
}

class _GuestModeTutorial extends State<GuestModeTutorial> {
  final GlobalKey _findAnimals = GlobalKey();
  final GlobalKey _findFarms = GlobalKey();
  final GlobalKey _joinNow = GlobalKey();
  final GlobalKey _signIn = GlobalKey();
  final GlobalKey _next1 = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ShowCaseWidget.of(context).startShowCase(
            [_findAnimals, _findFarms, _joinNow, _signIn, _next1]));
  }

  @override
  Widget build(BuildContext context) {
    double heightMediaQuery = MediaQuery.of(context).size.height / 812;
    double widthMediaQuery = MediaQuery.of(context).size.width / 375;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome',
              style: AppFonts.title3(color: AppColors.grayscale100),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/search');
                  },
                  child: const Image(
                    image:
                        AssetImage('assets/icons/frame/24px/Icon-button.png'),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.0097),
                InkWell(
                  onTap: () {},
                  child: const Image(
                    image:
                        AssetImage('assets/icons/frame/24px/Icon-button1.png'),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(24 * heightMediaQuery),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Showcase(
                    targetPadding: EdgeInsets.fromLTRB(
                        50 * widthMediaQuery,
                        25 * heightMediaQuery,
                        50 * widthMediaQuery,
                        25 * heightMediaQuery),
                    targetShapeBorder: const CircleBorder(),
                    key: _findAnimals,
                    tooltipBackgroundColor: Colors.transparent,
                    descTextStyle:
                        AppFonts.headline1(color: AppColors.grayscale00),
                    description:
                        'Here you can find information about animals and their breeds',
                    child: CardWidget(
                      color: const Color.fromRGBO(225, 236, 185, 1),
                      iconPath: 'assets/icons/frame/24px/Cow_Icon.png',
                      title: 'Searching\nfor animals?',
                      buttonText: 'Find animals',
                      onPressed: () {
                        Navigator.of(context).pushNamed('/search_animals');
                      },
                    ),
                  ),
                ),
                SizedBox(width: 13 * widthMediaQuery),
                Expanded(
                  child: Showcase(
                    targetPadding: EdgeInsets.fromLTRB(
                        50 * widthMediaQuery,
                        25 * heightMediaQuery,
                        50 * widthMediaQuery,
                        25 * heightMediaQuery),
                    targetShapeBorder: const CircleBorder(),
                    key: _findFarms,
                    tooltipBackgroundColor: Colors.transparent,
                    descTextStyle:
                        AppFonts.headline1(color: AppColors.grayscale00),
                    description:
                        "Here You Can Find Another Person's Farm, View Information About It & Join It After Registration.",
                    child: CardWidget(
                      color: const Color.fromRGBO(246, 239, 205, 1),
                      iconPath: 'assets/icons/frame/24px/Farm_house.png',
                      title: 'Searching \nfor farm?',
                      buttonText: 'Find farms',
                      onPressed: () {
                        Navigator.of(context).pushNamed('/search_house_farm');
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 120),
            const Text(
              'Want To Start Your Farm\n Right Now & Join',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Showcase(
              key: _joinNow,
              description: 'Join The Farms',
              tooltipBackgroundColor: const Color.fromARGB(255, 36, 86, 38),
              descTextStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              targetPadding: const EdgeInsets.all(5),
              targetBorderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 36, 86,
                      38), // Set the background color of the button
                ),
                onPressed: () {},
                child: const Text(
                  'Join Now',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16), // Set the text color of the button
                ),
              ),
            ),
            const SizedBox(height: 20),
            Showcase(
              key: _signIn,
              description: 'Sign In By Clicking This',
              descTextStyle: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 36, 86, 38),
                  fontWeight: FontWeight.bold),
              child: TextButton(
                onPressed: () {
                  // Handle text button press
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 36, 86, 38),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Showcase(
        key: _next1,
        targetPadding: EdgeInsets.all(5),
        targetBorderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        description: 'Click Here To Go To Next Page Tutorial',
        descTextStyle: const TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 36, 86, 38),
            fontWeight: FontWeight.bold),
        onTargetClick: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) =>
          //         const RegHomeScreenTutorial(), // Replace with your desired page.
          //   ),
          // );
        },
        disposeOnTap: true,
        child: Container(
          height: 70,
          width: 100,
          child: FloatingActionButton(
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) =>
              //         const RegHomeScreenTutorial(), // Replace with your desired page.
              //   ),
              // );
            },
            backgroundColor: Colors.white,
            elevation: 10,
            shape: const CircleBorder(),
            child: const Icon(
              Icons.arrow_right_alt,
              size: 54,
            ),
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
