import 'package:flutter/material.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/buttons/primary_button.dart';
import 'package:sulala_app/test/ListOfBreedingEvents.dart';
import '../src/theme/colors/colors.dart';
import '../src/theme/fonts/fonts.dart';
import '../src/widgets/controls_and_buttons/text_buttons/primary_textbutton.dart';
import '../src/widgets/inputs/date_fields/primary_date_field.dart';
import '../src/widgets/inputs/paragraph_text_fields/paragraph_text_field.dart';
import '../src/widgets/inputs/text_fields/primary_text_field.dart';

// ignore: depend_on_referenced_packages

class CreateBreedingEvents extends StatefulWidget {
  final String selectedAnimalType;
  final String selectedAnimalSpecies;
  final String selectedAnimalBreed;

  const CreateBreedingEvents(
      {super.key,
      required this.selectedAnimalType,
      required this.selectedAnimalSpecies,
      required this.selectedAnimalBreed});

  @override
  // ignore: library_private_types_in_public_api
  _CreateBreedingEvents createState() => _CreateBreedingEvents();
}

class _CreateBreedingEvents extends State<CreateBreedingEvents> {
  final TextEditingController _breedingnotesController =
      TextEditingController();
  final TextEditingController _breedingeventnumberController =
      TextEditingController();
  String selectedBreedSire = 'Add';
  String selectedBreedDam = 'Add';
  String selectedBreedPartner = 'Add';
  String selectedBreedChildren = '';
  String selectedBreedingDate = '';
  String selectedDeliveryDate = '';

  void setBreedingSelectedDate(String Breedingdate) {
    setState(() {
      selectedBreedingDate = Breedingdate;
    });
  }

  void setDeliverySelectedDate(String Deliverydate) {
    setState(() {
      selectedDeliveryDate = Deliverydate;
    });
  }

