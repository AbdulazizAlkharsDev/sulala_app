import 'package:flutter/material.dart';
import 'package:sulala_app/src/screens/guest_mode/shimmer_homescreen.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/text_buttons/primary_textbutton.dart';

import '../../widgets/controls_and_buttons/buttons/primary_button.dart';
import '../../widgets/pages/homepage_widgets/card.dart';
import '../../widgets/pages/homepage_widgets/title_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true; // Add a boolean for loading state

  @override
  void initState() {
    super.initState();

    // Call the asynchronous function to simulate data loading
    _loadData();
  }

  Future<void> _loadData() async {
    // Simulate data loading with a delay
    await Future.delayed(const Duration(seconds: 5));

    // Update the loading state
    setState(() {
      _isLoading = false; // Data is loaded, set loading state to false
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                      image: AssetImage(
                          'assets/icons/frame/24px/Icon-button1.png'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: Colors
              .transparent, // Set the appbar background color to transparent
          elevation: 0, // Remove the appbar shadow
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.867,
            child: Stack(
              children: [
                // Background Image (Bottom Sheet)
                _isLoading == false
                    ? Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.15,
                        left: MediaQuery.of(context).size.width * 0.6,
                        right: MediaQuery.of(context).size.width * 0.05,
                        child: Image.asset(
                          'assets/illustrations/cow_eating.png',
                          fit: BoxFit.fill,
                        ),
                      )
                    : Container(),

                // Content
                Padding(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.width * 0.0426),
                  child: Column(
                    children: _isLoading
                        ? [
                            const ShimmerHomePageWidget()
                          ] // Shimmer placeholders
                        : _buildActualContent(), // Actual content
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildActualContent() {
    return [
      Row(
        children: [
          Expanded(
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
          SizedBox(width: MediaQuery.of(context).size.width * 0.015),
          Expanded(
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
        ],
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.135),
      const TitleText(text: 'Want to start your farm\nright now and join?'),
      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
      SizedBox(height: MediaQuery.of(context).size.height * 0.011),
      PrimaryTextButton(
        status: TextStatus.idle,
        text: 'Sign in',
        onPressed: () {
          Navigator.of(context).pushNamed('/sign_in');
        },
      ),
    ];
  }
}
