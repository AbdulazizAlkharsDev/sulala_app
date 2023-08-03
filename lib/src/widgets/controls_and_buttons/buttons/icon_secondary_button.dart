import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class IconSecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final SecondaryButtonStatus status;
  final String iconPath;

  const IconSecondaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.status = SecondaryButtonStatus.idle,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: status == SecondaryButtonStatus.disabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: _getButtonColor(status),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: _buildButtonContent(),
    );
  }

  Widget _buildButtonContent() {
    if (status == SecondaryButtonStatus.loading) {
      return const SpinKitFadingCircle(
        color: AppColors.grayscale90,
        size: 24,
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath),
          const SizedBox(width: 10),
          Text(
            text,
            style: AppFonts.body1(color: _getTextColor(status)),
          ),
        ],
      );
    }
  }
}

Color _getButtonColor(SecondaryButtonStatus status) {
  switch (status) {
    case SecondaryButtonStatus.idle:
      return AppColors.grayscale10;
    case SecondaryButtonStatus.pressed:
      return AppColors.grayscale20;
    case SecondaryButtonStatus.loading:
      return AppColors.grayscale10;
    case SecondaryButtonStatus.disabled:
      return AppColors.grayscale20;
    default:
      return AppColors.grayscale10;
  }
}

Color _getTextColor(SecondaryButtonStatus status) {
  switch (status) {
    case SecondaryButtonStatus.idle:
    case SecondaryButtonStatus.pressed:
    case SecondaryButtonStatus.loading:
      return AppColors.grayscale90;
    case SecondaryButtonStatus.disabled:
      return AppColors.grayscale50;
    default:
      return AppColors.grayscale90;
  }
}

enum SecondaryButtonStatus {
  idle,
  pressed,
  loading,
  disabled,
}


// Example of use:

// SizedBox(
//               width: MediaQuery.of(context).size.width * 0.9,
//               height: MediaQuery.of(context).size.height * 0.05,
//               child: SecondaryButton(
//                 text: 'Button Text',
//                 onPressed: () {
//                   // Your onPressed logic here
//                 },
//                 status: SecondaryButtonStatus.idle,
//                 position: SecondaryButtonPosition.right,
//               ),
//             ),