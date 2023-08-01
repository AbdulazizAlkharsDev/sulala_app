import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/text_buttons/primary_textbutton.dart';

class TableTextButton extends StatefulWidget {
  final String textHead;
  final String textButton;
  final Function(bool isChecked) onPressed;

  const TableTextButton({
    Key? key,
    required this.textHead,
    required this.textButton,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<TableTextButton> createState() => _TableTextButtonState();
}

class _TableTextButtonState extends State<TableTextButton> {
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
              truncateTextWithEllipsis(widget.textHead, 25),
              style: AppFonts.body2(
                color: AppColors.grayscale70,
              ),
            ),
            const Spacer(),
            PrimaryTextButton(
              status: TextStatus.idle,
              position: TextButtonPosition.right,
              onPressed: () {
                widget.onPressed(true);
              },
              text: widget.textButton,
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