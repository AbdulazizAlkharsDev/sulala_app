import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class AppleButton extends StatelessWidget {
  final ButtonStatus status;
  final VoidCallback? onPressed;

  const AppleButton({
    Key? key,
    required this.status,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: status == ButtonStatus.disabled ? null : onPressed,
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
    if (status == ButtonStatus.loading) {
      return const Center(
        child: SpinKitFadingCircle(
          color: AppColors.grayscale90,
          size: 24, //Don't use MediaQuery here
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/icons/frame/24px/24_Apple.png',
            width: 24,
            height: 24,
          ),
          Text(
            'Continue with Apple',
            style: AppFonts.body1(
              color: _getTextColor(status),
            ),
          ),
          const SizedBox(width: 30),
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

  Color _getTextColor(ButtonStatus status) {
    switch (status) {
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
