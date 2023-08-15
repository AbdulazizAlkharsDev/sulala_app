import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/text_buttons/primary_textbutton.dart';
import '../../widgets/controls_and_buttons/buttons/primary_button.dart';
import '../../widgets/pages/homepage_widgets/card.dart';
import '../../widgets/pages/homepage_widgets/circle_icon_button.dart';
import '../../widgets/pages/homepage_widgets/title_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.867,
            child: Stack(
              children: [
                // Background Image (Bottom Sheet)
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.07,
                  left: MediaQuery.of(context).size.width * 0.6,
                  right: MediaQuery.of(context).size.width * 0.05,
                  child: Image.asset(
                    'assets/illustrations/cow_eating.png',
                    fit: BoxFit.fill,
                  ),
                ),
                // Content
                Padding(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.width * 0.0426),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Welcome',
                            style:
                                AppFonts.title3(color: AppColors.grayscale100),
                          ),
                          Row(
                            children: [
                              CircleIconButton(
                                icon: Icons.search,
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/search');
                                },
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.0097),
                              CircleIconButton(
                                icon: Icons.notifications_outlined,
                                onPressed: () {
                                  // Handle notifications button press
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0168),
                      Row(
                        children: [
                          Expanded(
                            child: CardWidget(
                              color: const Color.fromRGBO(225, 236, 185, 1),
                              iconPath: 'assets/icons/frame/24px/Cow_Icon.png',
                              title: 'Searching\nfor animals?',
                              buttonText: 'Find animals',
                              onPressed: () {
                                // Handle button press
                                // print('Find animals');
                              },
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.015),
                          Expanded(
                            child: CardWidget(
                              color: const Color.fromRGBO(246, 239, 205, 1),
                              iconPath:
                                  'assets/icons/frame/24px/Farm_house.png',
                              title: 'Searching \nfor farm?',
                              buttonText: 'Find farms',
                              onPressed: () {
                                // Handle button press
                                // print('Find farms');
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.135),
                      const TitleText(
                          text: 'Want to start your farm\nright now and join?'),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.288,
                        child: PrimaryButton(
                          text: 'Join now',
                          onPressed: () {
                            Navigator.of(context).pushNamed('/join_now');
                          },
                          status: PrimaryButtonStatus.idle,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.011),
                      PrimaryTextButton(
                        status: TextStatus.idle,
                        text: 'Sign in',
                        onPressed: () {
                          // print("Sign In");
                        },
                      ),
                    ],
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
