import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

enum PrimaryButtonPosition {
  primary,
  left,
  right,
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final PrimaryButtonStatus status;
  final PrimaryButtonPosition position;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.status = PrimaryButtonStatus.idle,
    this.position = PrimaryButtonPosition.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: status == PrimaryButtonStatus.disabled ? null : onPressed,
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
    if (status == PrimaryButtonStatus.loading) {
      return const SpinKitFadingCircle(
        color: AppColors.grayscale0,
        size: 24,
      );
    } else {
      switch (position) {
        case PrimaryButtonPosition.left:
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back_rounded,
                color: _getArrowColor(status),
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style: AppFonts.body1(color: _getTextColor(status)),
              ),
            ],
          );
        case PrimaryButtonPosition.right:
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: AppFonts.body1(color: _getTextColor(status)),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_rounded,
                color: _getArrowColor(status),
              ),
            ],
          );
        default:
          return Text(
            text,
            style: AppFonts.body1(color: _getTextColor(status)),
          );
      }
    }
  }

  Color _getButtonColor(PrimaryButtonStatus status) {
    switch (status) {
      case PrimaryButtonStatus.idle:
        return AppColors.primary40;
      case PrimaryButtonStatus.pressed:
        return AppColors.primary50;
      case PrimaryButtonStatus.loading:
        return AppColors.primary40;
      case PrimaryButtonStatus.disabled:
        return AppColors.grayscale50;
      default:
        return AppColors.primary40;
    }
  }

  Color _getArrowColor(PrimaryButtonStatus status) {
    switch (status) {
      case PrimaryButtonStatus.idle:
      case PrimaryButtonStatus.loading:
      case PrimaryButtonStatus.pressed:
        return AppColors.grayscale0;
      case PrimaryButtonStatus.disabled:
        return _getTextColor(status);
      default:
        return AppColors.grayscale0;
    }
  }

  Color _getTextColor(PrimaryButtonStatus status) {
    switch (status) {
      case PrimaryButtonStatus.idle:
      case PrimaryButtonStatus.pressed:
      case PrimaryButtonStatus.loading:
        return AppColors.grayscale0;
      case PrimaryButtonStatus.disabled:
        return AppColors.grayscale0;
      default:
        return AppColors.grayscale0;
    }
  }
}

enum PrimaryButtonStatus {
  idle,
  pressed,
  loading,
  disabled,
}


// Example of use:

// SizedBox(
//               width: MediaQuery.of(context).size.width * 0.9,
//               height: MediaQuery.of(context).size.height * 0.05,
//               child: PrimaryButton(
//                 text: 'Button Text',
//                 onPressed: () {
//                   // Your onPressed logic here
//                 },
//                 status: PrimaryButtonStatus.idle,
//                 position: PrimaryButtonPosition.right,
//               ),
//             ),