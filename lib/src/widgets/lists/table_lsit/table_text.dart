import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';


class TableText extends StatefulWidget {
  final String text1;
  final String text2;

  const TableText({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  State<TableText> createState() => _TableTextState();
}

class _TableTextState extends State<TableText> {
  String truncateTextWithEllipsis(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.0389,
            ),
            Text(
              truncateTextWithEllipsis(widget.text1, 25),
              style: AppFonts.body2(
                color: AppColors.grayscale70,
              ),
            ),
            const Spacer(),
            Text(
              widget.text2,
              style: AppFonts.body2(
                color: AppColors.grayscale90,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.0389,
            ),
          ],
        ),
      ],
    );
  }
}


// Exapmle of use:

// TextButtonTextWidget(
//                     textHead: 'Text Button',
//                     textButton: 'Button',
//                     onPressed: (bool isChecked) {
//                       print('Text Button Pressed');
//                     },
//                   ),