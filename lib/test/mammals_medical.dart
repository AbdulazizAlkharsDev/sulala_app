import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/text_buttons/primary_textbutton.dart';
import 'package:sulala_app/src/widgets/inputs/file_uploader_fields/file_uploader_field.dart';
import 'package:sulala_app/src/widgets/inputs/paragraph_text_fields/paragraph_text_field.dart';

import '../src/theme/colors/colors.dart';
import '../src/theme/fonts/fonts.dart';
import '../src/widgets/other/one_information_block.dart';
import '../src/widgets/other/two_information_block.dart';

class MammalsMedical extends StatefulWidget {
  const MammalsMedical({super.key});

  @override
  State<MammalsMedical> createState() => _MammalsMedicalState();
}

TextEditingController mammalmedicalNeedsController = TextEditingController();
bool _isMammalEditMode = false;
bool _isFemale = true;
String newMammalpregnantStatus = '';
String mammalpregnantStatuses = '';
String newmammalmatingdate = 'ADD';
String newmammalsonardate = 'ADD';
String newmammalexpdeliverydate = 'ADD';
DateTime? selectedmammalmatingDate;
DateTime? selectedmammalsonarDate;
DateTime? selectedmammalexpdeliveryDate;
List<String> mammalvaccineNames = ["Vaccine 1", "Vaccine 2", "Vaccine 3"];
List<String> mammalcheckUpNames = ["Check Up 1", "Check Up 2", "Check Up 3"];
List<String> mammalsurgeryNames = ["Surgery 1", "Surgery 2", "Surgery 3"];
List<VaccineDetails> mammalvaccineDetailsList = [];
List<MedicalCheckupDetails> mammalmedicalCheckupDetailsList = [];
List<SurgeryDetails> mammalsurgeryDetailsList = [];

class _MammalsMedicalState extends State<MammalsMedical> {
  void _showexpdeliveryDatePickerModalSheet() async {
    final DateTime? expdeliveryDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (expdeliveryDate != null &&
        expdeliveryDate != selectedmammalexpdeliveryDate) {
      setState(() {
        selectedmammalexpdeliveryDate = expdeliveryDate;
        newmammalexpdeliverydate = DateFormat.yMMMd().format(expdeliveryDate);
      });
    }
  }

