import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class LabelTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final String? errorMessage;
  final ValueChanged<String>? onChanged;
  final ValueChanged<bool>? onErrorChanged; // Add this line

  const LabelTextField({
    Key? key,
    required this.hintText,
    required this.labelText,
    this.errorMessage,
    this.onChanged,
    this.onErrorChanged, // Add this line
  }) : super(key: key);

  @override
  _LabelTextFieldState createState() => _LabelTextFieldState();
}

class _LabelTextFieldState extends State<LabelTextField> {
  final TextEditingController _textEditingController = TextEditingController();
  late FocusNode _focusNode;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
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
      isFocused = _focusNode.hasFocus;
    });
  }

  void _clearText() {
    _textEditingController.clear();
    if (widget.onErrorChanged != null) {
      widget.onErrorChanged!(false); // Clear the error state
    }
  }

  void _onChanged(String value) {
    if (widget.onChanged != null) {
      widget.onChanged!(value);
      final hasNumbers = value.contains(RegExp(r'[0-9]'));
      if (widget.onErrorChanged != null) {
        widget.onErrorChanged!(hasNumbers); // Report the error state
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isTyping = _textEditingController.text.isNotEmpty;

    final Color hintTextColor =
        isTyping ? AppColors.grayscale90 : AppColors.grayscale50;

    final Color borderColor = widget.errorMessage != null
        ? AppColors.error100
        : isFocused
            ? AppColors.primary30
            : AppColors.grayscale20;

    final Color backgroundColor =
        widget.errorMessage != null ? AppColors.error10 : AppColors.grayscale0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: AppFonts.caption2(
            color: AppColors.grayscale90,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: borderColor,
              width: 1.0,
            ),
          ),
          child: TextField(
            controller: _textEditingController,
            onChanged: _onChanged,
            focusNode: _focusNode,
            onTap: () {
              _focusNode.requestFocus();
            },
            onEditingComplete: () {
              _focusNode.unfocus();
            },
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: AppFonts.body2(
                color: hintTextColor,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              border: InputBorder.none,
              suffixIcon: isTyping
                  ? IconButton(
                      onPressed: _clearText,
                      icon: Image.asset(
                        'assets/icons/frame/24px/20_Clear_form.png',
                      ),
                    )
                  : null,
            ),
            style: AppFonts.body2(
              color: AppColors.grayscale90,
            ),
          ),
        ),
        if (widget.errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              widget.errorMessage!,
              style: AppFonts.caption2(
                color: AppColors.error100,
              ),
            ),
          ),
      ],
    );
  }
}


// Example of use:

// String _enteredText = '';
// bool _hasError = false;

// LabelTextField(
//   hintText: 'Enter your username',
//   labelText: 'Text label',
//   errorMessage: _hasError ? 'Username should not contain numbers' : null,
//   onChanged: (value) {
//     setState(() {
//       _enteredText = value;
//       _hasError = value.contains(RegExp(r'[0-9]')); // Set the error state
//     });
//   },
//   onErrorChanged: (hasError) {
//     setState(() {
//       _hasError = hasError; // Update the error state
//     });
//   },
// );
