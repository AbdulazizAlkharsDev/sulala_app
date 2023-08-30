import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class CustomSnackBar {
  static void show(BuildContext context, String message, IconData icon,
      {Color? color}) {
    final overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox?;

    if (overlay != null) {
      final box = overlay.paintBounds;
      final snackBarWidth = box.size.width * 0.6; // Adjust the width as desired

      OverlayEntry entry = OverlayEntry(
        builder: (BuildContext context) {
          double heightMediaQuery = MediaQuery.of(context).size.height / 812;
          double widthMediaQuery = MediaQuery.of(context).size.width / 375;
          return Positioned(
            bottom:
                80 * heightMediaQuery, // Adjust the bottom margin as desired
            left: (box.size.width - snackBarWidth) / 2.0,
            width: snackBarWidth,
            child: Material(
              elevation: 4.0,
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              child: Padding(
                padding: EdgeInsets.all(16 * widthMediaQuery),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: color,
                    ),
                    SizedBox(width: 8 * widthMediaQuery),
                    Expanded(
                      child: Text(
                        message,
                        style: AppFonts.body2(color: AppColors.grayscale90),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );

      Overlay.of(context).insert(entry);

      Future.delayed(const Duration(seconds: 3)).then((_) {
        entry.remove();
      });
    }
  }
}


//Emaple of use:

// CustomSnackBar.show(
//                                   context,
//                                   'Member was Deleted',
//                                   Icons.check_circle_rounded,
//                                   color: AppColors.primary10,
//                                 );