  void _showPregnantStatusSelection() {
    double sheetHeight = MediaQuery.of(context).size.height * 0.35;
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: sheetHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Pregnancy Status',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text('Not Pregnant'),
                            trailing: mammalpregnantStatuses == 'Not Pregnant'
                                ? Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.green,
                                        width: 6.0,
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                            onTap: () {
                              setState(() {
                                mammalpregnantStatuses = 'Not Pregnant';
                              });
                            },
                          ),
                          ListTile(
                            title: const Text('Pregnant'),
                            trailing: mammalpregnantStatuses == 'Pregnant'
                                ? Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.green,
                                        width: 6.0,
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                            onTap: () {
                              setState(() {
                                mammalpregnantStatuses = 'Pregnant';
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((_) {
      setState(() {
        newMammalpregnantStatus = mammalpregnantStatuses;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double heightMediaQuery = MediaQuery.of(context).size.height / 812;
    double widthMediaQuery = MediaQuery.of(context).size.width / 375;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: widthMediaQuery * 343,
            child: const OneInformationBlock(
                head1: '29.02.2023', subtitle1: 'Next Vaccination'),
          ),
          SizedBox(
            height: heightMediaQuery * 8,
          ),
          SizedBox(
            width: 343 * widthMediaQuery,
            child: const TwoInformationBlock(
              head1: '12.02.2023',
              head2: '12.02.2023',
              subtitle1: "Last Check-up Date",
              subtitle2: 'Next Check-up Date',
            ),
          ),
          SizedBox(
            height: heightMediaQuery * 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Medical Needs',
                style: AppFonts.title5(color: AppColors.grayscale90),
              ),
              _isMammalEditMode
                  ? PrimaryTextButton(
                      status: TextStatus.idle,
                      text: 'Save',
                      onPressed: () {
                        setState(() {
                          _isMammalEditMode = false;
                        });
                      },
                    )
                  : IconButton(
                      icon: Image.asset(
                        'assets/icons/frame/24px/24_Edit.png',
                      ),
                      onPressed: () {
                        // Enter edit mode
                        setState(() {
                          _isMammalEditMode = true;
                        });
                      },
                    ),
            ],
          ),
          SizedBox(
            height: heightMediaQuery * 8,
          ),
          _isMammalEditMode
              ? Column(
                  children: [
                    SizedBox(
                      height: heightMediaQuery * 144,
                      child: ParagraphTextField(
                          maxLines: 6,
                          onChanged: (value) {
                            setState(() {
                              mammalmedicalNeedsController.text = value;
                            });
                          },
                          hintText:
                              'Be sure to include joint support medicine, antibiotics, anti-inflammatory medication, and topical antiseptics when packing your first-aid kit for your horses. If you have the essentials, you can keep your four-legged friends in the best condition possible.'),
                    ),
                    SizedBox(
                      height: heightMediaQuery * 8,
                    ),
                    SizedBox(
                      height: heightMediaQuery * 192,
                      child: const FileUploaderField(),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mammalmedicalNeedsController.text,
                      style: AppFonts.body2(color: AppColors.grayscale70),
                    ),
                    SizedBox(
                      height: heightMediaQuery * 22,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.file_copy_outlined,
                          color: AppColors.primary30,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'fileName',
                            style: AppFonts.body1(color: AppColors.grayscale90),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
          SizedBox(
            height: 16 * heightMediaQuery,
          ),
          Visibility(
            visible: _isFemale,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pregnancy Check',
                  style: AppFonts.title5(color: AppColors.grayscale90),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(right: 0, left: 0),
                  leading: Text(
                    'Count of Pregnancies',
                    style: AppFonts.body2(color: AppColors.grayscale70),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '1',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      const Icon(Icons.chevron_right_rounded,
                          color: AppColors.primary40),
                    ],
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(right: 0, left: 0),
                  leading: Text(
                    'Pregnancy status',
                    style: AppFonts.body2(color: AppColors.grayscale70),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Not Pregnant',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      const Icon(Icons.chevron_right_rounded,
                          color: AppColors.primary40),
                    ],
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(right: 0, left: 0),
                  leading: Text(
                    'Date of Mating',
                    style: AppFonts.body2(color: AppColors.grayscale70),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '29.05.2023',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      const Icon(Icons.chevron_right_rounded,
                          color: AppColors.primary40),
                    ],
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(right: 0, left: 0),
                  leading: Text(
                    'Date of sonar',
                    style: AppFonts.body2(color: AppColors.grayscale70),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '10.08.2023',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      const Icon(Icons.chevron_right_rounded,
                          color: AppColors.primary40),
                    ],
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(right: 0, left: 0),
                  leading: Text(
                    'Exp. Delivery Date',
                    style: AppFonts.body2(color: AppColors.grayscale70),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '09.09.2023',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      const Icon(Icons.chevron_right_rounded,
                          color: AppColors.primary40),
                    ],
                  ),
                ),
                SizedBox(height: 16 * heightMediaQuery),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Vaccination',
                style: AppFonts.title5(color: AppColors.grayscale90),
              ),
              PrimaryTextButton(
                onPressed: () {},
                status: TextStatus.idle,
                text: 'View More',
              ),
            ],
          ),
          SizedBox(
            height: 14 * heightMediaQuery,
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 2,
            shrinkWrap:
                true, // This allows the ListView to take only necessary space
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding: EdgeInsets.fromLTRB(
                    0, 10 * heightMediaQuery, 0, 10 * heightMediaQuery),
                leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vaccine 1",
                        style: AppFonts.headline3(color: AppColors.grayscale90),
                      ),
                      Text(
                        '15.01.2022',
                        style: AppFonts.body2(color: AppColors.grayscale70),
                      ),
                    ]),

                trailing: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.file_copy_outlined,
                      color: AppColors.primary40,
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.primary40,
                    ),
                  ],
                ),
                onTap: () {
                  // Handle the edit action here
                },
                // subtitle: Text(
                //   'First Dose Date',
                //   style: AppFonts.body2(color: AppColors.grayscale70),
                // ),
              );
            },
          ),
          Row(
            children: [
              PrimaryTextButton(
                onPressed: () {
                  // Show the VaccineEntryPage as a modal sheet
                  // showModalBottomSheet(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return VaccineEntryPage(
                  //       onSave: (vaccineName, firstDoseDate, secondDoseDate) {
                  //         // Save vaccine details to the list
                  //         setState(() {
                  //           mammalvaccineDetailsList.add(
                  //             VaccineDetails(
                  //               mammalvaccineName: vaccineName,
                  //               firstDoseDate: firstDoseDate,
                  //               secondDoseDate: secondDoseDate,
                  //             ),
                  //           );
                  //         });
                  //       },
                  //     );
                  //   },
                  // );
                },
                text: 'Add Vaccination',
                status: TextStatus.idle,
              ),
              SizedBox(
                width: 8 * widthMediaQuery,
              ),
              Icon(
                Icons.add,
                color: AppColors.primary40,
                size: 16 * widthMediaQuery,
              ),
            ],
          ),
          SizedBox(
            height: 16 * heightMediaQuery,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Medical Checkup',
                style: AppFonts.title5(color: AppColors.grayscale90),
              ),
              PrimaryTextButton(
                onPressed: () {},
                status: TextStatus.idle,
                text: 'View More',
              ),
            ],
          ),
          SizedBox(
            height: 14 * heightMediaQuery,
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 3,
            shrinkWrap:
                true, // This allows the ListView to take only necessary space
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding: EdgeInsets.fromLTRB(
                    0, 10 * heightMediaQuery, 0, 10 * heightMediaQuery),
                leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Check-Up 1",
                        style: AppFonts.headline3(color: AppColors.grayscale90),
                      ),
                      Text(
                        '15.01.2022',
                        style: AppFonts.body2(color: AppColors.grayscale70),
                      ),
                    ]),

                trailing: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.file_copy_outlined,
                      color: AppColors.primary40,
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.primary40,
                    ),
                  ],
                ),
                onTap: () {
                  // Handle the edit action here
                },
                // subtitle: Text(
                //   'First Dose Date',
                //   style: AppFonts.body2(color: AppColors.grayscale70),
                // ),
              );
            },
          ),
          Row(
            children: [
              PrimaryTextButton(
                onPressed: () {
                  // Show the VaccineEntryPage as a modal sheet
                  // showModalBottomSheet(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return VaccineEntryPage(
                  //       onSave: (vaccineName, firstDoseDate, secondDoseDate) {
                  //         // Save vaccine details to the list
                  //         setState(() {
                  //           mammalvaccineDetailsList.add(
                  //             VaccineDetails(
                  //               mammalvaccineName: vaccineName,
                  //               firstDoseDate: firstDoseDate,
                  //               secondDoseDate: secondDoseDate,
                  //             ),
                  //           );
                  //         });
                  //       },
                  //     );
                  //   },
                  // );
                },
                text: 'Add Examination Results',
                status: TextStatus.idle,
              ),
              SizedBox(
                width: 8 * widthMediaQuery,
              ),
              Icon(
                Icons.add,
                color: AppColors.primary40,
                size: 16 * widthMediaQuery,
              ),
            ],
          ),
          SizedBox(
            height: 16 * heightMediaQuery,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Surgeries Records',
                style: AppFonts.title5(color: AppColors.grayscale90),
              ),
              PrimaryTextButton(
                onPressed: () {},
                status: TextStatus.idle,
                text: 'View More',
              ),
            ],
          ),
          SizedBox(
            height: 14 * heightMediaQuery,
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 3,
            shrinkWrap:
                true, // This allows the ListView to take only necessary space
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding: EdgeInsets.fromLTRB(
                    0, 10 * heightMediaQuery, 0, 10 * heightMediaQuery),
                leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Surgeries 1",
                        style: AppFonts.headline3(color: AppColors.grayscale90),
                      ),
                      Text(
                        '15.01.2022',
                        style: AppFonts.body2(color: AppColors.grayscale70),
                      ),
                    ]),

                trailing: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.file_copy_outlined,
                      color: AppColors.primary40,
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.primary40,
                    ),
                  ],
                ),
                onTap: () {
                  // Handle the edit action here
                },
                // subtitle: Text(
                //   'First Dose Date',
                //   style: AppFonts.body2(color: AppColors.grayscale70),
                // ),
              );
            },
          ),
          Row(
            children: [
              PrimaryTextButton(
                onPressed: () {
                  // Show the VaccineEntryPage as a modal sheet
                  // showModalBottomSheet(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return VaccineEntryPage(
                  //       onSave: (vaccineName, firstDoseDate, secondDoseDate) {
                  //         // Save vaccine details to the list
                  //         setState(() {
                  //           mammalvaccineDetailsList.add(
                  //             VaccineDetails(
                  //               mammalvaccineName: vaccineName,
                  //               firstDoseDate: firstDoseDate,
                  //               secondDoseDate: secondDoseDate,
                  //             ),
                  //           );
                  //         });
                  //       },
                  //     );
                  //   },
                  // );
                },
                text: 'Add Examination Results',
                status: TextStatus.idle,
              ),
              SizedBox(
                width: 8 * widthMediaQuery,
              ),
              Icon(
                Icons.add,
                color: AppColors.primary40,
                size: 16 * widthMediaQuery,
              ),
            ],
          ),
          SizedBox(
            height: 16 * heightMediaQuery,
          ),
        ],
      ),
    );

    //                         const Padding(
    //                           padding: EdgeInsets.all(8.0),
    //                           child: Text(
    //                             'Additonal Notes',
    //                             style: TextStyle(
    //                                 fontSize: 18,
    //                                 color: Colors.black,
    //                                 fontWeight: FontWeight.bold),
    //                           ),
    //                         ),
    //                         const SizedBox(height: 12),
    //                         Padding(
    //                           padding:
    //                               const EdgeInsets.symmetric(horizontal: 16),
    //                           child: Text(
    //                             widget.mammalnotesController.text,
    //                             style: const TextStyle(
    //                               fontSize: 14,
    //                               color: Colors.black,
    //                             ),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   // Medical Tabbar View Ends
    //                 ],
    //               ),
    //             ),
    //             Container()
    //           ],
    //         ),
    //       ),

    //       // Tab Bar
    //     ),
    //   ),
    // );
  }
}

