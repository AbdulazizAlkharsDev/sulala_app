import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/src/widgets/inputs/draw_ups/draw_up_widget.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  State<AppSettings> createState() => _AppSettings();
}

class _AppSettings extends State<AppSettings> {
  String selectedLanguage = '';
  String selectedLanguageTemp = '';

  void _showLanguageSelection() {
    List<String> languages = ['English', 'Arabic', 'Hindi'];
    showModalBottomSheet(
      showDragHandle: true,
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return DrowupWidget(
              heightFactor: 0.45,
              heading: 'Language Of The App',
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < languages.length; i++)
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(languages[i]),
                      trailing: selectedLanguageTemp == languages[i]
                          ? Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primary20,
                                  width: 6.0,
                                ),
                              ),
                            )
                          : Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.grayscale30,
                                  width: 1.0,
                                ),
                              ),
                            ),
                      onTap: () {
                        setState(() {
                          selectedLanguageTemp = languages[i];
                        });
                      },
                    ),
                  SizedBox(
                      height: 32 * MediaQuery.of(context).size.height / 812),
                  SizedBox(
                    width: double.infinity,
                    height: 52 * MediaQuery.of(context).size.height / 812,
                    child: PrimaryButton(
                        onPressed: () {
                          setState(() {
                            selectedLanguage = selectedLanguageTemp;
                          });
                          Navigator.pop(context);
                        },
                        text: 'Save'),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((_) {
      setState(() {
        selectedLanguage = selectedLanguageTemp;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double heightMediaQuery = MediaQuery.of(context).size.height / 812;
    double widthMediaQuery = MediaQuery.of(context).size.width / 375;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'App Settings',
          style: AppFonts.headline3(color: AppColors.grayscale90),
        ),
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grayscale10,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.grayscale90,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: 16 * widthMediaQuery,
              right: 16 * widthMediaQuery,
              top: 24 * heightMediaQuery),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Language',
                  style: AppFonts.body1(color: AppColors.grayscale90),
                ),
                subtitle: Text(
                  'English',
                  style: AppFonts.body2(color: AppColors.grayscale60),
                ),
                onTap: _showLanguageSelection,
                trailing: const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.grayscale60,
                  size: 35,
                ),
              ),
              const Divider()
            ],
          ),
        ),
      ),
    );
  }
}
