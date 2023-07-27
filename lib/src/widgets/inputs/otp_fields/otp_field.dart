import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class OTPField extends StatefulWidget {
  final void Function(String) onFilled;
  final bool Function(String) onError;

  const OTPField({Key? key, required this.onFilled, required this.onError})
      : super(key: key);

  @override
  State<OTPField> createState() => _OTPFieldState();
}

class _OTPFieldState extends State<OTPField> {
  String enteredOTP = '';
  bool hasError = false; // Track the error state
  bool isCompleted = false; // Track if all fields have been completed

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      onChanged: (value) {
        setState(() {
          enteredOTP = value;
          isCompleted = false; // Reset the completion status on every change
          hasError = false; // Reset the error status on every change
        });
      },
      onCompleted: (value) {
        setState(() {
          isCompleted = true; // Mark all fields as completed
        });

        // Check for errors only when all fields have been completed
        if (widget.onError(value)) {
          // Handle incorrect OTP entry here
          setState(() {
            hasError = true;
          });
        } else {
          // No error
          widget.onFilled(value);
        }
      },
      textStyle: AppFonts.headline3(color: AppColors.grayscale90),
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.circle,
        borderRadius: BorderRadius.circular(1.0),
        inactiveBorderWidth: 1.0,
        activeBorderWidth: 1.0,
        errorBorderWidth: 1.0,
        disabledBorderWidth: 1.0,
        selectedBorderWidth: 1.0,
        activeColor: hasError ? AppColors.error100 : AppColors.primary30,
        inactiveColor: hasError ? AppColors.error100 : AppColors.grayscale20,
        activeFillColor: hasError ? AppColors.error100 : AppColors.grayscale0,
        inactiveFillColor: hasError ? AppColors.error100 : AppColors.grayscale0,
        errorBorderColor: AppColors.error100,
        selectedColor: hasError ? AppColors.error100 : AppColors.primary30,
        disabledColor: AppColors.grayscale20,
      ),
    );
  }
}

// Example of use:

// void onOTPFilled(String otp) {
//     print('OTP entered: $otp');
//     // Here, you can handle the entered OTP as per your backend logic.
//     // For example, you can make an API call to verify the OTP, etc.
//   }

//   bool isOTPError(String otp) {
//     // Dummy error check: Consider OTP "123456" as the correct OTP
//     const correctOTP = '123456';
//     return otp != correctOTP;
//   }

// SizedBox(
//               width: MediaQuery.of(context).size.width * 0.9,
//               child: OTPField(
//                 onFilled: onOTPFilled,
//                 onError: isOTPError,
//               ),
//             ),