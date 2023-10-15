import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import '../src/theme/colors/colors.dart';
import '../src/theme/fonts/fonts.dart';
import '../src/widgets/controls_and_buttons/buttons/primary_button.dart';
import '../src/widgets/controls_and_buttons/text_buttons/primary_textbutton.dart';
import '../src/widgets/pages/homepage_widgets/card.dart';
import '../src/widgets/pages/homepage_widgets/title_text.dart';

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ShowCaseWidget.of(context).startShowCase(
        [_findAnimals, _findFarms, _joinNow, _signIn],
      );
    });
  }

  void _cancelShowcase() {
    ShowCaseWidget.of(context).dismiss();
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
                  onTap: () {
                    _cancelShowcase();
                  },
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
        padding: EdgeInsets.all(16 * heightMediaQuery),
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
            SizedBox(height: 107 * heightMediaQuery),
            const TitleText(
                text: 'Want to start your farm\nright now and join?'),
            SizedBox(height: 24 * heightMediaQuery),
            Showcase(
              key: _joinNow,
              description: 'Join the App',
              targetPadding: EdgeInsets.fromLTRB(
                  50 * widthMediaQuery,
                  25 * heightMediaQuery,
                  50 * widthMediaQuery,
                  25 * heightMediaQuery),
              targetShapeBorder: const CircleBorder(),
              tooltipBackgroundColor: Colors.transparent,
              descTextStyle: AppFonts.headline1(color: AppColors.grayscale00),
              child: SizedBox(
                height: 52 * heightMediaQuery,
                width: 108 * heightMediaQuery,
                child: PrimaryButton(
                  text: 'Join now',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/join_now');
                  },
                  status: PrimaryButtonStatus.idle,
                ),
              ),
            ),
            SizedBox(height: 8 * heightMediaQuery),
            Showcase(
              targetPadding: EdgeInsets.fromLTRB(
                  50 * widthMediaQuery,
                  25 * heightMediaQuery,
                  50 * widthMediaQuery,
                  25 * heightMediaQuery),
              targetShapeBorder: const CircleBorder(),
              tooltipBackgroundColor: Colors.transparent,
              descTextStyle: AppFonts.headline1(color: AppColors.grayscale00),
              key: _signIn,
              description: 'Sign in',
              child: TextButton(
                onPressed: () {
                  // Handle text button press
                },
                child: PrimaryTextButton(
                  status: TextStatus.idle,
                  text: 'Sign in',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/sign_in');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
