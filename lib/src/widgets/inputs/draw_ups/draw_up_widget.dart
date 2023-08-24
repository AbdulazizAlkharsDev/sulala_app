import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/text_buttons/primary_textbutton.dart';

class DrowupWidget extends StatelessWidget {
  final Widget content;
  final String? heading;
  final double? heightFactor;
  final PrimaryTextButton? primaryTextButton;

  const DrowupWidget(
      {Key? key,
      required this.content,
      this.heading,
      this.heightFactor,
      this.primaryTextButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Keyboard will resize the screen
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter, // Align to the bottom of the screen
        child: FractionallySizedBox(
          heightFactor: heightFactor ?? 0.6, // Take 70% of the screen height
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.grayscale0,
              backgroundBlendMode: null,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (heading != null)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                  heading != null
                      ? primaryTextButton != null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  heading!,
                                  style: AppFonts.title3(
                                      color: AppColors.grayscale90),
                                ),
                                primaryTextButton!,
                              ],
                            )
                          : Text(
                              heading!,
                              style:
                                  AppFonts.title3(color: AppColors.grayscale90),
                            )
                      : const SizedBox(
                          height: 0,
                        ),
                  const SizedBox(height: 16),
                  content,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Example of use:

// ElevatedButton(
//   onPressed: () {
//     _showFilterModalSheet(context);
//   },
//   child: const Text('Open Filter Modal Sheet'),
// );

// void _showFilterModalSheet(BuildContext context) {
//   showModalBottomSheet(
//     backgroundColor: Colors.transparent,
//     context: context,
//     isScrollControlled: true,
//     isDismissible: true,
//     builder: (BuildContext context) {
//       return Container(
//         color: Colors.transparent,
//         child: DrowupWidget(
//           // heading: 'Filter',
//           content: Column(
//             children: [
//               Text('Hello World'),
//               // Add Your Widgets Here
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
