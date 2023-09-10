import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/text_buttons/primary_textbutton.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/toggles/toggle_active.dart';
import 'package:sulala_app/src/widgets/inputs/date_fields/primary_date_field.dart';
import 'package:sulala_app/src/widgets/inputs/draw_ups/draw_up_widget.dart';
import 'package:sulala_app/src/widgets/inputs/file_uploader_fields/file_uploader_field.dart';
import 'package:sulala_app/src/widgets/inputs/paragraph_text_fields/paragraph_text_field.dart';
import 'package:sulala_app/src/widgets/inputs/text_fields/primary_text_field.dart';
import 'package:sulala_app/src/screens/create_animal/drow_up_add_parents.dart';

class CompleteInfo extends StatefulWidget {
  const CompleteInfo({super.key});

  @override
  State<CompleteInfo> createState() => _CompleteInfo();
}

class _CompleteInfo extends State<CompleteInfo> {
  final TextEditingController _notesController = TextEditingController();
  String selectedName = 'Add';
  String selectedGender = '';
  bool _addParents = false;
  bool addChildren = false;
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  void _showFilterModalSheet(BuildContext context) async {
    // PermissionStatus cameraStatus = await Permission.camera.request();
    // PermissionStatus photosStatus = await Permission.photos.request();

    // if (cameraStatus.isGranted && photosStatus.isGranted) {
    showModalBottomSheet(
      showDragHandle: true,
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
                    Icons.chevron_right_rounded,
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
                    Icons.chevron_right_rounded,
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
  }

  void _showAddMotherSheet(BuildContext context) async {
    // PermissionStatus cameraStatus = await Permission.camera.request();
    // PermissionStatus photosStatus = await Permission.photos.request();

    // if (cameraStatus.isGranted && photosStatus.isGranted) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return Container(
          color: Colors.transparent,
          child: AddParentsDrowup(setState: setState),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Create Animal',
          style: AppFonts.headline3(color: AppColors.grayscale90),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: Container(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                color: AppColors.grayscale10,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(Icons.close_rounded, color: Colors.black),
            ),
            onPressed: () {
              // Handle close button press
              Navigator.pop(context);
            },
          ),
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Center(
                child: GestureDetector(
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.16,
                    backgroundColor: AppColors.grayscale10,
                    backgroundImage: _selectedImage != null
                        ? FileImage(_selectedImage!)
                        : null,
                    child: _selectedImage == null
                        ? const Icon(
                            Icons.camera_alt_outlined,
                            size: 30,
                            color: AppColors.grayscale90,
                          )
                        : null,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              Center(
                child: PrimaryTextButton(
                  status: TextStatus.idle,
                  onPressed: () {
                    _showFilterModalSheet(context);
                  },
                  text: 'Add Photo',
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.029),
              PrimaryTextField(
                  labelText: 'Name',
                  hintText: 'Enter Name',
                  controller: nameController),
              SizedBox(height: MediaQuery.of(context).size.height * 0.039),
              Text(
                "Family Tree",
                style: AppFonts.headline2(color: AppColors.grayscale90),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.009),
              Text(
                "Add Parents If They're In The System",
                style: AppFonts.body2(color: AppColors.grayscale60),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                    bottom: MediaQuery.of(context).size.height * 0.01),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Add Parents',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                    ),
                    ToggleActive(
                      value: false,
                      onChanged: (value) {
                        setState(() {
                          _addParents = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: _addParents,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.019),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Sire (Father)',
                            style: AppFonts.body2(color: AppColors.grayscale70),
                          ),
                          const Spacer(),
                          PrimaryTextButton(
                            onPressed: () {},
                            status: TextStatus.idle,
                            text: 'Add',
                            position: TextButtonPosition.right,
                          )
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.019),
                      Row(
                        children: [
                          Text(
                            'Dam (Mother)',
                            style: AppFonts.body2(color: AppColors.grayscale70),
                          ),
                          const Spacer(),
                          PrimaryTextButton(
                            onPressed: () {
                              _showAddMotherSheet(context);
                            },
                            status: TextStatus.idle,
                            text: 'Add',
                            position: TextButtonPosition.right,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.009),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                    bottom: MediaQuery.of(context).size.height * 0.01),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Add Children',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                    ),
                    ToggleActive(
                      value: false,
                      onChanged: (value) {
                        setState(() {
                          addChildren = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: addChildren,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.019),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Sire (Father)',
                            style: AppFonts.body2(color: AppColors.grayscale70),
                          ),
                          const Spacer(),
                          PrimaryTextButton(
                            onPressed: () {},
                            status: TextStatus.idle,
                            text: 'Add',
                            position: TextButtonPosition.right,
                          )
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.019),
                      Row(
                        children: [
                          Text(
                            'Dam (Mother)',
                            style: AppFonts.body2(color: AppColors.grayscale70),
                          ),
                          const Spacer(),
                          PrimaryTextButton(
                            onPressed: () {},
                            status: TextStatus.idle,
                            text: 'Add',
                            position: TextButtonPosition.right,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              const Divider(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              Text(
                "Animal Sex",
                style: AppFonts.headline2(color: AppColors.grayscale90),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.014,
                    bottom: MediaQuery.of(context).size.height * 0.014),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 'Unknown';
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Unknown',
                          style: AppFonts.body2(color: AppColors.grayscale90),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.064,
                        height: MediaQuery.of(context).size.width * 0.064,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedGender == 'Unknown'
                                ? AppColors.primary20
                                : AppColors.grayscale30,
                            width: selectedGender == 'Unknown' ? 6.0 : 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.014,
                    bottom: MediaQuery.of(context).size.height * 0.014),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 'Male';
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Male',
                          style: AppFonts.body2(color: AppColors.grayscale90),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.064,
                        height: MediaQuery.of(context).size.width * 0.064,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedGender == 'Male'
                                ? AppColors.primary20
                                : AppColors.grayscale30,
                            width: selectedGender == 'Male' ? 6.0 : 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.014,
                    bottom: MediaQuery.of(context).size.height * 0.014),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 'Female';
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Female',
                          style: AppFonts.body2(color: AppColors.grayscale90),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.064,
                        height: MediaQuery.of(context).size.width * 0.064,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedGender == 'Female'
                                ? AppColors.primary20
                                : AppColors.grayscale30,
                            width: selectedGender == 'Female' ? 6.0 : 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              const Divider(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              Text(
                "Dates",
                style: AppFonts.headline2(color: AppColors.grayscale90),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.029),
              const PrimaryDateField(
                hintText: 'DD.MM.YYYY',
                labelText: 'Date of Birth',
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.029),
              Row(
                children: [
                  PrimaryTextButton(
                    onPressed: () {},
                    status: TextStatus.idle,
                    text: 'Add Date',
                  ),
                  const Icon(Icons.add_rounded,
                      color: AppColors.primary40, size: 20),
                ],
              ),
              const Divider(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              Text(
                "Add Tag",
                style: AppFonts.headline2(color: AppColors.grayscale90),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                children: [
                  PrimaryTextButton(
                    onPressed: () {},
                    status: TextStatus.idle,
                    text: 'Add Tags',
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  const Icon(Icons.add_rounded,
                      color: AppColors.primary40, size: 20),
                ],
              ),
              const Divider(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              Text(
                "Custom Fields",
                style: AppFonts.headline2(color: AppColors.grayscale90),
              ),
              Text(
                "Add Custom Fields If Needed",
                style: AppFonts.body2(color: AppColors.grayscale60),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                children: [
                  PrimaryTextButton(
                    onPressed: () {},
                    status: TextStatus.idle,
                    text: 'Add Custom Fields',
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  const Icon(Icons.add_rounded,
                      color: AppColors.primary40, size: 20),
                ],
              ),
              const Divider(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              Text(
                "Additional Notes",
                style: AppFonts.headline2(color: AppColors.grayscale90),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ParagraphTextField(
                hintText: 'Add Any Additional Notes if Needed',
                maxLines: 8,
                onChanged: (value) {
                  setState(() {
                    _notesController.text = value;
                  });
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              SizedBox(
                height: 270,
                width: double.infinity,
                child: Focus(
                  onFocusChange: (hasFocus) {}, // Dummy onFocusChange callback
                  child: const FileUploaderField(),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.09),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: MediaQuery.of(context).size.height * 0.064,
        width: MediaQuery.of(context).size.width * 0.914,
        child: PrimaryButton(
          onPressed: () {},
          status: PrimaryButtonStatus.idle,
          text: 'Save',
        ),
      ),
    );
  }
}
