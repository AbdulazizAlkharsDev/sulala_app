import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/src/widgets/inputs/password_fields/password_field.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({
    Key? key,
  }) : super(key: key);

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

String errorMessage = "";
String? enteredPassword;
String? enteredConfirmPassword;
bool isPasswordValid = false;
bool doesPasswordMatch = false;
PrimaryButtonStatus buttonStatus = PrimaryButtonStatus.idle;

class _CreatePasswordState extends State<CreatePassword> {
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
        body: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            top: MediaQuery.of(context).size.height * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Password",
                style: AppFonts.title2(color: AppColors.grayscale90),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              PasswordField(
                hintText: 'Password',
                errorMessage: doesPasswordMatch
                    ? 'Passwords do not match'
                    : isPasswordValid
                        ? 'Password should be at least 8 characters long and contain at least one number'
                        : null,
                onChanged: (value) {
                  setState(() {
                    enteredPassword = value;
                    isPasswordValid = false;
                    doesPasswordMatch = false;
                  });
                },
              ),
              PasswordField(
                hintText: 'Confirm Password',
                errorMessage: doesPasswordMatch
                    ? 'Passwords do not match'
                    : isPasswordValid
                        ? 'Password should be at least 8 characters long and contain at least one number'
                        : null,
                onChanged: (value) {
                  setState(() {
                    enteredConfirmPassword = value;
                    isPasswordValid = false;
                    doesPasswordMatch = false;
                  });
                },
                onErrorChanged: (hasError) {
                  setState(() {
                    isPasswordValid = hasError; // Update the error state
                  });
                },
              ),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          height: MediaQuery.of(context).size.height * 0.064,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.064,
                width: MediaQuery.of(context).size.width * 0.914,
                child: PrimaryButton(
                    text: "Confirm",
                    status: buttonStatus,
                    onPressed: () {
                      if (enteredPassword != null) {
                        if (enteredPassword == enteredConfirmPassword) {
                          isPasswordValid = false;
                          // print("Passwords match");
                          if (enteredPassword!.length >= 8 &&
                              enteredPassword!.contains(RegExp(r'[0-9]'))) {
                            doesPasswordMatch = false;
                            // print("Password is valid");
                            setState(() {
                              buttonStatus = PrimaryButtonStatus.loading;
                            });
                            Navigator.pushNamed(context, '/');
                          } else {
                            setState(() {
                              isPasswordValid = true;
                            });
                          }
                        } else {
                          setState(() {
                            doesPasswordMatch = true;
                          });
                        }
                      }
                    }),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
