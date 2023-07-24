import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class PasswordField extends StatefulWidget {
  final String? errorText;
  final void Function(String?) onPasswordChanged;

  const PasswordField({
    Key? key,
    this.errorText,
    required this.onPasswordChanged,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isFocused = false;

  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return "Password is obscured.";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters long.";
    }
    return null;
  }

  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor = AppColors.grayscale0;
    Color borderColor = AppColors.grayscale50;
    Color textColor = AppColors.grayscale90;
    Color errorColor = AppColors.error100;
    Color hintColor = AppColors.grayscale50; // Updated hint text color

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: AppFonts.caption2(color: AppColors.grayscale90),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _passwordController,
          onChanged: (value) {
            String? error = _validatePassword(value);
            setState(() {
              widget.onPasswordChanged(
                  error == null ? _hashPassword(value) : null);
            });
          },
          onTap: () {
            setState(() {
              _isFocused = true;
            });
          },
          onSubmitted: (value) {
            setState(() {
              _isFocused = false;
            });
          },
          style: AppFonts.body2(color: textColor),
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: "Enter the password",
            hintStyle:
                AppFonts.body2(color: hintColor), // Updated hint text style
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            filled: true,
            fillColor: bgColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: borderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(
                color: AppColors.primary30,
              ),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              icon: Icon(_obscureText
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined),
              color: AppColors.grayscale90,
            ),
          ),
        ),
        if (widget.errorText != null || widget.errorText == 'invalid_length')
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              widget.errorText == 'invalid_length'
                  ? "Password must be at least 8 characters long."
                  : widget.errorText!,
              style: AppFonts.caption2(color: errorColor),
            ),
          ),
      ],
    );
  }
}
