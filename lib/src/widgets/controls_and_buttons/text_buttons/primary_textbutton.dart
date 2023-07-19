import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class PrimaryTextButton extends StatelessWidget {
  final TextStatus status;
  final VoidCallback? onPressed;
  final String text;

  const PrimaryTextButton({
    Key? key,
    required this.status,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _getButtonEnabled(status) ? onPressed : null,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.grayscale50;
          }
          return _getTextColor(status);
        }),
      ),
      child: _buildButtonContent(),
    );
  }

  Widget _buildButtonContent() {
    switch (status) {
      case TextStatus.idle:
      case TextStatus.pressed:
        return Text(
          text,
          style: AppFonts.body1(color: _getTextColor(status)),
        );
      case TextStatus.loading:
        return const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: SpinKitFadingCircle(
                color: AppColors.grayscale90,
                size: 24,
              ),
            ),
          ],
        );
      case TextStatus.disabled:
        return Text(
          text,
          style: AppFonts.body1(color: AppColors.grayscale50),
        );
    }
  }

  bool _getButtonEnabled(TextStatus status) {
    return status != TextStatus.disabled && TextStatus.loading != status;
  }

  Color _getTextColor(TextStatus status) {
    switch (status) {
      case TextStatus.idle:
        return AppColors.primary40;
      case TextStatus.pressed:
        return AppColors.primary50;
      case TextStatus.loading:
        return AppColors.grayscale90;
      case TextStatus.disabled:
        return AppColors.grayscale50;
    }
  }
}

enum TextStatus {
  idle,
  pressed,
  loading,
  disabled,
}


// Example of use:

// PrimaryTextButton(
//               status: TextStatus.pressed,
//               text: 'Sign in',
//               onPressed: () {
//                 // print("Sign In");
//               },
//             ),