import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/text_buttons/primary_textbutton.dart';
import '../widgets/controls_and_buttons/buttons/primary_button.dart';
import '../widgets/pages/homepage_widgets/card.dart';
import '../widgets/pages/homepage_widgets/circle_icon_button.dart';
import '../widgets/pages/homepage_widgets/title_text.dart';

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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome',
                    style: AppFonts.title3(color: AppColors.grayscale100),
                  ),
                  Row(
                    children: [
                      CircleIconButton(
                        icon: Icons.search,
                        onPressed: () {
                          // Handle search button press
                        },
                      ),
                      const SizedBox(width: 4),
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
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CardWidget(
                      color: const Color.fromRGBO(225, 236, 185, 1),
                      iconPath: 'assets/icons/frame/24px/Cow_Icon.png',
                      title: 'Searching',
                      subtitle: 'for animals?',
                      buttonText: 'Find animals',
                      onPressed: () {
                        // Handle button press
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CardWidget(
                      color: const Color.fromRGBO(246, 239, 205, 1),
                      iconPath: 'assets/icons/frame/24px/Farm_Icon.png',
                      title: 'Search for',
                      subtitle: 'farms?',
                      buttonText: 'Find farms',
                      onPressed: () {
                        // Handle button press
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            const TitleText(text: 'Want to start your farm'),
            const SizedBox(height: 25),
            const TitleText(text: 'right now and join?'),
            const SizedBox(height: 40),
            SizedBox(
              height: 52,
              width: 108,
              child: PrimaryButton(
                text: 'Join now',
                onPressed: () {},
                status: PrimaryButtonStatus.idle,
              ),
            ),
            const SizedBox(height: 10),
            PrimaryTextButton(
              status: TextStatus.pressed,
              text: 'Sign in',
              onPressed: () {
                // print("Sign In");
              },
            ),
          ],
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.only(bottom: 80, left: 250, right: 20),
          child: SizedBox(
            height: 100,
            child: Image.asset(
              'assets/illustrations/cow_eating.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
