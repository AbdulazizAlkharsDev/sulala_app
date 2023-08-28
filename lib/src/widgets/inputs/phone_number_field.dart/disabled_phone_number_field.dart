import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class DisabledPhoneNumberField extends StatelessWidget {
  final String? label;
  final String countryCode;
  final String countryFlag;
  final String phoneNumber;

  const DisabledPhoneNumberField({
    Key? key,
    this.label,
    required this.countryCode,
    required this.countryFlag,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) // Conditionally show the label
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label!,
                style: AppFonts.caption2(color: AppColors.grayscale90),
              ),
              _buildPhoneNumberField(context),
            ],
          ),
        if (label == null) _buildPhoneNumberField(context),
      ],
    );
  }

  Widget _buildPhoneNumberField(BuildContext context) {
    return ElevatedButton(
      onPressed: null, // Disabled button, no onTap function
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: AppColors.grayscale10, // Gray background
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
          side: const BorderSide(color: AppColors.grayscale20, width: 1.0),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          color: AppColors.grayscale10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  // Disabled, no action on tap
                },
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  bottomLeft: Radius.circular(24.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.025),
                    Image.asset(
                      countryFlag,
                      width: 24,
                    ),
                    Text(
                      countryCode,
                      style: AppFonts.body2(color: AppColors.grayscale90),
                    ),
                    Icon(Icons.arrow_downward_rounded,
                        color: AppColors.primary40,
                        size: MediaQuery.of(context).size.width * 0.034),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.005),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: 1,
              color: AppColors.grayscale20, // Gray border color
            ),
            Expanded(
              flex: 2,
              child: Material(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: TextEditingController(text: phoneNumber),
                    onChanged: (value) {
                      // Disabled, no text editing allowed
                    },
                    enabled: false, // Disable text field
                    keyboardType: TextInputType.phone,
                    style: AppFonts.body2(color: AppColors.grayscale50),
                    decoration: InputDecoration(
                      hintText: "Enter phone number",
                      border: InputBorder.none,
                      hintStyle: AppFonts.body1(color: AppColors.grayscale50),
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