class VaccineEntryPage extends StatefulWidget {
  final Function(String, DateTime?, DateTime?) onSave;

  const VaccineEntryPage({super.key, required this.onSave});

  @override
  // ignore: library_private_types_in_public_api
  _VaccineEntryPageState createState() => _VaccineEntryPageState();
}

class _VaccineEntryPageState extends State<VaccineEntryPage> {
  TextEditingController vaccineNameController = TextEditingController();
  DateTime? firstDoseDate;
  DateTime? secondDoseDate;

  @override
  void dispose() {
    vaccineNameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, bool isFirstDose) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: isFirstDose
          ? firstDoseDate ?? DateTime.now()
          : secondDoseDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        if (isFirstDose) {
          firstDoseDate = selectedDate;
        } else {
          secondDoseDate = selectedDate;
        }
      });
    }
  }

  void _saveDataAndNavigateBack() {
    String newVaccineName = vaccineNameController.text;
    widget.onSave(newVaccineName, firstDoseDate, secondDoseDate);

    // Close the modal sheet and return to MyPage
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Add Vaccination",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Vaccine",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: vaccineNameController,
              decoration: InputDecoration(
                labelText: 'Vaccine Name',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      vaccineNameController.clear();
                    });
                  },
                ),
                hintText: 'Enter Vaccine Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
              ),
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 20),
            const Text('Add Date Of Vaccination:'),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today,
                      color: Color(0xFF245626)),
                  onPressed: () {
                    _selectDate(context, true);
                  },
                ),
              ),
              readOnly: true,
              controller: TextEditingController(
                text: firstDoseDate == null
                    ? 'Date Of Vaccination'
                    : '${firstDoseDate?.toLocal()}'.split(' ')[0],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Add Next Date Of Vaccination:'),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today,
                      color: Color(0xFF245626)),
                  onPressed: () {
                    _selectDate(context, false);
                  },
                ),
              ),
              readOnly: true,
              controller: TextEditingController(
                text: secondDoseDate == null
                    ? 'Next Date Of Vaccination'
                    : '${secondDoseDate?.toLocal()}'.split(' ')[0],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Handle file upload logic here
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                height: 150,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.file_open_outlined,
                      size: 35,
                    ),
                    Text(
                      'Upload File, PDF, Jpeg, PNG',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double
                  .infinity, // Make the button expand to full screen width
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  // Save data and navigate back to MyPage
                  _saveDataAndNavigateBack();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 36, 86, 38),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MedicalCheckupEntryPage extends StatefulWidget {
  final Function(String, DateTime?) onSave;

  const MedicalCheckupEntryPage({super.key, required this.onSave});

  @override
  // ignore: library_private_types_in_public_api
  _MedicalCheckupEntryPageState createState() =>
      _MedicalCheckupEntryPageState();
}

