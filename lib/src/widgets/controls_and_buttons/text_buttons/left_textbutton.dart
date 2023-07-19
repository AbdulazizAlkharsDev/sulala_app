import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class LeftTextButton extends StatelessWidget {
  final TextStatusLeft status;
  final VoidCallback? onPressed;
  final String text;

  const LeftTextButton({
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
      case TextStatusLeft.idle:
      case TextStatusLeft.pressed:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: _getTextColor(status),
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: AppFonts.body1(color: _getTextColor(status)),
            ),
          ],
        );
      case TextStatusLeft.loading:
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
      case TextStatusLeft.disabled:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: _getTextColor(status),
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: AppFonts.body1(color: _getTextColor(status)),
            ),
          ],
        );
    }
  }

  bool _getButtonEnabled(TextStatusLeft status) {
    return status != TextStatusLeft.disabled &&
        status != TextStatusLeft.loading;
  }

  Color _getTextColor(TextStatusLeft status) {
    switch (status) {
      case TextStatusLeft.idle:
        return AppColors.primary40;
      case TextStatusLeft.pressed:
        return AppColors.primary50;
      case TextStatusLeft.loading:
        return AppColors.grayscale90;
      case TextStatusLeft.disabled:
        return AppColors.grayscale50;
    }
  }
}

enum TextStatusLeft {
  idle,
  pressed,
  loading,
  disabled,
}
