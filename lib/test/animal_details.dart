import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/tags/tags.dart';

class AnimalDetails extends StatefulWidget {
  final String imagePath;
  final String title;
  final String geninfo;

  const AnimalDetails({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.geninfo,
  }) : super(key: key);

  @override
  State<AnimalDetails> createState() => _AnimalDetailsState();
}

class _AnimalDetailsState extends State<AnimalDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/graphic/Animal_p.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.228,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        MediaQuery.of(context).size.width * 0.085),
                    topRight: Radius.circular(
                        MediaQuery.of(context).size.width * 0.085),
                  ),
                ),
                child: const SizedBox(),
              ),
            ),
            FractionalTranslation(
              translation:
                  Offset(0, MediaQuery.of(context).size.height * 0.00022),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.78,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.16,
                      backgroundImage: AssetImage(widget.imagePath),
                    ),
                    Text(
                      widget.title,
                      style: AppFonts.title4(color: AppColors.grayscale90),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Tags(
                          text: 'Mammal',
                          icon: null,
                          onPress: () {
                            // Handle tag click
                          },
                          status: TagStatus.active,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.021,
                        ),
                        Tags(
                          text: 'Herbivore',
                          icon: null,
                          onPress: () {
                            // Handle tag click
                          },
                          status: TagStatus.active,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.042,
                        ),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'General Information',
                                  style: AppFonts.title5(
                                    color: AppColors.grayscale90,
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.017,
                                ),
                                Text(
                                  widget.geninfo * 5,
                                  style: AppFonts.body2(
                                    color: AppColors.grayscale100,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: SizedBox(
          height: MediaQuery.of(context).size.height * 0.064,
          width: MediaQuery.of(context).size.width * 0.4,
          child: PrimaryButton(
            text: "Start your farm",
            onPressed: () {},
            status: PrimaryButtonStatus.idle,
            position: PrimaryButtonPosition.primary,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
