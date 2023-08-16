import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/text_buttons/primary_textbutton.dart';
import 'package:sulala_app/src/widgets/inputs/otp_fields/otp_field.dart';

class OTPPage extends StatefulWidget {
  final String phoneNumber;

  const OTPPage({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

PrimaryButtonStatus buttonStatus = PrimaryButtonStatus.idle;
TextStatus textStatus = TextStatus.idle;

class _OTPPageState extends State<OTPPage> {
  late int _remainingSeconds;
  late Timer _timer;
  bool isResendButtonVisible = false;
  bool otpErrorState = false;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = 10; // Set initial time
    _startTimer();
  }

  void onOTPFilled(String otp) {
    // Handle OTP filled logic
  }

  bool isOTPError(String otp) {
    // Dummy error check: Consider OTP "123456" as the correct OTP
    const correctOTP = '123456';
    return otp != correctOTP;
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _timer.cancel();
          isResendButtonVisible = true;
        }
      });
    });
  }

  void _resetTimer() {
    _timer.cancel();
    _remainingSeconds = 10;
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.grayscale90,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: _buildContent(),
        floatingActionButton: SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Column(
            children: [
              if (isResendButtonVisible) _buildResendButton(),
              if (!isResendButtonVisible) _buildCountdown(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              if (isResendButtonVisible)
                _buildConfirmButton(PrimaryButtonStatus.disabled, () {}),
              if (!isResendButtonVisible)
                _buildConfirmButton(buttonStatus, _onConfirmButtonPressed),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
        top: MediaQuery.of(context).size.height * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter Code",
            style: AppFonts.title2(color: AppColors.grayscale90),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.009,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text:
                      "We sent a verification code on the following\nPhone number: ",
                  style: AppFonts.body2(color: AppColors.grayscale70),
                ),
                TextSpan(
                  text: widget.phoneNumber,
                  style: AppFonts.body2(color: AppColors.primary50),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: OTPField(
              onFilled: onOTPFilled,
              onError: isOTPError,
              onErrorChange: (error) {
                setState(() {
                  otpErrorState = error;
                });
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          if (otpErrorState)
            Center(
              child: Column(
                children: [
                  Text(
                    "Invalid verification code.",
                    style: AppFonts.caption2(color: AppColors.error100),
                  ),
                  Text(
                    "Please, check the code or resend it again",
                    style: AppFonts.caption2(color: AppColors.error100),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildResendButton() {
    return PrimaryTextButton(
      onPressed: _onResendButtonPressed,
      text: "Send new code",
      status: textStatus,
    );
  }

  Widget _buildCountdown() {
    return Text(
      "Send new code in: 00:${_remainingSeconds.toString().padLeft(2, '0')}",
      style: AppFonts.body1(color: AppColors.grayscale90),
    );
  }

  Widget _buildConfirmButton(
      PrimaryButtonStatus status, VoidCallback onPressed) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.064,
      width: MediaQuery.of(context).size.width * 0.914,
      child: PrimaryButton(
        text: "Confirm",
        status: status,
        onPressed: onPressed,
      ),
    );
  }

  void _onResendButtonPressed() {
    setState(() {
      _resetTimer();
      isResendButtonVisible = false;
      buttonStatus = PrimaryButtonStatus.idle;
      otpErrorState = false;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => OTPPage(
          phoneNumber: widget.phoneNumber,
        ),
      ),
    );
  }

  void _onConfirmButtonPressed() {
    setState(() {
      buttonStatus = PrimaryButtonStatus.loading;
    });

    if (otpErrorState) {
      setState(() {
        buttonStatus = PrimaryButtonStatus.disabled;
        isResendButtonVisible = true;
      });
    }
  }
}
