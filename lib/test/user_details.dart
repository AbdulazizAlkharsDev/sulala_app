import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/icon_secondary_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/src/widgets/lists/table_lsit/table_clickable_link.dart';
import 'package:sulala_app/src/widgets/other/two_information_block.dart';

class UserDetails extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String email;
  final String phoneNumber;

  const UserDetails({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.email,
    required this.phoneNumber,
  });

  @override
  State<UserDetails> createState() => _SearchDetails();
}

class _SearchDetails extends State<UserDetails> {
  bool isHelperSelected = false;
  bool isWorkerSelected = false;
  bool isViewOnlySelected = true;
  bool isCanEditSelected = false;
  bool showList = false;
  bool isGeneralInfoSelected = false;
  bool isBreedingInfoSelected = false;
  bool isMedicalInfoSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: AppColors.grayscale90,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.042,
          0,
          MediaQuery.of(context).size.width * 0.042,
          0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.029,
              ),
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: MediaQuery.of(context).size.width * 0.16,
                  backgroundImage: AssetImage(widget.imagePath),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.019,
              ),
              Text(
                widget.title,
                style: AppFonts.title4(color: AppColors.grayscale90),
              ),
              Text(
                widget.email,
                style: AppFonts.body2(color: AppColors.primary30),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.019,
              ),
              Text(
                'House Farm',
                style: AppFonts.body2(color: AppColors.grayscale70),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.029,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: IconSecondaryButton(
                        iconPath: 'assets/icons/frame/24px/20_Status-farm.png',
                        onPressed: () {},
                        text: "Join farm",
                        status: SecondaryButtonStatus.idle,
                      ),
                    ),

                    // ElevatedButton(
                    //   onPressed: () {
                    //     showModalBottomSheet(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return SizedBox(
                    //           height: 400,
                    //           width: double.infinity,
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(8.0),
                    //             child: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 const SizedBox(height: 20),
                    //                 const Center(
                    //                   child: Text(
                    //                     'Image',
                    //                     style: TextStyle(fontSize: 50),
                    //                   ),
                    //                 ),
                    //                 const SizedBox(
                    //                   height: 20,
                    //                 ),
                    //                 const Text(
                    //                   'Join This Farm?',
                    //                   style: TextStyle(fontSize: 35),
                    //                 ),
                    //                 const SizedBox(height: 20),
                    //                 const Text(
                    //                   "If you join the farm, you won't be able to start your farm",
                    //                   style: TextStyle(fontSize: 18),
                    //                 ),
                    //                 const SizedBox(height: 20),
                    //                 Padding(
                    //                   padding: const EdgeInsets.all(12.0),
                    //                   child: Row(
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.spaceEvenly,
                    //                     children: [
                    //                       Flexible(
                    //                         child: ElevatedButton(
                    //                           onPressed: () {
                    //                             showModalBottomSheet(
                    //                               context: context,
                    //                               builder:
                    //                                   (BuildContext context) {
                    //                                 return SizedBox(
                    //                                   height: 400,
                    //                                   width: double.infinity,
                    //                                   child: Padding(
                    //                                     padding:
                    //                                         const EdgeInsets
                    //                                             .all(8.0),
                    //                                     child: Column(
                    //                                       crossAxisAlignment:
                    //                                           CrossAxisAlignment
                    //                                               .start,
                    //                                       children: [
                    //                                         const SizedBox(
                    //                                             height: 20),
                    //                                         const Center(
                    //                                           child: Text(
                    //                                             'Image',
                    //                                             style: TextStyle(
                    //                                                 fontSize:
                    //                                                     50),
                    //                                           ),
                    //                                         ),
                    //                                         const SizedBox(
                    //                                           height: 20,
                    //                                         ),
                    //                                         const Text(
                    //                                           'Join This Farm?',
                    //                                           style: TextStyle(
                    //                                               fontSize: 35),
                    //                                         ),
                    //                                         const SizedBox(
                    //                                             height: 20),
                    //                                         const Text(
                    //                                           "If you join the farm, you won't be able to start your farm",
                    //                                           style: TextStyle(
                    //                                               fontSize: 18),
                    //                                         ),
                    //                                         const SizedBox(
                    //                                             height: 20),
                    //                                         FractionallySizedBox(
                    //                                           widthFactor:
                    //                                               0.8, // Adjust the value as needed
                    //                                           child: Row(
                    //                                             mainAxisAlignment:
                    //                                                 MainAxisAlignment
                    //                                                     .spaceEvenly,
                    //                                             children: [
                    //                                               ElevatedButton(
                    //                                                 style: ElevatedButton
                    //                                                     .styleFrom(
                    //                                                   elevation:
                    //                                                       0,
                    //                                                   backgroundColor: const Color
                    //                                                       .fromARGB(
                    //                                                       255,
                    //                                                       225,
                    //                                                       225,
                    //                                                       225),
                    //                                                   shape:
                    //                                                       RoundedRectangleBorder(
                    //                                                     borderRadius:
                    //                                                         BorderRadius.circular(50),
                    //                                                   ),
                    //                                                 ),
                    //                                                 onPressed:
                    //                                                     () {
                    //                                                   // Handle cancel button press
                    //                                                   Navigator.pop(
                    //                                                       context); // Close the modal sheet
                    //                                                 },
                    //                                                 child:
                    //                                                     const Padding(
                    //                                                   padding: EdgeInsets.symmetric(
                    //                                                       vertical:
                    //                                                           16),
                    //                                                   child: Text(
                    //                                                       'Cancel'),
                    //                                                 ),
                    //                                               ),
                    //                                               ElevatedButton(
                    //                                                 style: ElevatedButton
                    //                                                     .styleFrom(
                    //                                                   elevation:
                    //                                                       0,
                    //                                                   backgroundColor: const Color
                    //                                                       .fromARGB(
                    //                                                       255,
                    //                                                       36,
                    //                                                       86,
                    //                                                       38),
                    //                                                   shape:
                    //                                                       RoundedRectangleBorder(
                    //                                                     borderRadius:
                    //                                                         BorderRadius.circular(50),
                    //                                                   ),
                    //                                                 ),
                    //                                                 onPressed:
                    //                                                     () {
                    //                                                   // Handle join farm button press
                    //                                                   Navigator.pop(
                    //                                                       context); // Close the modal sheet
                    //                                                 },
                    //                                                 child:
                    //                                                     const Padding(
                    //                                                   padding: EdgeInsets.symmetric(
                    //                                                       vertical:
                    //                                                           16),
                    //                                                   child: Text(
                    //                                                       'Join Farm'),
                    //                                                 ),
                    //                                               ),
                    //                                             ],
                    //                                           ),
                    //                                         ),
                    //                                       ],
                    //                                     ),
                    //                                   ),
                    //                                 );
                    //                               },
                    //                             );
                    //                           },
                    //                           style: ElevatedButton.styleFrom(
                    //                             elevation: 0,
                    //                             backgroundColor:
                    //                                 const Color.fromARGB(
                    //                                     255, 225, 225, 225),
                    //                             shape: RoundedRectangleBorder(
                    //                               borderRadius:
                    //                                   BorderRadius.circular(50),
                    //                             ),
                    //                           ),
                    //                           child: const Padding(
                    //                             padding: EdgeInsets.all(20.0),
                    //                             child: Row(
                    //                               mainAxisAlignment:
                    //                                   MainAxisAlignment.center,
                    //                               children: [
                    //                                 Flexible(
                    //                                   child: Text(
                    //                                     'Cancel',
                    //                                     style: TextStyle(
                    //                                         color:
                    //                                             Colors.black),
                    //                                   ),
                    //                                 ),
                    //                               ],
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                       const SizedBox(
                    //                           width:
                    //                               16), // Add a SizedBox with desired width for the gap
                    //                       Flexible(
                    //                         child: ElevatedButton(
                    //                           onPressed: () {
                    //                             // Handle button 2 press
                    //                           },
                    //                           style: ElevatedButton.styleFrom(
                    //                             elevation: 0,
                    //                             backgroundColor:
                    //                                 const Color.fromARGB(
                    //                                     255, 36, 86, 38),
                    //                             shape: RoundedRectangleBorder(
                    //                               borderRadius:
                    //                                   BorderRadius.circular(50),
                    //                             ),
                    //                           ),
                    //                           child: const Padding(
                    //                             padding: EdgeInsets.all(20.0),
                    //                             child: Row(
                    //                               mainAxisAlignment:
                    //                                   MainAxisAlignment.center,
                    //                               children: [
                    //                                 Flexible(
                    //                                   child: Text(
                    //                                     'Join Farm',
                    //                                     style: TextStyle(
                    //                                         color:
                    //                                             Colors.white),
                    //                                   ),
                    //                                 ),
                    //                               ],
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //     );
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     elevation: 0,
                    //     backgroundColor:
                    //         const Color.fromARGB(255, 225, 225, 225),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(50),
                    //     ),
                    //   ),
                    //   child: const Padding(
                    //     padding: EdgeInsets.all(8.0),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Icon(Icons.holiday_village),
                    //         SizedBox(width: 8),
                    //         Flexible(
                    //           child: Text(
                    //             'Join Farm',
                    //             style: TextStyle(color: Colors.black),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ),
                  Flexible(
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width * 0.42,
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: IconSecondaryButton(
                        iconPath:
                            'assets/icons/frame/24px/Outlined_Cow_green_icon.png',
                        onPressed: () {},
                        text: "Join farm",
                        status: SecondaryButtonStatus.idle,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              const TwoInformationBlock(head1: '24', head2: '4'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Details',
                    style: AppFonts.title5(
                      color: AppColors.grayscale90,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.017),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TableClickableText(
                      text1: 'Phone number',
                      urlText: widget.phoneNumber,
                      url: '',
                      iconPath: 'assets/icons/frame/24px/Outlined_Phone.png',
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TableClickableText(
                      text1: 'Email address',
                      urlText: widget.email,
                      url: '',
                      iconPath: 'assets/icons/frame/24px/16_Mail.png',
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.065),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.064,
                width: MediaQuery.of(context).size.width * 0.4,
                child: PrimaryButton(
                  text: 'Start your farm',
                  onPressed: () {},
                  status: PrimaryButtonStatus.idle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
