import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import '../../theme/colors/colors.dart';
import '../../theme/fonts/fonts.dart';
import '../../widgets/inputs/search_bars/search_bar.dart';

class SearchChildren extends StatefulWidget {
  const SearchChildren({super.key});

  @override
  State<SearchChildren> createState() => _SearchChildrenState();
}

class _SearchChildrenState extends State<SearchChildren> {
  List<Map<String, String>> breedChildrenDetails = [
    {'name': 'John', 'nickname': 'Cow', 'ID': '122123'},
    {'name': 'Mustang', 'nickname': 'Sheep', 'ID': '3212133'},
    {'name': 'Bustefal', 'nickname': 'Horse', 'ID': '5434133'},
    {'name': 'Coleisum', 'nickname': 'Ox', 'ID': '3432333'},
    {'name': 'Emily', 'nickname': 'Rabbit', 'ID': '32132343'},
    {'name': 'Emily', 'nickname': 'Rabbit', 'ID': '32132343'},
    {'name': 'Emily', 'nickname': 'Rabbit', 'ID': '32132343'},
    {'name': 'Emily', 'nickname': 'Rabbit', 'ID': '32132343'},
    {'name': 'Emily', 'nickname': 'Rabbit', 'ID': '32132343'},
    {'name': 'Emily', 'nickname': 'Rabbit', 'ID': '32132343'},
    {'name': 'Emily', 'nickname': 'Rabbit', 'ID': '32132343'},
    {'name': 'Emily', 'nickname': 'Rabbit', 'ID': '32132343'},
    {'name': 'Emily', 'nickname': 'Rabbit', 'ID': '32132343'},
    {'name': 'Emily', 'nickname': 'Rabbit', 'ID': '32132343'},
    {'name': 'Emily', 'nickname': 'Rabbit', 'ID': '32132343'},
    {'name': 'Emily', 'nickname': 'Rabbit', 'ID': '32132343'},
  ];
  @override
  Widget build(BuildContext context) {
    double heightMediaQuery = MediaQuery.of(context).size.height / 812;
    double widthMediaQuery = MediaQuery.of(context).size.width / 375;
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.only(
            left: 16 * widthMediaQuery,
            right: 16 * widthMediaQuery,
            top: 16 * heightMediaQuery,
            bottom: 16 * heightMediaQuery),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 40 * heightMediaQuery,
                  width: 300 * widthMediaQuery,
                  child: PrimarySearchBar(
                    hintText: 'Search By Name Or ID',
                    onChange: (value) {
                      setState(() {
                        breedChildrenDetails = [
                          {'name': 'John', 'nickname': 'Cow', 'ID': '122123'},
                          {
                            'name': 'Mustang',
                            'nickname': 'Sheep',
                            'ID': '3212133'
                          },
                          {
                            'name': 'Bustefal',
                            'nickname': 'Horse',
                            'ID': '5434133'
                          },
                          {
                            'name': 'Coleisum',
                            'nickname': 'Ox',
                            'ID': '3432333'
                          },
                          {
                            'name': 'Emily',
                            'nickname': 'Rabbit',
                            'ID': '32132343'
                          },
                          {
                            'name': 'Emily',
                            'nickname': 'Rabbit',
                            'ID': '32132343'
                          },
                          {
                            'name': 'Emily',
                            'nickname': 'Rabbit',
                            'ID': '32132343'
                          },
                          {
                            'name': 'Emily',
                            'nickname': 'Rabbit',
                            'ID': '32132343'
                          },
                          {
                            'name': 'Emily',
                            'nickname': 'Rabbit',
                            'ID': '32132343'
                          },
                          {
                            'name': 'Emily',
                            'nickname': 'Rabbit',
                            'ID': '32132343'
                          },
                          {
                            'name': 'Emily',
                            'nickname': 'Rabbit',
                            'ID': '32132343'
                          },
                          {
                            'name': 'Emily',
                            'nickname': 'Rabbit',
                            'ID': '32132343'
                          },
                          {
                            'name': 'Emily',
                            'nickname': 'Rabbit',
                            'ID': '32132343'
                          },
                        ]
                            .where((entry) =>
                                entry['name']!
                                    .toLowerCase()
                                    .contains(value.toLowerCase()) ||
                                entry['nickname']!
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                ),
                // I want a X button
                Container(
                  height: 40 * heightMediaQuery,
                  width: 40 * widthMediaQuery,
                  decoration: const BoxDecoration(
                    color: AppColors.grayscale10,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24 * heightMediaQuery,
            ),
            breedChildrenDetails.isEmpty
                ? Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/illustrations/cow_childx.png'),
                            SizedBox(
                              height: 32 * heightMediaQuery,
                            ),
                            Text(
                              'No Results',
                              style: AppFonts.headline3(
                                color: AppColors.grayscale90,
                              ),
                            ),
                            SizedBox(
                              height: 8 * heightMediaQuery,
                            ),
                            Text(
                              'Do you want to create an animal?',
                              style: AppFonts.body2(
                                color: AppColors.grayscale70,
                              ),
                            ),
                            SizedBox(
                              height: 105 * heightMediaQuery,
                            ),
                            SizedBox(
                              height: 52 * heightMediaQuery,
                              width: 160 * widthMediaQuery,
                              child: PrimaryButton(
                                text: 'Create Animal',
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: breedChildrenDetails.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            radius: 24 * widthMediaQuery,
                            child: Text(breedChildrenDetails[index]['name']![0],
                                style: AppFonts.headline3(
                                    color: AppColors.grayscale90)),
                          ),
                          title: Text(
                            breedChildrenDetails[index]['name']!,
                            style: AppFonts.headline3(
                                color: AppColors.grayscale90),
                          ),
                          subtitle: Text(
                            breedChildrenDetails[index]['nickname']!,
                            style: AppFonts.body2(color: AppColors.grayscale70),
                          ),
                          trailing: Text(
                            'ID #${breedChildrenDetails[index]['ID']}',
                            style: AppFonts.body2(color: AppColors.grayscale90),
                          ),
                          onTap: () {
                            Navigator.pop(
                                context, breedChildrenDetails[index]['name']);
                          },
                        );
                      },
                    ),
                  ),
          ],
        ),
      )),
    );
  }
}
