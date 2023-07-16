import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStatus status;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.status = ButtonStatus.idle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343,
      height: 52,
      child: ElevatedButton(
        onPressed: status == ButtonStatus.disabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _getButtonColor(status),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Visibility(
              visible: status == ButtonStatus.loading,
              child: const SpinKitFadingCircle(
                color: AppColors.grayscale0,
                size: 24,
              ),
            ),
            Visibility(
              visible: status != ButtonStatus.loading,
              child: Text(
                text,
                style: AppFonts.body1(
                  color: _getTextColor(status),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getButtonColor(ButtonStatus status) {
    switch (status) {
      case ButtonStatus.idle:
        return AppColors.primary40;
      case ButtonStatus.pressed:
        return AppColors.primary50;
      case ButtonStatus.loading:
        return AppColors.primary40;
      case ButtonStatus.disabled:
        return AppColors.grayscale50;
      default:
        return AppColors.primary40;
    }
  }

  Color _getTextColor(ButtonStatus status) {
    switch (status) {
      case ButtonStatus.idle:
      case ButtonStatus.pressed:
      case ButtonStatus.loading:
      case ButtonStatus.disabled:
        return AppColors.grayscale0;
      default:
        return AppColors.grayscale0;
    }
  }
}

enum ButtonStatus {
  idle,
  pressed,
  loading,
  disabled,
}
