import 'package:flutter/material.dart';

import '../../theme/colors/colors.dart';
import '../../theme/fonts/fonts.dart';
import '../../widgets/controls_and_buttons/buttons/primary_button.dart';

class ListOfMates extends StatefulWidget {
  const ListOfMates({super.key});

  @override
  State<ListOfMates> createState() => _ListOfMatesState();
}

class _ListOfMatesState extends State<ListOfMates> {
  final List<Map<String, dynamic>> partners = [
    // {
    //   'heading': 'Breeding Event 1',
    //   'date': '02.09.2023',
    //   'title': 'Loyce',
    //   'subtitle': 'Male, 1 Year',
    //   'trailing': 'ID #13542',
    //   'avatarImage': 'assets/avatars/120px/Cat.png',
    // },
    // {
    //   'heading': 'Breeding Event 2',
    //   'date': '02.09.2023',
    //   'title': 'Joyce',
    //   'subtitle': 'Male, 3 Years',
    //   'trailing': 'ID #13542',
    //   'avatarImage': 'assets/avatars/120px/Cat.png',
    // },
    // {
    //   'heading': 'Breeding Event 3',
    //   'date': '02.09.2023',
    //   'title': 'Angel',
    //   'subtitle': 'Male, 3.5 Years',
    //   'trailing': 'ID #13542',
    //   'avatarImage': 'assets/avatars/120px/Cat.png',
    // },
    // Your list of partners data goes here
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
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: 16 * widthMediaQuery, right: 16 * widthMediaQuery),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'List of Mates',
              style: AppFonts.title3(color: AppColors.grayscale90),
            ),
            Expanded(
              child: partners.isEmpty
                  ? Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 151 * heightMediaQuery,
                          ),
                          Image.asset(
                              'assets/illustrations/cow_broke_adult.png'),
                          SizedBox(height: 32 * heightMediaQuery),
                          Text(
                            'No Mates Yet',
                            style: AppFonts.headline3(
                                color: AppColors.grayscale90),
                          ),
                          SizedBox(
                            height: 8 * heightMediaQuery,
                          ),
                          Text(
                            "This animal hasn’t been mated yet.",
                            style: AppFonts.body2(color: AppColors.grayscale70),
                          ),
                          SizedBox(
                            height: 125 * heightMediaQuery,
                          ),
                          SizedBox(
                            width: 130 * widthMediaQuery,
                            height: 52 * heightMediaQuery,
                            child: PrimaryButton(
                              text: 'Add Mate',
                              onPressed: () {
                                // Implement the logic to add children here
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: partners.length,
                      itemBuilder: (BuildContext context, int index) {
                        final partner = partners[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  partner['heading'],
                                  style: AppFonts.caption1(
                                      color: AppColors.grayscale80),
                                ),
                                Text(
                                  partner['date'],
                                  style: AppFonts.caption2(
                                      color: AppColors.grayscale80),
                                ),
                              ],
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.only(
                                  top: 8 * heightMediaQuery,
                                  bottom: 16 * heightMediaQuery),
                              leading: CircleAvatar(
                                radius: 24 * widthMediaQuery,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    AssetImage(partner['avatarImage']),
                              ),
                              title: Text(
                                partner['title'],
                                style: AppFonts.headline3(
                                    color: AppColors.grayscale90),
                              ),
                              subtitle: Text(
                                partner['subtitle'],
                                style: AppFonts.body2(
                                    color: AppColors.grayscale70),
                              ),
                              trailing: Text(
                                partner['trailing'],
                                style: AppFonts.body2(
                                    color: AppColors.grayscale70),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
