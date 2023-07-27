import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/inputs/draw_ups/draw_up_widget.dart';

class DividedElevatedButton extends StatefulWidget {
  final String leftText;
  final String rightText;
  final VoidCallback? onLeftPressed;
  final VoidCallback? onRightPressed;

  const DividedElevatedButton({
    super.key,
    required this.leftText,
    required this.rightText,
    this.onLeftPressed,
    this.onRightPressed,
  });

  @override
  State<DividedElevatedButton> createState() => _DividedElevatedButtonState();
}

class _DividedElevatedButtonState extends State<DividedElevatedButton> {
  String countryCode = "+965";
  String phoneNumber = "";
  Color _borderColor = AppColors.grayscale20;
  Color _backgroundColor = AppColors.grayscale0;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  bool _hasError = false;

  void _clearText() {
    _textEditingController.clear();
    // Reset error state when clearing text
    setState(() {
      _hasError = false;
      _borderColor = AppColors.grayscale20;
      _backgroundColor = AppColors.grayscale0;
    });
  }

  void _validatePhoneNumber(String value) {
    // Check if the phone number contains only digits
    bool isValidPhoneNumber = int.tryParse(value) != null;

    setState(() {
      _hasError = !isValidPhoneNumber;
      _borderColor =
          isValidPhoneNumber ? AppColors.primary30 : AppColors.error100;
      _backgroundColor =
          isValidPhoneNumber ? AppColors.grayscale0 : AppColors.error10;
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _borderColor = _focusNode.hasFocus
          ? (_hasError ? AppColors.error100 : AppColors.primary30)
          : (_hasError ? AppColors.error100 : AppColors.grayscale20);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: _backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
                side: BorderSide(color: _borderColor, width: 1.0),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: _backgroundColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _showFilterModalSheet(context);
                      },
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        bottomLeft: Radius.circular(24.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 8.0),
                          Image.asset(
                            'assets/icons/frame/24px/FlagTest.png',
                            width: 24,
                          ),
                          Text(
                            countryCode,
                            style: AppFonts.body2(color: AppColors.grayscale90),
                          ),
                          Image.asset(
                            "assets/icons/frame/24px/16_Chevron_down.png",
                          ),
                          const SizedBox(width: 5.0),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: 1,
                    color: _borderColor,
                  ),
                  Expanded(
                    flex: 2,
                    child: Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: _textEditingController,
                          onChanged: (value) {
                            setState(() {
                              phoneNumber = value;
                            });
                            _validatePhoneNumber(value); // Validate input
                          },
                          keyboardType: TextInputType.phone,
                          style: AppFonts.body2(color: AppColors.grayscale90),
                          decoration: InputDecoration(
                            hintText: "Enter phone number",
                            border: InputBorder.none,
                            hintStyle:
                                AppFonts.body1(color: AppColors.grayscale50),
                            suffixIcon: phoneNumber.isNotEmpty
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        _clearText();
                                        phoneNumber = "";
                                      });
                                    },
                                    child: Image.asset(
                                      'assets/icons/frame/24px/20_Clear_form.png',
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_hasError)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Phone numbers can't have text",
                style: AppFonts.caption2(color: AppColors.error100),
              ),
            ),
        ],
      ),
    );
  }
}

void _showFilterModalSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    builder: (BuildContext context) {
      return Container(
        color: Colors.transparent,
        child: const DrowupWidget(
          // heading: 'Filter',
          content: Column(
            children: [
              Text('Hello World'),
              // Add Your Widgets Here
            ],
          ),
        ),
      );
    },
  );
}
