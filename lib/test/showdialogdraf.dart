 // void _showDialog(BuildContext context, String sectionHeading) {
  //   if (sectionHeading == 'Tags') {
  //     showModalBottomSheet(
  //       context: context,
  //       isScrollControlled: true, // Set this to true to enable full-width modal
  //       builder: (BuildContext context) {
  //         return SizedBox(
  //           width: double.infinity, // Stretch to screen width
  //           child: FractionallySizedBox(
  //             heightFactor: 0.62, // Set the height factor as you desire
  //             child: Container(
  //               padding: const EdgeInsets.all(16),
  //               child: SingleChildScrollView(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     const SizedBox(height: 16),

  //                     const Text(
  //                       'Tags',
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 40,
  //                         color: Colors.black,
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       height: 25,
  //                     ),
  //                     const Text(
  //                       'Current State',
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         color: Colors.black,
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       height: 5,
  //                     ),
  //                     Row(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Expanded(
  //                           child: Tags(
  //                             text: 'Borrowed',
  //                             icon: Icons.ac_unit,
  //                             onPress: () {
  //                               // Handle tag click
  //                             },
  //                             status: TagStatus.active,
  //                           ),
  //                         ),
  //                         const SizedBox(width: 8),
  //                         Expanded(
  //                           child: Tags(
  //                             text: 'Adopted',
  //                             icon: Icons.ac_unit,
  //                             onPress: () {
  //                               // Handle tag click
  //                             },
  //                             status: TagStatus.notActive,
  //                           ),
  //                         ),
  //                         const SizedBox(width: 8),
  //                         Expanded(
  //                           child: Tags(
  //                             text: 'Donated',
  //                             icon: Icons.ac_unit,
  //                             onPress: () {
  //                               // Handle tag click
  //                             },
  //                             status: TagStatus.disabled,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     const SizedBox(
  //                       height: 5,
  //                     ),
  //                     Row(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Expanded(
  //                           child: Tags(
  //                             text: 'Escaped',
  //                             icon: Icons.ac_unit,
  //                             onPress: () {
  //                               // Handle tag click
  //                             },
  //                             status: TagStatus.active,
  //                           ),
  //                         ),
  //                         const SizedBox(width: 8),
  //                         Expanded(
  //                           child: Tags(
  //                             text: 'Stolen',
  //                             icon: Icons.ac_unit,
  //                             onPress: () {
  //                               // Handle tag click
  //                             },
  //                             status: TagStatus.notActive,
  //                           ),
  //                         ),
  //                         const SizedBox(width: 8),
  //                         Expanded(
  //                           child: Tags(
  //                             text: 'Transferred',
  //                             icon: Icons.ac_unit,
  //                             onPress: () {
  //                               // Handle tag click
  //                             },
  //                             status: TagStatus.disabled,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     const SizedBox(
  //                       height: 25,
  //                     ),
  //                     const Text(
  //                       'Medical State',
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         color: Colors.black,
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       height: 5,
  //                     ),
  //                     Row(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Expanded(
  //                           child: Tags(
  //                             text: 'Injured',
  //                             icon: Icons.ac_unit,
  //                             onPress: () {
  //                               // Handle tag click
  //                             },
  //                             status: TagStatus.active,
  //                           ),
  //                         ),
  //                         const SizedBox(width: 8),
  //                         Expanded(
  //                           child: Tags(
  //                             text: 'Sick',
  //                             icon: Icons.ac_unit,
  //                             onPress: () {
  //                               // Handle tag click
  //                             },
  //                             status: TagStatus.notActive,
  //                           ),
  //                         ),
  //                         const SizedBox(width: 8),
  //                         Expanded(
  //                           child: Tags(
  //                             text: 'Quarantined',
  //                             icon: Icons.ac_unit,
  //                             onPress: () {
  //                               // Handle tag click
  //                             },
  //                             status: TagStatus.disabled,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     const SizedBox(height: 8),
  //                     Row(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Expanded(
  //                           child: Tags(
  //                             text: 'Medication',
  //                             icon: Icons.ac_unit,
  //                             onPress: () {
  //                               // Handle tag click
  //                             },
  //                             status: TagStatus.active,
  //                           ),
  //                         ),
  //                         const SizedBox(width: 8),
  //                         Expanded(
  //                           child: Tags(
  //                             text: 'Testing',
  //                             icon: Icons.ac_unit,
  //                             onPress: () {
  //                               // Handle tag click
  //                             },
  //                             status: TagStatus.notActive,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     const SizedBox(
  //                       height: 25,
  //                     ),
  //                     const Text(
  //                       'Others',
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         color: Color.fromARGB(255, 42, 41, 41),
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       height: 5,
  //                     ),
  //                     Row(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Expanded(
  //                           child: Tags(
  //                             text: 'Sold',
  //                             icon: Icons.ac_unit,
  //                             onPress: () {
  //                               // Handle tag click
  //                             },
  //                             status: TagStatus.active,
  //                           ),
  //                         ),
  //                         const SizedBox(width: 8),
  //                         Expanded(
  //                           child: Tags(
  //                             text: 'Dead',
  //                             icon: Icons.ac_unit,
  //                             onPress: () {
  //                               // Handle tag click
  //                             },
  //                             status: TagStatus.notActive,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     const SizedBox(
  //                       height: 35,
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                       children: [
  //                         Expanded(
  //                           child: ElevatedButton(
  //                             style: ElevatedButton.styleFrom(
  //                               elevation: 0,
  //                               backgroundColor:
  //                                   const Color.fromARGB(255, 225, 225, 225),
  //                               shape: RoundedRectangleBorder(
  //                                 borderRadius: BorderRadius.circular(50),
  //                               ),
  //                             ),
  //                             onPressed: () {
  //                               // Handle cancel button press
  //                               Navigator.pop(context); // Close the modal sheet
  //                             },
  //                             child: const Padding(
  //                               padding: EdgeInsets.symmetric(vertical: 16),
  //                               child: Text('Clear All',
  //                                   style: TextStyle(color: Colors.black)),
  //                             ),
  //                           ),
  //                         ),
  //                         const SizedBox(width: 8),
  //                         Expanded(
  //                           child: ElevatedButton(
  //                             style: ElevatedButton.styleFrom(
  //                               elevation: 0,
  //                               backgroundColor:
  //                                   const Color.fromARGB(255, 36, 86, 38),
  //                               shape: RoundedRectangleBorder(
  //                                 borderRadius: BorderRadius.circular(50),
  //                               ),
  //                             ),
  //                             onPressed: () {
  //                               // Handle join farm button press
  //                               Navigator.pop(context); // Close the modal sheet
  //                             },
  //                             child: const Padding(
  //                               padding: EdgeInsets.symmetric(vertical: 16),
  //                               child: Text(
  //                                 'Apply',
  //                                 style: TextStyle(color: Colors.white),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     // You can add more widgets as needed
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //     );
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: const Text("Show More"),
  //           content: const Text("You tapped the 'Show more >' button."),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: const Text('OK'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }