import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sulala_app/src/screens/guest_mode/search_page_animals.dart';
import 'package:sulala_app/src/screens/guest_mode/search_page_owner_animals.dart';
import 'package:sulala_app/src/screens/sign_in/sign_in.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:sulala_app/src/widgets/pages/main_widgets/navigation_bar.dart';
import 'package:sulala_app/src/screens/guest_mode/search_page.dart';
import 'package:sulala_app/src/screens/guest_mode/search_page_house_farm.dart';
import 'package:sulala_app/src/screens/sign_up/join_now.dart';
import 'package:sulala_app/src/screens/sign_up/sign_up.dart';
import 'package:sulala_app/src/screens/sign_up/create_password.dart';
import 'package:sulala_app/src/screens/reg_mode/notifications_list.dart';
import 'package:sulala_app/src/screens/reg_mode/reg_home_page.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.grayscale00,
        bottomSheetTheme: const BottomSheetThemeData(
          dragHandleColor: AppColors.grayscale20,
          dragHandleSize: Size(40, 4),
        ),
      ),
      title: 'Sulala App',
      home: Builder(
        builder: (context) {
          AppFonts.setWidthFactor(context);
          return const MyAppHomePage();
        },
      ),
      routes: {
        '/search': (context) => const SearchPage(),
        '/search_house_farm': (context) => const SearchPageHouseFarm(),
        '/search_animals': (context) => const SearchPageAnimals(),
        '/search_owner_animals': (context) => const SearchPageOwnerAnimals(),
        '/join_now': (context) => const JoinNow(),
        '/sign_up': (context) => const SignUp(),
        '/sign_in': (context) => const SignIn(),
        '/create_password': (context) => const CreatePassword(),
        '/reg_home_page': (context) => const RegHomePage(),
        '/notifications': (context) => NotificationList(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
