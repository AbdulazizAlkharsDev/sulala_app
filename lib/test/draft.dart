import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class DividedElevatedButton extends StatelessWidget {
  final String leftText;
  final String rightText;
  final VoidCallback? onLeftPressed;
  final VoidCallback? onRightPressed;

  const DividedElevatedButton({
    super.key,
    required this.leftText,
    required this.rightText,
    this.onLeftPressed,
    this.onRightPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null, // Disable the main button's onPressed
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grayscale20, width: 1.0),
          borderRadius: BorderRadius.circular(24.0),
          color: AppColors.grayscale0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onLeftPressed,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    bottomLeft: Radius.circular(24.0),
                  ),
                  child: Center(
                    child: Text(
                      leftText,
                      style: AppFonts.body2(color: AppColors.grayscale90),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: 1,
              color: AppColors.grayscale20,
            ),
            Expanded(
              flex: 2,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onRightPressed,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(24.0),
                    bottomRight: Radius.circular(24.0),
                  ),
                  child: Center(
                    child: Text(
                      rightText,
                      style: AppFonts.body2(color: AppColors.grayscale90),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
