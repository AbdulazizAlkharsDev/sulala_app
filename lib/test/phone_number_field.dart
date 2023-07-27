import 'package:flutter/material.dart';
import 'package:sulala_app/src/lists/countries_data.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/inputs/draw_ups/draw_up_widget.dart';

class PhoneNumberField extends StatefulWidget {
  final String? label;
  final Function(String)? onSave;

  const PhoneNumberField({
    Key? key,
    this.label,
    this.onSave,
  }) : super(key: key);

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
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
          if (widget.label != null) // Conditionally show the label
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.label!,
                  style: AppFonts.caption2(color: AppColors.grayscale90),
                ),
                _buildPhoneNumberField(),
              ],
            ),
          if (widget.label == null) _buildPhoneNumberField(),
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

  Widget _buildPhoneNumberField() {
    return ElevatedButton(
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
                    SizedBox(width: MediaQuery.of(context).size.width * 0.025),
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
                    SizedBox(width: MediaQuery.of(context).size.width * 0.005),
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
                      _validatePhoneNumber(value);
                      setState(() {
                        phoneNumber = value;
                        if (!_hasError && widget.onSave != null) {
                          widget.onSave!(value);
                        }
                      });
                    },
                    keyboardType: TextInputType.phone,
                    style: AppFonts.body2(color: AppColors.grayscale90),
                    decoration: InputDecoration(
                      hintText: "Enter phone number",
                      border: InputBorder.none,
                      hintStyle: AppFonts.body1(color: AppColors.grayscale50),
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
        child: DrowupWidget(
          heading: 'Filter',
          content: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: ListView.builder(
                  itemCount: countriesData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.asset(countriesData[index].flagImagePath),
                      title: Text(countriesData[index].countryName),
                      subtitle: Text(countriesData[index].countryCode),
                      onTap: () {
                        // Handle country item tap here if needed
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