  void _showBreedSireSelectionSheet(BuildContext context) async {
    final String? newBreedSire = await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // ignore: non_constant_identifier_names
        List<Map<String, String>> BreedSireDetails = [
          {'name': 'John', 'nickname': 'Cow'},
          {'name': 'Mustang', 'nickname': 'Sheep'},
          {'name': 'Bustefal', 'nickname': 'Horse'},
          {'name': 'Coleisum', 'nickname': 'Ox'},
          {'name': 'Emily', 'nickname': 'Rabbit'},
        ];
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height *
                    1, // 75% of screen height
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Add Father",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(),
                            ),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  BreedSireDetails = [
                                    {'name': 'John', 'nickname': 'Cow'},
                                    {'name': 'Mustang', 'nickname': 'Sheep'},
                                    {'name': 'Bustefal', 'nickname': 'Horse'},
                                    {'name': 'Coleisum', 'nickname': 'Ox'},
                                    {'name': 'Emily', 'nickname': 'Rabbit'},
                                  ]
                                      .where((entry) =>
                                          entry['name']!
                                              .toLowerCase()
                                              .contains(value.toLowerCase()) ||
                                          entry['nickname']!
                                              .toLowerCase()
                                              .contains(value.toLowerCase()))
                                      .toList();
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: "Search By Name Or ID",
                                prefixIcon: Icon(Icons.search),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: BreedSireDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(BreedSireDetails[index]['name']![0]),
                            ),
                            title: Text(BreedSireDetails[index]['name']!),
                            subtitle:
                                Text(BreedSireDetails[index]['nickname']!),
                            onTap: () {
                              Navigator.pop(
                                  context, BreedSireDetails[index]['name']);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
    if (newBreedSire != null) {
      setState(() {
        selectedBreedSire = newBreedSire;
      });
    }
  }

  void _showBreedDamSelectionSheet(BuildContext context) async {
    final String? newBreedDam = await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // ignore: non_constant_identifier_names
        List<Map<String, String>> BreedDamDetails = [
          {'name': 'Mantis', 'nickname': 'Alein'},
          {'name': 'Nebula', 'nickname': 'Robot'},
          {'name': 'Rocket', 'nickname': 'Racoon'},
          {'name': 'Groot', 'nickname': 'Tree'},
          {'name': 'Peter', 'nickname': 'Human'},
        ];

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height *
                    1, // 75% of screen height
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Add Mother",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(),
                            ),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  BreedDamDetails = [
                                    {'name': 'Mantis', 'nickname': 'Alein'},
                                    {'name': 'Nebula', 'nickname': 'Robot'},
                                    {'name': 'Rocket', 'nickname': 'Racoon'},
                                    {'name': 'Groot', 'nickname': 'Tree'},
                                    {'name': 'Peter', 'nickname': 'Human'},
                                  ]
                                      .where((entry) =>
                                          entry['name']!
                                              .toLowerCase()
                                              .contains(value.toLowerCase()) ||
                                          entry['nickname']!
                                              .toLowerCase()
                                              .contains(value.toLowerCase()))
                                      .toList();
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: "Search By Name Or ID",
                                prefixIcon: Icon(Icons.search),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: BreedDamDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(BreedDamDetails[index]['name']![0]),
                            ),
                            title: Text(BreedDamDetails[index]['name']!),
                            subtitle: Text(BreedDamDetails[index]['nickname']!),
                            onTap: () {
                              Navigator.pop(
                                  context, BreedDamDetails[index]['name']);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    if (newBreedDam != null) {
      setState(() {
        selectedBreedDam = newBreedDam;
      });
    }
  }

  void _showBreedChildrenSelectionSheet(BuildContext context) async {
    List<String> selectedChildren = []; // Initialize an empty list

    await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        List<Map<String, String>> breedChildrenDetails = [
          {'name': 'Mantis', 'nickname': 'Alein'},
          {'name': 'Nebula', 'nickname': 'Robot'},
          {'name': 'Rocket', 'nickname': 'Racoon'},
          {'name': 'Groot', 'nickname': 'Tree'},
          {'name': 'Peter', 'nickname': 'Human'},
        ];

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Select Children",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(),
                            ),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  breedChildrenDetails = [
                                    {'name': 'Mantis', 'nickname': 'Alein'},
                                    {'name': 'Nebula', 'nickname': 'Robot'},
                                    {'name': 'Rocket', 'nickname': 'Racoon'},
                                    {'name': 'Groot', 'nickname': 'Tree'},
                                    {'name': 'Peter', 'nickname': 'Human'},
                                  ]
                                      .where((entry) =>
                                          entry['name']!
                                              .toLowerCase()
                                              .contains(value.toLowerCase()) ||
                                          entry['nickname']!
                                              .toLowerCase()
                                              .contains(value.toLowerCase()))
                                      .toList();
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: "Search By Name Or ID",
                                prefixIcon: Icon(Icons.search),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: breedChildrenDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String name =
                              breedChildrenDetails[index]['name']!;
                          final String nickname =
                              breedChildrenDetails[index]['nickname']!;
                          final bool isSelected =
                              selectedChildren.contains(name);

                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(name[0]),
                            ),
                            title: Text(name),
                            subtitle: Text(nickname),
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  selectedChildren.remove(name);
                                } else {
                                  selectedChildren.add(name);
                                }
                              });
                            },
                            tileColor: isSelected
                                ? Colors.blue.withOpacity(0.5)
                                : null,
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, selectedChildren);
                      },
                      child: const Text("Done"),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    if (selectedChildren.isNotEmpty) {
      setState(() {
        // Assuming you have a List<String> selectedBreedChildren
        selectedBreedChildren =
            selectedChildren.join(", "); // Join selected children into a string
      });
    }
  }

  void _showBreedPartnerSelectionSheet(BuildContext context) async {
    final String? newBreedPartner = await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // ignore: non_constant_identifier_names
        List<Map<String, String>> BreedPartnerDetails = [
          {'name': 'Mantis', 'nickname': 'Alein'},
          {'name': 'Nebula', 'nickname': 'Robot'},
          {'name': 'Rocket', 'nickname': 'Racoon'},
          {'name': 'Groot', 'nickname': 'Tree'},
          {'name': 'Peter', 'nickname': 'Human'},
        ];

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height *
                    1, // 75% of screen height
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Add Mother",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(),
                            ),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  BreedPartnerDetails = [
                                    {'name': 'Mantis', 'nickname': 'Alein'},
                                    {'name': 'Nebula', 'nickname': 'Robot'},
                                    {'name': 'Rocket', 'nickname': 'Racoon'},
                                    {'name': 'Groot', 'nickname': 'Tree'},
                                    {'name': 'Peter', 'nickname': 'Human'},
                                  ]
                                      .where((entry) =>
                                          entry['name']!
                                              .toLowerCase()
                                              .contains(value.toLowerCase()) ||
                                          entry['nickname']!
                                              .toLowerCase()
                                              .contains(value.toLowerCase()))
                                      .toList();
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: "Search By Name Or ID",
                                prefixIcon: Icon(Icons.search),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: BreedPartnerDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(
                              child:
                                  Text(BreedPartnerDetails[index]['name']![0]),
                            ),
                            title: Text(BreedPartnerDetails[index]['name']!),
                            subtitle:
                                Text(BreedPartnerDetails[index]['nickname']!),
                            onTap: () {
                              Navigator.pop(
                                  context, BreedPartnerDetails[index]['name']);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    if (newBreedPartner != null) {
      setState(() {
        selectedBreedPartner = newBreedPartner;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double heightMediaQuery = MediaQuery.of(context).size.height / 812;
    double widthMediaQuery = MediaQuery.of(context).size.width / 375;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Harry',
          style: AppFonts.headline3(color: AppColors.grayscale90),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grayscale10,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: 16.0 * widthMediaQuery, right: 16.0 * widthMediaQuery),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Event',
                style: AppFonts.title3(color: AppColors.grayscale90),
              ),
              SizedBox(height: 24 * heightMediaQuery),
              PrimaryTextField(
                controller: _breedingeventnumberController,
                hintText: 'Enter Breeding Number',
                labelText: 'Breeding Number',
              ),
              SizedBox(height: 16 * heightMediaQuery),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Breeding ID',
                    style: AppFonts.body2(color: AppColors.grayscale70),
                  ),
                  Text(
                    '001-1',
                    style: AppFonts.body2(color: AppColors.grayscale90),
                  ),
                ],
              ),
              SizedBox(
                height: 10 * heightMediaQuery,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sire (Father)',
                    style: AppFonts.body2(color: AppColors.grayscale70),
                  ),
                  PrimaryTextButton(
                    status: TextStatus.idle,
                    text: selectedBreedSire,
                    onPressed: () {
                      _showBreedSireSelectionSheet(context);
                    },
                    position: TextButtonPosition.right,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dam (Mother)',
                    style: AppFonts.body2(color: AppColors.grayscale70),
                  ),
                  PrimaryTextButton(
                    status: TextStatus.idle,
                    text: selectedBreedDam,
                    onPressed: () {
                      _showBreedDamSelectionSheet(context);
                    },
                    position: TextButtonPosition.right,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Breeding Partner',
                    style: AppFonts.body2(color: AppColors.grayscale70),
                  ),
                  PrimaryTextButton(
                    status: TextStatus.idle,
                    text: selectedBreedPartner,
                    onPressed: () {
                      _showBreedPartnerSelectionSheet(context);
                    },
                    position: TextButtonPosition.right,
                  ),
                ],
              ),
              SizedBox(height: 10 * heightMediaQuery),
              PrimaryDateField(
                labelText: 'Breeding Date',
                hintText: 'DD/MM/YYYY',
                onChanged: (value) {
                  setState(() {
                    selectedBreedingDate = value.toString();
                  });
                },
              ),
              SizedBox(height: 20 * heightMediaQuery),
              PrimaryDateField(
                labelText: 'Delivery Date',
                hintText: 'DD/MM/YYYY',
                onChanged: (value) {
                  setState(() {
                    selectedDeliveryDate = value.toString();
                  });
                },
              ),
              SizedBox(height: 34 * heightMediaQuery),
              Text(
                "Children",
                style: AppFonts.title5(color: AppColors.grayscale90),
              ),
              SizedBox(height: 16 * heightMediaQuery),
              if (selectedBreedChildren.isNotEmpty)
                Text(
                  selectedBreedChildren,
                  style: AppFonts.body1(color: AppColors.primary40),
                ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      _showBreedChildrenSelectionSheet(context);
                    },
                    child: Text(
                      "Add Children",
                      style: AppFonts.body1(color: AppColors.primary40),
                    ),
                  ),
                  const Icon(Icons.add, color: AppColors.primary40),
                ],
              ),
              SizedBox(height: 24 * heightMediaQuery),
              Text(
                "Notes",
                style: AppFonts.title5(color: AppColors.grayscale90),
              ),
              SizedBox(height: 20 * heightMediaQuery),
              ParagraphTextField(
                hintText: 'Add Notes',
                maxLines: 6,
                onChanged: (value) {
                  setState(() {
                    _breedingnotesController.text = value;
                  });
                },
              ),
              SizedBox(height: 85 * heightMediaQuery),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 52 * heightMediaQuery,
        width: 343 * widthMediaQuery,
        child: PrimaryButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListOfBreedingEvents(
                  breedingNotesController: _breedingnotesController,
                  breedingEventNumberController: _breedingeventnumberController,
                  selectedBreedSire: selectedBreedSire,
                  selectedBreedDam: selectedBreedDam,
                  selectedBreedPartner: selectedBreedPartner,
                  selectedBreedChildren: selectedBreedChildren,
                  selectedBreedingDate: selectedBreedingDate,
                  selectedDeliveryDate: selectedDeliveryDate,
                ),
              ),
            );
          },
          text: 'Create Event',
        ),
      ),
    );
  }
}
