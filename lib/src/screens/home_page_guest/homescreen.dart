import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/text_buttons/primary_textbutton.dart';
import '../../widgets/controls_and_buttons/buttons/primary_button.dart';
import '../../widgets/pages/homepage_widgets/card.dart';
import '../../widgets/pages/homepage_widgets/title_text.dart';
import 'package:shimmer/shimmer.dart'; // Import Shimmer package

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
                        ? _buildShimmerPlaceholders() // Shimmer placeholders
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

  List<Widget> _buildShimmerPlaceholders() {
    return [
      Row(
        children: [
          Expanded(
            child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.26,
                decoration: BoxDecoration(
                  color: AppColors.grayscale10,
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.05),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.032),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.128,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width / 2),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.017),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.068,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.064),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.017),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.064),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.035),
          Expanded(
            child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.26,
                decoration: BoxDecoration(
                  color: AppColors.grayscale10,
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.05),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.032),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.128,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width / 2),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.017),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.068,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.064),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.017),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.064),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.135),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.832,
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.0788,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.053),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.064,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.053),
                  )),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.011),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.064,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.053),
                  )),
            ),
          ],
        ),
      ),
    ];
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
          // print("Sign In");
        },
      ),
    ];
  }
}
