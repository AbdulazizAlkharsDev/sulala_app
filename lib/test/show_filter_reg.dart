// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/tags/tags.dart';

class ShowFilterReg extends StatelessWidget {
  const ShowFilterReg({super.key});

  @override
  Widget build(BuildContext context) {
    return 

     SizedBox(
        width: double.infinity, // Stretch to screen width
        child: FractionallySizedBox(
          heightFactor: 0.62, // Set the height factor as you desire
          child: Container(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 16),

                  Text(
                    'Tags',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Current State',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Tags(
                          text: 'Borrowed',
                          icon: Icons.ac_unit,
                          onPress: () {
                            // Handle tag click
                          },
                          status: TagStatus.active,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Tags(
                          text: 'Adopted',
                          icon: Icons.ac_unit,
                          onPress: () {
                            // Handle tag click
                          },
                          status: TagStatus.notActive,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Tags(
                          text: 'Donated',
                          icon: Icons.ac_unit,
                          onPress: () {
                            // Handle tag click
                          },
                          status: TagStatus.disabled,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Tags(
                          text: 'Escaped',
                          icon: Icons.ac_unit,
                          onPress: () {
                            // Handle tag click
                          },
                          status: TagStatus.active,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Tags(
                          text: 'Stolen',
                          icon: Icons.ac_unit,
                          onPress: () {
                            // Handle tag click
                          },
                          status: TagStatus.notActive,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Tags(
                          text: 'Transferred',
                          icon: Icons.ac_unit,
                          onPress: () {
                            // Handle tag click
                          },
                          status: TagStatus.disabled,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Medical State',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Tags(
                          text: 'Injured',
                          icon: Icons.ac_unit,
                          onPress: () {
                            // Handle tag click
                          },
                          status: TagStatus.active,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Tags(
                          text: 'Sick',
                          icon: Icons.ac_unit,
                          onPress: () {
                            // Handle tag click
                          },
                          status: TagStatus.notActive,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Tags(
                          text: 'Quarantined',
                          icon: Icons.ac_unit,
                          onPress: () {
                            // Handle tag click
                          },
                          status: TagStatus.disabled,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Tags(
                          text: 'Medication',
                          icon: Icons.ac_unit,
                          onPress: () {
                            // Handle tag click
                          },
                          status: TagStatus.active,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Tags(
                          text: 'Testing',
                          icon: Icons.ac_unit,
                          onPress: () {
                            // Handle tag click
                          },
                          status: TagStatus.notActive,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Others',
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 42, 41, 41),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Tags(
                          text: 'Sold',
                          icon: Icons.ac_unit,
                          onPress: () {
                            // Handle tag click
                          },
                          status: TagStatus.active,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Tags(
                          text: 'Dead',
                          icon: Icons.ac_unit,
                          onPress: () {
                            // Handle tag click
                          },
                          status: TagStatus.notActive,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor:
                                const Color.fromARGB(255, 225, 225, 225),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () {
                            // Handle cancel button press
                            Navigator.pop(context); // Close the modal sheet
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Text('Clear All',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor:
                                const Color.fromARGB(255, 36, 86, 38),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () {
                            // Handle join farm button press
                            Navigator.pop(context); // Close the modal sheet
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              'Apply',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // You can add more widgets as needed
                ],
              ),
            ),
          ),
        ),
      );
  }
  }
