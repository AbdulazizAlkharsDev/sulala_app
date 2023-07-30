import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';

enum TextButtonPosition {
  primary,
  left,
  right,
}

class PrimaryTextButton extends StatelessWidget {
  final TextStatus status;
  final VoidCallback? onPressed;
  final String text;
  final TextButtonPosition position;

  const PrimaryTextButton({
    Key? key,
    required this.status,
    required this.text,
    this.onPressed,
    this.position = TextButtonPosition.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _getButtonEnabled(status) ? onPressed : null,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return AppColors.grayscale20;
            }
            return Colors.transparent;
          },
        ),
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
        return _buildTextWithArrow(
          text,
          _getTextColor(status),
          position == TextButtonPosition.right,
          position == TextButtonPosition.left,
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
        return _buildTextWithArrow(
          text,
          AppColors.grayscale50,
          position == TextButtonPosition.right,
          position == TextButtonPosition.left,
        );
    }
  }

  Widget _buildTextWithArrow(
    String text,
    Color textColor,
    bool showRightArrow,
    bool showLeftArrow,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (showLeftArrow)
          Icon(
            Icons.arrow_back_rounded,
            color: textColor,
          ),
        Text(
          text,
          style: TextStyle(color: textColor),
        ),
        if (showRightArrow)
          Icon(
            Icons.arrow_forward_rounded,
            color: textColor,
          ),
      ],
    );
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

// SizedBox(
//               width: MediaQuery.of(context).size.width * 0.9,
//               height: MediaQuery.of(context).size.height * 0.05,
//               child: PrimaryTextButton(
//                 status: TextStatus.idle,
//                 onPressed: () {},
//                 text: 'Text Button',
//                 position: TextButtonPosition.right,
//               ),
//             ),