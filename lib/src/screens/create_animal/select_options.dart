import 'package:flutter/material.dart';
import '../../theme/colors/colors.dart';
import '../../theme/fonts/fonts.dart';
import '../../widgets/controls_and_buttons/buttons/primary_button.dart';
import 'complete_info.dart';
import 'package:sulala_app/src/data/globals.dart' as globals;

class SelectedOptionsPage extends StatefulWidget {
  final String selectedAnimalType;
  final String selectedAnimalSpecies;
  final String selectedAnimalBreed;

  const SelectedOptionsPage({
    super.key,
    required this.selectedAnimalType,
    required this.selectedAnimalSpecies,
    required this.selectedAnimalBreed,
  });

  @override
  State<SelectedOptionsPage> createState() => _SelectedOptionsPageState();
}

class _SelectedOptionsPageState extends State<SelectedOptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Create Animal',
          style: AppFonts.headline3(color: AppColors.grayscale90),
        ),
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            width: globals.widthMediaQuery * 37.5,
            height: globals.widthMediaQuery * 37.5,
            decoration: BoxDecoration(
              color: AppColors.grayscale10,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          onPressed: () {
            // Handle close button press
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: Container(
              width: globals.widthMediaQuery * 37.5,
              height: globals.widthMediaQuery * 37.5,
              decoration: BoxDecoration(
                color: AppColors.grayscale10,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(Icons.close_rounded, color: Colors.black),
            ),
            onPressed: () {
              // Handle close button press
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: globals.widthMediaQuery * 16,
            right: globals.widthMediaQuery * 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: globals.heightMediaQuery * 24,
            ),
            Text('Chosen Options',
                style: AppFonts.headline2(color: AppColors.grayscale90)),
            SizedBox(
              height: globals.heightMediaQuery * 8,
            ),
            Text(
              'You can apply any changes',
              style: AppFonts.body2(color: AppColors.grayscale60),
            ),
            SizedBox(
              height: globals.heightMediaQuery * 24,
            ),
            Row(
              children: [
                Text(
                  'Animal Type',
                  style: AppFonts.body2(color: AppColors.grayscale70),
                ),
                const Spacer(),
                Text(
                  widget.selectedAnimalType,
                  style: AppFonts.body2(color: AppColors.grayscale90),
                ),
                SizedBox(
                  width: globals.widthMediaQuery * 8,
                ),
                Icon(Icons.arrow_forward_ios_rounded,
                    color: AppColors.primary40,
                    size: globals.widthMediaQuery * 12.75),
              ],
            ),
            SizedBox(height: globals.heightMediaQuery * 8),
            const Divider(),
            SizedBox(height: globals.heightMediaQuery * 8),
            Row(
              children: [
                Text(
                  'Animal Species',
                  style: AppFonts.body2(color: AppColors.grayscale70),
                ),
                const Spacer(),
                Text(
                  widget.selectedAnimalSpecies,
                  style: AppFonts.body2(color: AppColors.grayscale90),
                ),
                SizedBox(
                  width: globals.widthMediaQuery * 8,
                ),
                Icon(Icons.arrow_forward_ios_rounded,
                    color: AppColors.primary40,
                    size: globals.widthMediaQuery * 12.75),
              ],
            ),
            SizedBox(height: globals.heightMediaQuery * 8),
            const Divider(),
            SizedBox(height: globals.heightMediaQuery * 8),
            Row(
              children: [
                Text(
                  'Animal Breed',
                  style: AppFonts.body2(color: AppColors.grayscale70),
                ),
                const Spacer(),
                Text(
                  widget.selectedAnimalBreed,
                  style: AppFonts.body2(color: AppColors.grayscale90),
                ),
                SizedBox(
                  width: globals.widthMediaQuery * 8,
                ),
                Icon(Icons.arrow_forward_ios_rounded,
                    color: AppColors.primary40,
                    size: globals.widthMediaQuery * 12.75),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: globals.widthMediaQuery * 343,
        height: globals.heightMediaQuery * 52,
        child: PrimaryButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CompleteInfo(),
                ),
              );
            },
            text: 'Create Animal'),
      ),
    );
  }
}
