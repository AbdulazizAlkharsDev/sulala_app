import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/text_buttons/primary_textbutton.dart';
import 'package:sulala_app/src/widgets/inputs/draw_ups/draw_up_widget.dart';

import 'package:sulala_app/src/widgets/inputs/text_fields/primary_text_field.dart';

import 'dart:io';

class AddSomeDetailsPage extends StatefulWidget {
  const AddSomeDetailsPage({super.key});

  @override
  State<AddSomeDetailsPage> createState() => _AddSomeDetailsPageState();
}

class _AddSomeDetailsPageState extends State<AddSomeDetailsPage> {
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  String? countryName;
  String? cityName;
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

// PrimaryButtonStatus buttonStatus = PrimaryButtonStatus.idle;

  void _showFilterModalSheet(BuildContext context) async {
    PermissionStatus cameraStatus = await Permission.camera.request();
    PermissionStatus photosStatus = await Permission.photos.request();

    if (cameraStatus.isGranted && photosStatus.isGranted) {
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (BuildContext context) {
          return Container(
            color: Colors.transparent,
            child: DrowupWidget(
              heightFactor: 0.22,
              content: Column(
                children: [
                  ListTile(
                    trailing: const Icon(
                      Icons.chevron_right_sharp,
                      color: AppColors.grayscale50,
                    ),
                    title: const Text('Gallery'),
                    onTap: () async {
                      Navigator.pop(context);
                      final pickedImage =
                          await _picker.pickImage(source: ImageSource.gallery);
                      if (pickedImage != null) {
                        setState(() {
                          _selectedImage = File(pickedImage.path);
                        });
                      }
                    },
                  ),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width * 0.914,
                    color: AppColors.grayscale20,
                  ),
                  ListTile(
                    trailing: const Icon(
                      Icons.chevron_right_sharp,
                      color: AppColors.grayscale50,
                    ),
                    title: const Text('Camera'),
                    onTap: () async {
                      Navigator.pop(context);
                      final pickedImage =
                          await _picker.pickImage(source: ImageSource.camera);
                      if (pickedImage != null) {
                        setState(() {
                          _selectedImage = File(pickedImage.path);
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Permission Required'),
            content: const Text(
                'This app requires camera and photos access to continue.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
  // void _showImagePicker(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return SizedBox(
  //         height: 150,
  //         child: Column(
  //           children: [
  //             ListTile(
  //               leading: const Icon(Icons.camera),
  //               title: const Text('Camera'),
  //               onTap: () async {
  //                 Navigator.pop(context);
  //                 final pickedImage =
  //                     await _picker.pickImage(source: ImageSource.camera);
  //                 if (pickedImage != null) {
  //                   setState(() {
  //                     _selectedImage = File(pickedImage.path);
  //                   });
  //                 }
  //               },
  //             ),
  //             ListTile(
  //               leading: const Icon(Icons.photo_library),
  //               title: const Text('Gallery'),
  //               onTap: () async {
  //                 Navigator.pop(context);
  //                 final pickedImage =
  //                     await _picker.pickImage(source: ImageSource.gallery);
  //                 if (pickedImage != null) {
  //                   setState(() {
  //                     _selectedImage = File(pickedImage.path);
  //                   });
  //                 }
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Container(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.016),
              decoration: BoxDecoration(
                color: AppColors.grayscale10,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              // Handle back button press
              // Add your code here
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: PrimaryTextButton(
                status: TextStatus.idle,
                text: "Skip for now",
                onPressed: () => Navigator.pop(context),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.042,
                right: MediaQuery.of(context).size.width * 0.042),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Some Details',
                  style: AppFonts.title3(color: AppColors.grayscale90),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text('Add Profile Photo',
                    style: AppFonts.headline3(color: AppColors.grayscale90)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.029),
                Center(
                  child: GestureDetector(
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.16,
                      backgroundColor: AppColors.grayscale10,
                      backgroundImage: _selectedImage != null
                          ? FileImage(_selectedImage!)
                          : null,
                      child: _selectedImage == null
                          ? Icon(
                              Icons.camera_alt_outlined,
                              size: MediaQuery.of(context).size.width * 0.064,
                              color: Colors.black,
                            )
                          : null,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.019),
                Center(
                  child: PrimaryTextButton(
                    onPressed: () {
                      _showFilterModalSheet(context);
                    },
                    status: TextStatus.idle,
                    text: 'Add Photo',
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text(
                  "What's your farm address?",
                  style: AppFonts.headline3(color: AppColors.grayscale90),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.029),
                PrimaryTextField(
                  controller: country,
                  hintText: 'Country',
                  onChanged: (value) {
                    setState(() {
                      countryName = value;
                    });
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.019),
                PrimaryTextField(
                  controller: country,
                  hintText: 'City',
                  onChanged: (value) {
                    setState(() {
                      cityName = value;
                    });
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.914,
                  height: MediaQuery.of(context).size.height * 0.064,
                  child: PrimaryButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    text: 'Save',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
