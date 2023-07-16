import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStatus status;

  const SecondaryButton({
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
        child: _buildButtonContent(),
      ),
    );
  }

  Widget _buildButtonContent() {
    if (status == ButtonStatus.loading) {
      return const SpinKitFadingCircle(
        color: AppColors.grayscale90,
        size: 24,
      );
    } else {
      return Text(
        text,
        style: AppFonts.body1(
          color: _getTextColor(status),
        ),
      );
    }
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
      case ButtonStatus.pressed:
        return AppColors.grayscale90;
      case ButtonStatus.loading:
        return AppColors.grayscale90;
      case ButtonStatus.disabled:
        return AppColors.grayscale50;
      default:
        return AppColors.grayscale90;
    }
  }
}

enum ButtonStatus {
  idle,
  pressed,
  loading,
  disabled,
}
