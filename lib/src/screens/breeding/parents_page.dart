import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/src/widgets/other/parents_item.dart';
import '../../theme/colors/colors.dart';
import '../../theme/fonts/fonts.dart';

class ParentsPage extends StatefulWidget {
  final String selectedOviSire;
  final String selectedMammalSire;
  final String selectedOviDam;
  final String selectedMammalDam;

  const ParentsPage({
    super.key,
    required this.selectedOviSire,
    required this.selectedMammalSire,
    required this.selectedOviDam,
    required this.selectedMammalDam,
  });
  @override
  State<ParentsPage> createState() => _ParentsPageState();
}

class _ParentsPageState extends State<ParentsPage> {
  final List<Map<String, dynamic>> parents = [
    {
      'heading': 'Breeding Event 1',
      'date': '02.09.2023',
      'title': 'Loyce',
      'subtitle': 'Male, 1 Year',
      'trailing': 'ID #13542',
      'avatarImage': 'assets/avatar1.png',
    },
    {
      'heading': 'Breeding Event 2',
      'date': '02.09.2023',
      'title': 'Joyce',
      'subtitle': 'Male, 3 Years',
      'trailing': 'ID #13542',
      'avatarImage': 'assets/avatar2.png',
    },
    {
      'heading': 'Breeding Event 3',
      'date': '02.09.2023',
      'title': 'Angel',
      'subtitle': 'Male, 3.5 Years',
      'trailing': 'ID #13542',
      'avatarImage': 'assets/avatar3.png',
    },
    // Your list of children data goes here
  ];

  @override
  Widget build(BuildContext context) {
    double heightMediaQuery = MediaQuery.of(context).size.height / 812;
    double widthMediaQuery = MediaQuery.of(context).size.width / 375;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Harry',
          style: AppFonts.headline3(color: AppColors.grayscale90),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grayscale10,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              // Handle edit button tap
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.grayscale10,
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
      body: Padding(
        padding: EdgeInsets.only(
            right: 16 * widthMediaQuery, left: 16 * widthMediaQuery),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Parents ',
              style: AppFonts.title3(color: AppColors.grayscale90),
            ),
            parents.isEmpty
                ? Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 151 * heightMediaQuery,
                        ),
                        Image.asset('assets/illustrations/cowx_child.png'),
                        SizedBox(height: 32 * heightMediaQuery),
                        Text(
                          'No Parents ',
                          style:
                              AppFonts.headline3(color: AppColors.grayscale90),
                        ),
                        SizedBox(
                          height: 8 * heightMediaQuery,
                        ),
                        Text(
                          "This Animal Doesn't Have Parents.",
                          style: AppFonts.body2(color: AppColors.grayscale70),
                        ),
                        Text(
                          "Add Parent By Pressing The Button Below.",
                          style: AppFonts.body2(color: AppColors.grayscale70),
                        ),
                        SizedBox(
                          height: 125 * heightMediaQuery,
                        ),
                        SizedBox(
                          width: 130 * widthMediaQuery,
                          height: 52 * heightMediaQuery,
                          child: PrimaryButton(
                            text: 'Add Parents',
                            onPressed: () {
                              // Implement the logic to add children here
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 24 * heightMediaQuery,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Column(
                            children: [
                              ParentsItem(
                                id: '2222',
                                name: '9999',
                                sex: 'Male',
                                age: '7 years',
                                // imageUrl:'https://www.ghorse.com/sites/default/files/img_0682.jpg',
                              ),
                            ],
                          ),
                          SizedBox(width: 55 * widthMediaQuery),
                          const ParentsItem(
                            id: '2222',
                            name: '9999',
                            sex: 'Female',
                            age: '6 years',
                            // imageUrl:'https://www.ghorse.com/sites/default/files/img_0682.jpg',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 120 * heightMediaQuery,
                      ),
                      Image.asset('assets/illustrations/horse_love.png'),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
