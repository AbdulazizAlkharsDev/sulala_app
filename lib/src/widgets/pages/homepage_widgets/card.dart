import 'package:flutter/material.dart';

import '../../../theme/colors/colors.dart';
import '../../../theme/fonts/fonts.dart';
import '../../controls_and_buttons/buttons/primary/primary_button.dart';

class CardWidget extends StatelessWidget {
  final Color color;
  final String iconPath;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onPressed;

  const CardWidget({
    super.key,
    required this.color,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        color: color,
        child: Container(
          width: 165,
          height: 208,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    iconPath,
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
                      title,
                      style: AppFonts.headline3(
                        color: AppColors.grayscale100,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      subtitle,
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
                    status: PrimaryButtonStatus.idle,
                    text: buttonText,
                    onPressed: onPressed,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
