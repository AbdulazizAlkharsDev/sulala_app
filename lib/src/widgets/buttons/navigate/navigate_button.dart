import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class NavigateButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStatus status;

  const NavigateButton({
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
        child: status == ButtonStatus.loading
            ? Image.asset('assets/icons/frame/20px/Frame-6.png',
                color: AppColors.grayscale90)
            : Text(
                text,
                style: AppFonts.body1(
                  color: _getTextColor(status),
                ),
              ),
      ),
    );
  }

  Color _getButtonColor(ButtonStatus status) {
    switch (status) {
      case ButtonStatus.idle:
        return AppColors.grayscale10;
      case ButtonStatus.pressed:
        return AppColors.grayscale20;
      case ButtonStatus.loading:
        return AppColors.grayscale10;
      case ButtonStatus.disabled:
        return AppColors.grayscale20;
      default:
        return AppColors.grayscale10;
    }
  }

  Color _getTextColor(ButtonStatus status) {
    switch (status) {
      case ButtonStatus.idle:
      case ButtonStatus.loading:
        return AppColors.error100;
      case ButtonStatus.pressed:
        return AppColors.error100;
      case ButtonStatus.disabled:
        return AppColors.grayscale50;
      default:
        return AppColors.error100;
    }
  }
}

enum ButtonStatus {
  idle,
  pressed,
  loading,
  disabled,
}
