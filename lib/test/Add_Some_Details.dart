import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/text_buttons/primary_textbutton.dart';
import 'package:sulala_app/test/Button.dart';
import 'dart:io';

import 'package:sulala_app/test/Textformfield.dart';

class AddSomeDetailsPage extends StatefulWidget {
  @override
  State<AddSomeDetailsPage> createState() => _AddSomeDetailsPageState();
}

class _AddSomeDetailsPageState extends State<AddSomeDetailsPage> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedImage =
                      await _picker.getImage(source: ImageSource.camera);
                  if (pickedImage != null) {
                    setState(() {
                      _selectedImage = File(pickedImage.path);
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedImage =
                      await _picker.getImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    setState(() {
                      _selectedImage = File(pickedImage.path);
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

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
                      _showImagePicker(context);
                    },
                    status: TextStatus.idle,
                    text: 'Add Photo',
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                const Text(
                  "What's your address?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                const CustomTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Enter Email',
                ),
                const SizedBox(height: 16),
                const CustomTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'City',
                ),
                const SizedBox(height: 80),
                ButtonWidget(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => BottomNavigationBarPage()),
                    // );
                  },
                  buttonText: 'Continue',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
