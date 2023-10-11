import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/src/widgets/inputs/date_fields/primary_date_field.dart';
import 'package:sulala_app/src/widgets/inputs/text_fields/primary_text_field.dart';
import '../../theme/colors/colors.dart';
import '../../theme/fonts/fonts.dart';
import '../../widgets/inputs/file_uploader_fields/file_uploader_field.dart';

class AddMedicalCheckUp extends StatefulWidget {
  const AddMedicalCheckUp({super.key});

  @override
  State<AddMedicalCheckUp> createState() => _AddMedicalCheckUpState();
}

class _AddMedicalCheckUpState extends State<AddMedicalCheckUp> {
  TextEditingController checkupNameController = TextEditingController();
  DateTime? firstDoseDate;
  DateTime? secondDoseDate;

  @override
  Widget build(BuildContext context) {
    double heightMediaQuery = MediaQuery.of(context).size.height / 812;
    double widthMediaQuery = MediaQuery.of(context).size.width / 375;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              padding: EdgeInsets.zero,
              icon: Container(
                padding: EdgeInsets.all(8 * widthMediaQuery),
                decoration: const BoxDecoration(
                    color: AppColors.grayscale10, shape: BoxShape.circle),
                child: const Icon(
                  Icons.close_rounded,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: 16 * widthMediaQuery, right: 16 * widthMediaQuery),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Add Medical Checkup",
                  style: AppFonts.title3(color: AppColors.grayscale90),
                ),
                SizedBox(
                  height: 32 * heightMediaQuery,
                ),
                PrimaryTextField(
                  hintText: 'Checkup Name',
                  controller: checkupNameController,
                  labelText: 'Checkup Name',
                ),
                SizedBox(height: 24 * heightMediaQuery),
                PrimaryDateField(
                  hintText: 'Date Of Checkup',
                  labelText: 'Date Of Checkup',
                  onChanged: (value) => setState(() => firstDoseDate = value),
                ),
                SizedBox(height: 24 * heightMediaQuery),
                PrimaryDateField(
                  hintText: 'Date Of Next Checkup',
                  labelText: 'Date Of Next Checkup',
                  onChanged: (value) => setState(() => secondDoseDate = value),
                ),
                SizedBox(height: 24 * heightMediaQuery),
                SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: Focus(
                    onFocusChange:
                        (hasFocus) {}, // Dummy onFocusChange callback
                    child: const FileUploaderField(),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          height: 52 * heightMediaQuery,
          width: 343 * widthMediaQuery,
          child: PrimaryButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: 'Save',
          ),
        ),
      ),
    );
  }
}