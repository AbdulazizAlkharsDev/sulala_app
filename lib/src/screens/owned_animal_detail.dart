import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/controls_and_buttons/tags/tags.dart';
import 'package:sulala_app/src/widgets/pages/owned_animal/general_info_animal_widget.dart';

class OwnedAnimalDetails extends StatefulWidget {
  final String imagePath;
  final String title;
  final String geninfo;

  const OwnedAnimalDetails({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.geninfo,
  }) : super(key: key);

  @override
  State<OwnedAnimalDetails> createState() => _OwnedAnimalDetailsState();
}

class _OwnedAnimalDetailsState extends State<OwnedAnimalDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
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
          actions: [
            InkWell(
              onTap: () {
                // Handle edit button tap
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Image(
                    image: AssetImage(
                        'assets/icons/frame/24px/edit_icon_button.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/graphic/Animal_p.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.228,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        MediaQuery.of(context).size.width * 0.085),
                    topRight: Radius.circular(
                        MediaQuery.of(context).size.width * 0.085),
                  ),
                ),
                child: const SizedBox(), // Add your content here
              ),
            ),
            FractionalTranslation(
              translation:
                  Offset(0, MediaQuery.of(context).size.height * 0.00022),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.78,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.16,
                      backgroundImage: AssetImage(widget.imagePath),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.019,
                    ),
                    Text(
                      widget.title,
                      style: AppFonts.title4(color: AppColors.grayscale90),
                    ),
                    Text(
                      "ID #${widget.title}",
                      style: AppFonts.body2(color: AppColors.grayscale70),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.019,
                    ),
                    IntrinsicWidth(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Tags(
                            text: 'Mammal',
                            icon: Icons.pets,
                            onPress: () {
                              // Handle tag click
                            },
                            status: TagStatus.active,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.021,
                          ),
                          Tags(
                            text: 'Herbivore',
                            icon: Icons.pets,
                            onPress: () {
                              // Handle tag click
                            },
                            status: TagStatus.active,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.039,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.91,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        color: AppColors.grayscale10,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(
                          color: AppColors.primary50,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: Colors.transparent,
                        labelColor: AppColors.grayscale0,
                        unselectedLabelColor: AppColors.grayscale60,
                        labelStyle: AppFonts.body2(color: AppColors.grayscale0),
                        tabs: const [
                          Tab(text: 'General'),
                          Tab(text: 'Breeding'),
                          Tab(text: 'Medical'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: MediaQuery.of(context).size.width * 0.91,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            // Content for the 'General' tab
                            GeneralInfoAnimalWidget(
                              onDateOfBirthPressed: () {},
                              onDateOfDeathPressed: () {},
                              onDateOfMatingPressed: () {},
                              onDateOfSalePressed: () {},
                              onDateOfWeaningPressed: () {},
                              age: "3 years",
                              type: "Mammal",
                              sex: "Female",
                            ),

                            // Content for the 'Breeding' tab
                            const Center(child: Text('Breeding Tab Content')),

                            // Content for the 'Medical' tab
                            const Center(child: Text('Medical Tab Content')),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}