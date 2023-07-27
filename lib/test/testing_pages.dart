import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/inputs/otp_fields/otp_field.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  String? savedPhoneNumber;

  void onOTPFilled(String otp) {
    // print('OTP entered: $otp');
    // Here, you can handle the entered OTP as per your backend logic.
    // For example, you can make an API call to verify the OTP, etc.
  }

  bool isOTPError(String otp) {
    // Dummy error check: Consider OTP "123456" as the correct OTP
    const correctOTP = '123456';
    return otp != correctOTP;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Example Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: OTPField(
                onFilled: onOTPFilled,
                onError: isOTPError,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
