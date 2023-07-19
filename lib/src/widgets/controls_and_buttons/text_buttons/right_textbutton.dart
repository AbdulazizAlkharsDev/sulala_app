import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class RightTextButton extends StatelessWidget {
  final TextStatusRight status;
  final VoidCallback? onPressed;
  final String text;

  const RightTextButton({
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
      case TextStatusRight.idle:
      case TextStatusRight.pressed:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: AppFonts.body1(color: _getTextColor(status)),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: _getTextColor(status),
            ),
          ],
        );
      case TextStatusRight.loading:
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
      case TextStatusRight.disabled:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: AppFonts.body1(color: _getTextColor(status)),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: _getTextColor(status),
            ),
          ],
        );
    }
  }

  bool _getButtonEnabled(TextStatusRight status) {
    return status != TextStatusRight.disabled && status != TextStatusRight.loading;
  }

  Color _getTextColor(TextStatusRight status) {
    switch (status) {
      case TextStatusRight.idle:
        return AppColors.primary40;
      case TextStatusRight.pressed:
        return AppColors.primary50;
      case TextStatusRight.loading:
        return AppColors.grayscale90;
      case TextStatusRight.disabled:
        return AppColors.grayscale50;
    }
  }
}

enum TextStatusRight {
  idle,
  pressed,
  loading,
  disabled,
}