class _MedicalCheckupEntryPageState extends State<MedicalCheckupEntryPage> {
  TextEditingController checkupNameController = TextEditingController();
  DateTime? checkupDate;

  @override
  void dispose() {
    checkupNameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: checkupDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        checkupDate = selectedDate;
      });
    }
  }

  void _saveDataAndNavigateBack() {
    String newCheckupName = checkupNameController.text;
    widget.onSave(newCheckupName, checkupDate);

    // Close the modal sheet and return to MyPage
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Add Medical Checkup",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Checkup",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: checkupNameController,
              decoration: InputDecoration(
                labelText: 'Checkup Name',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      checkupNameController.clear();
                    });
                  },
                ),
                hintText: 'Enter Checkup Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
              ),
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 20),
            const Text('Add Checkup Date:'),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today,
                      color: Color(0xFF245626)),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
              ),
              readOnly: true,
              controller: TextEditingController(
                text: checkupDate == null
                    ? 'Checkup Date'
                    : DateFormat('yyyy-MM-dd').format(checkupDate!),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Handle file upload logic here
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                height: 150,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.file_open_outlined,
                      size: 35,
                    ),
                    Text(
                      'Upload File, PDF, Jpeg, PNG',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveDataAndNavigateBack,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 36, 86, 38),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SurgeryEntryPage extends StatefulWidget {
  final Function(String, DateTime?) onSave;

  const SurgeryEntryPage({super.key, required this.onSave});

  @override
  // ignore: library_private_types_in_public_api
  _SurgeryEntryPageState createState() => _SurgeryEntryPageState();
}

