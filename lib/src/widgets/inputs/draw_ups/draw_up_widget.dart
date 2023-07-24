import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class DrowupWidget extends StatelessWidget {
  final Widget content;
  final String? heading;

  const DrowupWidget({Key? key, required this.content, this.heading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.5,
      child: Container(
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
                Text(
                  heading!,
                  style: AppFonts.title3(color: AppColors.grayscale90),
                ),
              const SizedBox(height: 16),
              content,
            ],
          ),
        ),
      ),
    );
  }
}
