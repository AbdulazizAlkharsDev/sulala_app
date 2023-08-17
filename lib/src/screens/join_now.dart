import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/src/widgets/inputs/text_fields/primary_text_field.dart';

class JoinNow extends StatefulWidget {
  const JoinNow({
    Key? key,
  }) : super(key: key);

  @override
  State<JoinNow> createState() => _JoinNowState();
}

class _JoinNowState extends State<JoinNow> with SingleTickerProviderStateMixin {
  String? whoOwnTheFarm;
  String? whatIsTheNameOfYourFarm;
  bool hasError = false;

  TextEditingController whoOwnTheFarmController = TextEditingController();
  TextEditingController whatIsTheNameOfYourFarmController =
      TextEditingController();

  int _contentState = 0;

  @override
  void dispose() {
    whoOwnTheFarmController.dispose();
    whatIsTheNameOfYourFarmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        MediaQuery.of(context)
                            .viewInsets
                            .bottom, // Adjusts for keyboard
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          _contentState == 0
                              ? Column(
                                  children: [
                                    Text(
                                      "What is the name of your farm?",
                                      style: AppFonts.title2(
                                        color: AppColors.grayscale90,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                    ),
                                    PrimaryTextField(
                                      controller:
                                          whatIsTheNameOfYourFarmController,
                                      hintText: 'Farm name',
                                      errorMessage: hasError == true
                                          ? 'Field cannot be empty'
                                          : null,
                                      onChanged: (value) {
                                        setState(() {
                                          whatIsTheNameOfYourFarm = value;
                                        });
                                      },
                                      onErrorChanged: (value) {
                                        hasError = value;
                                      },
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.064,
                                      width: double.infinity,
                                      child: PrimaryButton(
                                        text: "Continue",
                                        onPressed: () {
                                          if (whatIsTheNameOfYourFarm != null) {
                                            setState(() {
                                              whatIsTheNameOfYourFarmController
                                                  .clear();
                                              _contentState = 1;
                                              hasError = false;
                                            });
                                          } else {
                                            setState(() {
                                              hasError = true;
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    Text(
                                      "Who owns the farm?",
                                      style: AppFonts.title2(
                                        color: AppColors.grayscale90,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                    ),
                                    PrimaryTextField(
                                      controller: whoOwnTheFarmController,
                                      hintText: 'Owner name',
                                      errorMessage: hasError == true
                                          ? 'Field cannot be empty'
                                          : null,
                                      onChanged: (value) {
                                        setState(() {
                                          whoOwnTheFarm = value;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.064,
                                      width: double.infinity,
                                      child: PrimaryButton(
                                        text: "Continue",
                                        onPressed: () {
                                          if (whoOwnTheFarm != null) {
                                            setState(() {
                                              whoOwnTheFarmController.clear();
                                              hasError = false;
                                              Navigator.pushNamed(
                                                  context, '/sign_up');
                                            });
                                          } else {
                                            setState(() {
                                              hasError = true;
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
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
