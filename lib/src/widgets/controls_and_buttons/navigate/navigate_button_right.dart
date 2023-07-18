import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class NavigateButtonRight extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStatus status;

  const NavigateButtonRight({
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
          elevation: 0,
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
      return const Stack(
        alignment: Alignment.center,
        children: [
          SpinKitFadingCircle(
            color: AppColors.error100,
            size: 24,
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppFonts.body1(
              color: _getTextColor(status),
            ),
          ),
          const SizedBox(
            width: 8,
          ), // Add a small space of 8 pixels between the text and the arrow
          Icon(
            Icons.arrow_forward_rounded,
            color: _getArrowColor(status),
          ),
        ],
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

  Color _getArrowColor(ButtonStatus status) {
    switch (status) {
      case ButtonStatus.idle:
      case ButtonStatus.loading:
      case ButtonStatus.pressed:
        return AppColors.error100;
      case ButtonStatus.disabled:
        return _getTextColor(status);
      default:
        return AppColors.error100;
    }
  }

  Color _getTextColor(ButtonStatus status) {
    switch (status) {
      case ButtonStatus.idle:
      case ButtonStatus.loading:
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