class _SurgeryEntryPageState extends State<SurgeryEntryPage> {
  TextEditingController surgeryNameController = TextEditingController();
  DateTime? surgeryDate;

  @override
  void dispose() {
    surgeryNameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: surgeryDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        surgeryDate = selectedDate;
      });
    }
  }

  void _saveDataAndNavigateBack() {
    String newSurgeryName = surgeryNameController.text;
    widget.onSave(newSurgeryName, surgeryDate);

    // Close the modal sheet and return to MyPage
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Add Surgery",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Surgery",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: surgeryNameController,
              decoration: InputDecoration(
                labelText: 'Surgery Name',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      surgeryNameController.clear();
                    });
                  },
                ),
                hintText: 'Enter Surgery Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
              ),
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 20),
            const Text('Add Surgery Date:'),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today,
                      color: Color(0xFF245626)),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
              ),
              readOnly: true,
              controller: TextEditingController(
                text: surgeryDate == null
                    ? 'Surgery Date'
                    : DateFormat('yyyy-MM-dd').format(surgeryDate!),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Handle file upload logic here
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                height: 150,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.file_open_outlined,
                      size: 35,
                    ),
                    Text(
                      'Upload File, PDF, Jpeg, PNG',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveDataAndNavigateBack,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 36, 86, 38),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VaccineDetails {
  final String mammalvaccineName;
  final DateTime? firstDoseDate;
  final DateTime? secondDoseDate;

  VaccineDetails({
    required this.mammalvaccineName,
    this.firstDoseDate,
    this.secondDoseDate,
  });
}

class MedicalCheckupDetails {
  final String mammalcheckupName;
  final DateTime? mammalcheckupDate;

  MedicalCheckupDetails({
    required this.mammalcheckupName,
    this.mammalcheckupDate,
  });
}

class SurgeryDetails {
  final String mammalsurgeryName;
  final DateTime? mammalsurgeryDate;

  SurgeryDetails({
    required this.mammalsurgeryName,
    this.mammalsurgeryDate,
  });
}
