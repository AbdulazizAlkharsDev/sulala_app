import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/test/reg_home_page.dart';

class SmallCardWidget extends StatefulWidget {
  final Image icon;
  final String quan;
  final AnimalData animalData;
  final VoidCallback onPressed;

  final bool isSelected;

  const SmallCardWidget({
    Key? key,
    required this.icon,
    required this.quan,
    required this.onPressed,
    required this.animalData,
    this.isSelected = false,
  }) : super(key: key);

  @override
  State<SmallCardWidget> createState() => _SmallCardWidgetState();
}

class _SmallCardWidgetState extends State<SmallCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        if (widget
            .isSelected) // Show the back card only when isSelected is true
          Positioned.fill(
            child: Material(
              type: MaterialType.card,
              color: const Color.fromRGBO(
                  225, 219, 190, 1), // Change the color for the back card
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.037),
            ),
          ),
        Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.0073),
          child: Material(
            type: MaterialType.card,
            color: const Color.fromRGBO(249, 245, 236, 1),
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width * 0.037),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: widget.onPressed,
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.037),
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.042),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.icon,
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.014),
                    Text(widget.animalData.animal,
                        style: AppFonts.body2(color: AppColors.grayscale100)),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0034),
                    Text(widget.quan,
                        style:
                            AppFonts.headline4(color: AppColors.grayscale100)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
