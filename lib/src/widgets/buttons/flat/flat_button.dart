import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../theme/colors/colors.dart';

enum ButtonStatus {
  idle,
  pressed,
  loading,
  disabled,
}

class FlatButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStatus status;

  const FlatButton({
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
          elevation: 0, // Set elevation to 0 to remove the shadow
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
              child: SpinKitFadingCircle(
                color: AppColors.grayscale90,
                size: 24,
              ),
            ),
            Visibility(
              visible: status != ButtonStatus.loading,
              child: Text(
                text,
                style: TextStyle(
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
        return AppColors.grayscale00;
      case ButtonStatus.pressed:
        return AppColors.grayscale10;
      case ButtonStatus.loading:
        return AppColors.grayscale00;
      case ButtonStatus.disabled:
        return AppColors.grayscale00;
      default:
        return AppColors.grayscale00;
    }
  }

  Color _getTextColor(ButtonStatus status) {
    switch (status) {
      case ButtonStatus.idle:
        return AppColors.grayscale90;
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
