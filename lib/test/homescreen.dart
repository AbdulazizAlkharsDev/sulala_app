import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/buttons/primary/primary_button.dart';

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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              // Handle search button press
                            },
                          ),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.notifications_outlined),
                            onPressed: () {
                              // Handle notifications button press
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: const Color.fromRGBO(225, 236, 185, 1),
                        child: Container(
                          width: 165,
                          height: 208,
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/icons/frame/24px/Cow_Icon.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Searching",
                                      style: AppFonts.headline3(
                                        color: AppColors.grayscale100,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      "for animals?",
                                      style: AppFonts.headline3(
                                        color: AppColors.grayscale100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                  width: 133,
                                  height: 40,
                                  child: PrimaryButton(
                                    status: ButtonStatus.idle,
                                    text: 'Find Animals',
                                    onPressed: () {
                                      // Handle button press
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        color: const Color.fromRGBO(246, 239, 205, 1),
                        child: Container(
                          width: 165,
                          height: 208,
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/icons/frame/24px/Farm_Icon.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Search For',
                                style: AppFonts.headline3(
                                  color: AppColors.grayscale100,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Farms',
                                style: AppFonts.headline3(
                                  color: AppColors.grayscale100,
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 40,
                                width: 133,
                                child: PrimaryButton(
                                  status: ButtonStatus.idle,
                                  text: 'Find Farms',
                                  onPressed: () {
                                    // Handle button press
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 120),
                Text(
                  'Want to start your farm',
                  style: AppFonts.title4(color: AppColors.grayscale100),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'right now and Join',
                  style: AppFonts.title4(color: AppColors.grayscale100),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 36, 86, 38),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Join Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Handle text button press
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontWeight: FontWeight.bold),
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
