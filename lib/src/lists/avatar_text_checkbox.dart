import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/checkbox/checkbox_active.dart';

class AvatarTextCheckbox extends StatefulWidget {
  final double avatarRadius;
  final String imagePath;
  final String text;
  final bool checked;
  final Function(bool) onChanged;

  const AvatarTextCheckbox({
    Key? key,
    required this.avatarRadius,
    required this.imagePath,
    required this.text,
    required this.checked,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<AvatarTextCheckbox> createState() => _AvatarTextCheckboxState();
}

class _AvatarTextCheckboxState extends State<AvatarTextCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: widget.avatarRadius,
          backgroundImage: AssetImage(widget.imagePath),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width *
                0.0243), // You can adjust the spacing between avatar and text
        Text(
          widget.text,
          style: AppFonts.body2(
            color: AppColors.grayscale90,
          ),
        ),

        const Spacer(), // To push the radio button to the right end of the row
        CheckBoxActive(
          checked: widget.checked,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}


// Example of use:

// SizedBox(
//               width: MediaQuery.of(context).size.width * 0.5,
//               height: MediaQuery.of(context).size.height * 0.1,
//               child: AvatarTextCheckbox(
//                 avatarRadius:
//                     30.0, // Set the desired radius for the circle avatar
//                 imagePath:
//                     'assets/avatars/120px/Duck.png', // Replace with the actual image path
//                 text:
//                     'Text', // Replace with the actual text you want to display
//                 checked:
//                     true, // Replace with the actual boolean value for the radio button state
//                 onChanged: (isActive) {
//                   // Do something when the radio button is toggled
//                   if (isActive) {
//                     // Handle the case when the radio button is active
//                   } else {
//                     // Handle the case when the radio button is not active
//                   }
//                 },
//               ),
//             ),