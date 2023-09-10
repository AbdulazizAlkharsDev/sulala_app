import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/tags/tags.dart';
import 'package:sulala_app/src/widgets/inputs/draw_ups/draw_up_widget.dart';
import 'package:sulala_app/src/widgets/pages/homepage_widgets/card.dart';
import 'package:sulala_app/src/screens/reg_mode/show_filter_reg.dart';
import 'package:sulala_app/src/screens/reg_mode/small_card_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:badges/badges.dart' as badges;

class RegHomePage extends StatefulWidget {
  const RegHomePage({super.key});

  @override
  State<RegHomePage> createState() => _RegHomePage();
}

class _RegHomePage extends State<RegHomePage> {
  Future<void> _refreshData() async {
    // Implement your data fetching or refreshing logic here
    // For example, you can fetch new data and update the chart, events, etc.
    setState(() {
      _chartData = getChartData();
      sumOfNextTwoCards = _chartData[0].quan + _chartData[1].quan;
      // Update other data and state variables
    });

    // // Wait for a short duration to simulate a refresh
    // await Future.delayed(const Duration(seconds: 1));

    // // Navigate back to the same page to simulate a page reload
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => const RegHomePage()),
    // );
  }

  List<Tag> currentStateTags = [
    Tag(name: 'Borrowed', status: TagStatus.notActive),
    Tag(name: 'Adopted', status: TagStatus.notActive),
    Tag(name: 'Donated', status: TagStatus.notActive),
    Tag(name: 'Escaped', status: TagStatus.notActive),
    Tag(name: 'Stolen', status: TagStatus.notActive),
    Tag(name: 'Transferred', status: TagStatus.notActive),
    // Tag(name: 'Injured', status: TagStatus.notActive),
    // Tag(name: 'Sick', status: TagStatus.notActive),
    // Tag(name: 'Quarantined', status: TagStatus.notActive),
    // Tag(name: 'Medication', status: TagStatus.notActive),
    // Tag(name: 'Testing', status: TagStatus.notActive),
    // Tag(name: 'Sold', status: TagStatus.notActive),
    // Tag(name: 'Dead', status: TagStatus.notActive),
  ];
  List<Tag> medicalStateTags = [
    // Tag(name: 'Borrowed', status: TagStatus.notActive),
    // Tag(name: 'Adopted', status: TagStatus.notActive),
    // Tag(name: 'Donated', status: TagStatus.notActive),
    // Tag(name: 'Escaped', status: TagStatus.notActive),
    // Tag(name: 'Stolen', status: TagStatus.notActive),
    // Tag(name: 'Transferred', status: TagStatus.notActive),
    Tag(name: 'Injured', status: TagStatus.notActive),
    Tag(name: 'Sick', status: TagStatus.notActive),
    Tag(name: 'Quarantined', status: TagStatus.notActive),
    Tag(name: 'Medication', status: TagStatus.notActive),
    Tag(name: 'Testing', status: TagStatus.notActive),
    // Tag(name: 'Sold', status: TagStatus.notActive),
    // Tag(name: 'Dead', status: TagStatus.notActive),
  ];

  List<Tag> otherStateTags = [
    // Tag(name: 'Borrowed', status: TagStatus.notActive),
    // Tag(name: 'Adopted', status: TagStatus.notActive),
    // Tag(name: 'Donated', status: TagStatus.notActive),
    // Tag(name: 'Escaped', status: TagStatus.notActive),
    // Tag(name: 'Stolen', status: TagStatus.notActive),
    // Tag(name: 'Transferred', status: TagStatus.notActive),
    // Tag(name: 'Injured', status: TagStatus.notActive),
    // Tag(name: 'Sick', status: TagStatus.notActive),
    // Tag(name: 'Quarantined', status: TagStatus.notActive),
    // Tag(name: 'Medication', status: TagStatus.notActive),
    // Tag(name: 'Testing', status: TagStatus.notActive),
    Tag(name: 'Sold', status: TagStatus.notActive),
    Tag(name: 'Dead', status: TagStatus.notActive),
  ];

  late List<AnimalData> _chartData;
  int sumOfNextTwoCards = 0;
  List<EventData> events = [
    // EventData(title: 'Horse Vaccination', subtitle: '09.01.2023'),
    // EventData(title: 'Cow Health Checkup', subtitle: '01.09.2023'),
    // EventData(title: 'Cow Health Checkup', subtitle: '01.09.2023'),
    // EventData(title: 'Cow Health Checkup', subtitle: '01.09.2023'),
    // EventData(title: 'Cow Health Checkup', subtitle: '01.09.2023'),
  ];
  int _selectedIndex = -1;

  void updateCurrentTagStatus(String tagName, TagStatus updatedStatus) {
    final tagIndex = currentStateTags.indexWhere((tag) => tag.name == tagName);
    if (tagIndex != -1) {
      currentStateTags[tagIndex].status = updatedStatus;
    }
  }

  void updateMedicalTagStatus(String tagName, TagStatus updatedStatus) {
    final tagIndex = medicalStateTags.indexWhere((tag) => tag.name == tagName);
    if (tagIndex != -1) {
      medicalStateTags[tagIndex].status = updatedStatus;
    }
  }

  void updateOtherTagStatus(String tagName, TagStatus updatedStatus) {
    final tagIndex = otherStateTags.indexWhere((tag) => tag.name == tagName);
    if (tagIndex != -1) {
      otherStateTags[tagIndex].status = updatedStatus;
    }
  }

  @override
  void initState() {
    _chartData = getChartData();
    sumOfNextTwoCards = _chartData[0].quan + _chartData[1].quan;
    super.initState();
  }

  void _updateChartData(int newQuan, String animalName) {
    for (int i = 0; i < _chartData.length; i++) {
      if (_chartData[i].animal == animalName) {
        _chartData[i] = AnimalData(animalName, newQuan, _chartData[i].color);
        break;
      }
    }
    setState(() {
      // Trigger a rebuild of the widget
      _selectedIndex =
          _chartData.indexWhere((data) => data.animal == animalName);
    });
  }

  void _showFilterModalSheet(BuildContext context) {
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
            heightFactor: 0.73,
            heading: "Tags",
            content: ShowFilterReg(
              currentStateTags: currentStateTags,
              medicalStateTags: medicalStateTags,
              otherStateTags: otherStateTags,
              updatedCurrentTagStatus: updateCurrentTagStatus,
              updatedMedicalTagStatus: updateMedicalTagStatus,
              updatedOtherTagStatus: updateOtherTagStatus,
            ),
          ),
        );
      },
    );
  }

  void _removeEvent(int index) {
    setState(() {
      events.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Overview',
                style: AppFonts.title3(color: AppColors.grayscale100),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/search');
                    },
                    child: const Image(
                      image:
                          AssetImage('assets/icons/frame/24px/Icon-button.png'),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.0097),
                  GestureDetector(
                    onTap: () {
                      _removeEvent(1);
                      Navigator.of(context).pushNamed('/notifications');
                    },
                    child: events.isNotEmpty
                        ? badges.Badge(
                            badgeStyle: badges.BadgeStyle(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.02),
                            ),
                            badgeContent: Text(
                              events.length.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            badgeAnimation: const badges.BadgeAnimation.slide(
                              disappearanceFadeAnimationDuration:
                                  Duration(milliseconds: 50),
                              curve: Curves.easeInCubic,
                            ),
                            child: const Image(
                              image: AssetImage(
                                  'assets/icons/frame/24px/Icon-button1.png'),
                            ),
                          )
                        : const Image(
                            image: AssetImage(
                                'assets/icons/frame/24px/Icon-button1.png'),
                          ),
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: Colors
              .transparent, // Set the appbar background color to transparent
          elevation: 0, // Remove the appbar shadow
        ),
        body: RefreshIndicator(
          color: AppColors.primary40,
          onRefresh: _refreshData,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.042,
                  right: MediaQuery.of(context).size.width * 0.042,
                  top: MediaQuery.of(context).size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Animals',
                          style: AppFonts.title4(color: AppColors.grayscale90)),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          _showFilterModalSheet(context);
                        },
                        child: const Image(
                          image:
                              AssetImage('assets/icons/frame/24px/filter1.png'),
                        ),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.058),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.014),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.182,
                        width: MediaQuery.of(context).size.width * 0.282,
                        child: SmallCardWidget(
                          icon: Image.asset(
                            "assets/icons/frame/24px/cow_chicken.png",
                            width: MediaQuery.of(context).size.width * 0.128,
                          ),
                          animalData: AnimalData(
                              'ALL', sumOfNextTwoCards, _chartData[0].color),
                          quan: sumOfNextTwoCards.toString(),
                          onPressed: () {
                            setState(() {
                              _updateChartData(sumOfNextTwoCards, 'ALL');
                            });
                          },
                          isSelected: _selectedIndex == -1,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.182,
                        width: MediaQuery.of(context).size.width * 0.282,
                        child: SmallCardWidget(
                          icon: Image.asset(
                            "assets/icons/frame/24px/cow_framed.png",
                            width: MediaQuery.of(context).size.width * 0.128,
                          ),
                          quan: _chartData[0].quan.toString(),
                          animalData: _chartData[0],
                          onPressed: () {
                            setState(() {
                              _updateChartData(_chartData[0].quan, 'Mammals');
                            });
                          },
                          isSelected: _selectedIndex == 0,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.182,
                        width: MediaQuery.of(context).size.width * 0.282,
                        child: SmallCardWidget(
                          icon: Image.asset(
                            "assets/icons/frame/24px/chicken_framed.png",
                            width: MediaQuery.of(context).size.width * 0.128,
                          ),
                          animalData: _chartData[1],
                          quan: _chartData[1].quan.toString(),
                          onPressed: () {
                            setState(() {
                              _updateChartData(_chartData[1].quan, 'Oviparous');
                            });
                          },
                          isSelected: _selectedIndex == 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.019),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.576,
                        height: MediaQuery.of(context).size.height * 0.27,
                        child: SfCircularChart(
                          margin: const EdgeInsets.all(0),
                          series: <CircularSeries>[
                            DoughnutSeries<AnimalData, String>(
                              dataSource: _chartData,
                              xValueMapper: (AnimalData data, _) => data.animal,
                              yValueMapper: (AnimalData data, _) => data.quan,
                              pointColorMapper: (AnimalData data, _) =>
                                  data.color,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: _buildLegendItems(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      if (events.isNotEmpty)
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/frame/24px/24_Warning-circled.png',
                              width: MediaQuery.of(context).size.width * 0.058,
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.032),
                          ],
                        ),
                      Text(
                        'Upcoming Events',
                        style: AppFonts.title4(color: AppColors.grayscale90),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.014),
                  if (events.isEmpty)
                    Center(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/illustrations/calendar_x.png',
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.014),
                          Text(
                            'You have no upcoming events so far',
                            style: AppFonts.body2(color: AppColors.grayscale70),
                          ),
                        ],
                      ),
                    ),
                  if (events.isNotEmpty)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.16,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: events.length,
                        itemBuilder: (context, index) {
                          EventData eventData = events[index];
                          return ListTile(
                            title: Text(eventData.title,
                                style: AppFonts.body1(
                                    color: AppColors.grayscale90)),
                            subtitle: Text(
                              eventData.subtitle,
                              style:
                                  AppFonts.body2(color: AppColors.grayscale60),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_rounded,
                                color: AppColors.primary40,
                                size:
                                    MediaQuery.of(context).size.width * 0.034),
                          );
                        },
                      ),
                    ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.039),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CardWidget(
                          color: const Color.fromRGBO(225, 236, 185, 1),
                          iconPath: 'assets/icons/frame/24px/Cow_Icon.png',
                          title: 'Searching\nfor animals?',
                          buttonText: 'Find animals',
                          onPressed: () {
                            Navigator.of(context).pushNamed('/search_animals');
                          },
                        ),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.015),
                      Expanded(
                        child: CardWidget(
                          color: const Color.fromRGBO(246, 239, 205, 1),
                          iconPath: 'assets/icons/frame/24px/Farm_house.png',
                          title: 'Searching \nfor farm?',
                          buttonText: 'Find farms',
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('/search_house_farm');
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.029),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<AnimalData> getChartData() {
    final List<AnimalData> chartData = [
      AnimalData(
        'Mammals',
        5,
        const Color.fromRGBO(175, 197, 86, 1),
      ),
      AnimalData(
        'Oviparous',
        20,
        const Color.fromRGBO(244, 233, 174, 1),
      ),
    ];
    return chartData;
  }

  List<Widget> _buildLegendItems() {
    return _chartData.map((data) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle,
              color: data.color,
              size: MediaQuery.of(context).size.width * 0.021),
          SizedBox(width: MediaQuery.of(context).size.width * 0.021),
          Text('${data.animal}: ${data.quan}'),
        ],
      );
    }).toList();
  }
}

class AnimalData {
  AnimalData(this.animal, this.quan, this.color);
  final String animal;
  final int quan;
  final Color color;
}

class EventData {
  final String title;
  final String subtitle;

  EventData({required this.title, required this.subtitle});
}

class Tag {
  final String name;
  TagStatus status;

  Tag({required this.name, required this.status});
}
