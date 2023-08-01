import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class DisablesDefaultTextWidget extends StatefulWidget {
  final String textHead;
  final bool isChecked;

  const DisablesDefaultTextWidget({
    Key? key,
    required this.textHead,
    required this.isChecked,
  }) : super(key: key);

  @override
  State<DisablesDefaultTextWidget> createState() =>
      _DisablesDefaultTextWidgetState();
}

class _DisablesDefaultTextWidgetState extends State<DisablesDefaultTextWidget> {
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
                color: AppColors.grayscale50,
              ),
            ),
            const Spacer(),
            if (widget.isChecked)
              Image.asset(
                "assets/icons/frame/24px/24_Check.png",
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

// const DisablesDefaultTextWidget(
//                     textHead: 'Hello',
//                     isChecked: false,
//                   ),