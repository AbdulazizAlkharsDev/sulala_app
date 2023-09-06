import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/apple_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/google_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/text_buttons/primary_textbutton.dart';
import 'package:sulala_app/src/widgets/inputs/phone_number_field.dart/phone_number_field.dart';
import 'package:sulala_app/src/widgets/inputs/text_fields/primary_text_field.dart';
import 'package:sulala_app/src/screens/sign_up/otp_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  PrimaryButtonStatus buttonStatus = PrimaryButtonStatus.idle;
  AppleButtonStatus appleButtonStatus = AppleButtonStatus.idle;
  GoogleButtonStatus googleButtonStatus = GoogleButtonStatus.idle;
  TextStatus textStatus = TextStatus.idle;
  bool showEmailField = false;
  bool emailHasError = false;

  @override
  void dispose() {
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  String? savedEmailAddress;
  String? savedPhoneNumber;

  void saveEmailAddress(String emailAddress) {
    if (isValidEmail(emailAddress)) {
      setState(() {
        savedEmailAddress = emailAddress;
      });
    }
  }

  void savePhoneNumber(String phoneNumber) {
    if (isValidPhoneNumber(phoneNumber)) {
      setState(() {
        savedPhoneNumber = phoneNumber;
      });
    }
  }

  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegExp.hasMatch(email);
  }

  bool isValidPhoneNumber(String phoneNumber) {
    final phoneRegExp = RegExp(r'^[0-9]+$');
    return phoneRegExp.hasMatch(phoneNumber);
  }

  void navigateToPhoneOTPPage(Map<String, dynamic> option) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OTPPage(
          phoneNumber: savedPhoneNumber.toString(),
        ),
      ),
    );
  }

  void navigateToEmailOTPPage(Map<String, dynamic> option) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OTPPage(
          emailAddress: savedEmailAddress.toString(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width / 372;
    double height = MediaQuery.of(context).size.height / 812;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/graphic/Animal_p.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.228,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            MediaQuery.of(context).size.width * 0.085),
                        topRight: Radius.circular(
                            MediaQuery.of(context).size.width * 0.085),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.042,
                        0,
                        MediaQuery.of(context).size.width * 0.042,
                        MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Column(
                            children: [
                              Text(
                                "Welcome to Sulala!",
                                style: AppFonts.title2(
                                  color: AppColors.grayscale90,
                                ),
                              ),
                              SizedBox(
                                height: 8 * height,
                              ),
                              Text(
                                "Enter your phone number, and we will send you confirmation code",
                                style: AppFonts.headline4(
                                  color: AppColors.grayscale90,
                                ),
                              ),
                              SizedBox(
                                height: 40 * height,
                              ),
                              if (showEmailField)
                                PrimaryTextField(
                                  controller: emailController,
                                  hintText: 'Enter your username',
                                  errorMessage: emailHasError == true
                                      ? 'Invalid email address'
                                      : null,
                                  onChanged: (value) {
                                    setState(() {
                                      savedEmailAddress = value;
                                      emailHasError = false;
                                    });
                                  },
                                  onErrorChanged: (hasError) {
                                    setState(() {
                                      emailHasError !=
                                          hasError; // Update the error state
                                    });
                                  },
                                )
                              else
                                PhoneNumberField(onSave: (value) {
                                  setState(() {
                                    savedPhoneNumber = value;
                                  });
                                }),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.064,
                                width: double.infinity,
                                child: PrimaryButton(
                                  status: buttonStatus,
                                  text: "Continue",
                                  onPressed: () {
                                    setState(() {
                                      if (showEmailField == false) {
                                        if (savedPhoneNumber == null) {
                                          PrimaryButtonStatus.idle;
                                        } else {
                                          buttonStatus =
                                              PrimaryButtonStatus.loading;
                                          navigateToPhoneOTPPage(
                                            {
                                              "phoneNumber": savedPhoneNumber,
                                              "emailAddress": null,
                                            },
                                          );
                                        }
                                      } else {
                                        if (isValidEmail(
                                                savedEmailAddress.toString()) ==
                                            true) {
                                          emailHasError = false;
                                          buttonStatus =
                                              PrimaryButtonStatus.loading;
                                          navigateToEmailOTPPage(
                                            {
                                              "emailAddress": savedEmailAddress,
                                              "phoneNumber": null,
                                            },
                                          );
                                        } else {
                                          emailHasError = true;
                                          buttonStatus =
                                              PrimaryButtonStatus.idle;
                                        }
                                      }
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              const Divider(
                                color: AppColors.grayscale20,
                                thickness: 1,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.064,
                                width: double.infinity,
                                child: AppleButton(
                                  status: appleButtonStatus,
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.064,
                                width: double.infinity,
                                child: GoogleButton(
                                  status: googleButtonStatus,
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                              PrimaryTextButton(
                                status: textStatus,
                                text: showEmailField == false
                                    ? 'Use email address'
                                    : 'Use phone number',
                                onPressed: () {
                                  setState(
                                    () {
                                      showEmailField =
                                          !showEmailField; // Toggle the flag
                                    },
                                  );
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
