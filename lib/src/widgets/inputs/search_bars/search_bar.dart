import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class PrimarySearchBar extends StatefulWidget {
  final ValueChanged<String> onChange;
  final String hintText;

  const PrimarySearchBar({
    Key? key,
    required this.onChange,
    required this.hintText,
  }) : super(key: key);

  @override
  State<PrimarySearchBar> createState() => _PrimarySearchBarState();
}

class _PrimarySearchBarState extends State<PrimarySearchBar> {
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

  void _onChanged(String value) {
    widget.onChange(value);
    setState(() {});
  }

  void _onFocusChange() {
    setState(() {
      isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isTyping = _textEditingController.text.isNotEmpty;

    final Color hintTextColor =
        isTyping ? AppColors.grayscale90 : AppColors.grayscale50;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.grayscale0,
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: isFocused ? AppColors.primary30 : AppColors.grayscale20,
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.grayscale90,
          ),
        ),
        style: AppFonts.body2(
          color: AppColors.grayscale90,
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}



// Example of use:


//  SizedBox(
//               height: 48,
//               width: 343,
//               child: PrimarySearchBar(
//                 onChange: (value) {
//                   print('Search query: $value');
//                   print('#################');
//                 },
//                 hintText: 'Search by name or ID',
//               ),
//             ),