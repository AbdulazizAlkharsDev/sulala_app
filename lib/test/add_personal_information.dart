import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/text_buttons/primary_textbutton.dart';
import 'package:sulala_app/test/Add_Some_Details.dart';
import 'package:sulala_app/test/Button.dart';
import 'package:sulala_app/test/PhoneNumTextFieldWidget.dart';
import 'package:sulala_app/test/Textformfield.dart';

class AddPersonalInfoPage extends StatelessWidget {
  const AddPersonalInfoPage({super.key});

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
            PrimaryTextButton(
              status: TextStatus.idle,
              text: "Skip for now",
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.042),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add Personal Information',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "What's your name?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const CustomTextFormField(
                keyboardType: TextInputType.name,
                labelText: 'Enter First Name',
              ),
              const SizedBox(height: 16),
              const CustomTextFormField(
                keyboardType: TextInputType.name,
                labelText: 'Enter Last Name',
              ),
              const SizedBox(height: 40),
              const Text(
                'Contacts',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Add contact details to help other people contact you for collaboration',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 35),
              const Text(
                'Phone number',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              PhoneNumberInputWidget(),
              const SizedBox(height: 16),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                labelText: 'Enter Email',
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddSomeDetailsPage()),
                  );
                  // Add your continue button logic here
                },
                buttonText: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
