import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class SingleLineWidget extends StatelessWidget {
  final String textHead;
  final Function() onPressed;

  const SingleLineWidget({
    Key? key,
    required this.textHead,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: AppColors.grayscale10,
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.0389,
              ),
              Text(
                textHead,
                style: AppFonts.body2(
                  color: AppColors.grayscale90,
                ),
              ),
              const Spacer(),
              Image.asset(
                'assets/icons/frame/24px/24_Chevron_right.png',
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.0389,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.017,
          ),
          Container(
            //Check it again please (it is taking the width of the screen)I need it to take the width of the row
            width: MediaQuery.of(context).size.width * 0.9,
            height: 1,
            color: AppColors.grayscale20,
          ),
        ],
      ),
    );
  }
}

// Example of use:

// SizedBox(
//               width: MediaQuery.of(context).size.width * 0.9,
//               height: MediaQuery.of(context).size.height * 0.09,
//               child: SingleLineWidget(
//                 textHead:
//                     'Hello', // Replace with the actual text you want to display
//                 onPressed: () {
//                   // Do something when the row is pressed
//                   // For example, you can navigate to a new page, update the UI, etc.
//                 },
//               ),
//             ),