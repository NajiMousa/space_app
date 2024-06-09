import 'package:difaf_al_wafa_app/screens/auth_screens/login_screen.dart';
import 'package:difaf_al_wafa_app/screens/auth_screens/main_auth_screen.dart';
import 'package:difaf_al_wafa_app/screens/auth_screens/otp_code_screen.dart';
import 'package:difaf_al_wafa_app/screens/drawer_menu_Screens/activities_log_screen.dart';
import 'package:difaf_al_wafa_app/screens/drawer_menu_Screens/drawer_menu_screen.dart';
import 'package:difaf_al_wafa_app/screens/drawer_menu_Screens/saved_screen.dart';
import 'package:difaf_al_wafa_app/screens/primary_screens/launch_screen.dart';
import 'package:difaf_al_wafa_app/screens/primary_screens/new_post_screen.dart';
import 'package:difaf_al_wafa_app/screens/drawer_menu_Screens/martyr_profile_screen.dart';
import 'package:difaf_al_wafa_app/screens/primary_screens/notifications_screen.dart';
import 'package:difaf_al_wafa_app/screens/primary_screens/search_screen.dart';
import 'package:difaf_al_wafa_app/screens/settings_screen_s/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/auth_screens/sing_up_screen.dart';
import 'screens/auth_screens/terms_conditions_screen.dart';
import 'screens/drawer_menu_Screens/messanger_screens/messanger_screen.dart';
import 'screens/drawer_menu_Screens/messanger_screens/single_messanger_screen.dart';
import 'screens/onbarding_screens/first_onBoarding_screen.dart';
import 'screens/onbarding_screens/second_onBoarding_screen.dart';
import 'screens/onbarding_screens/third_onBoarding_screen.dart';
import 'screens/primary_screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/launch_screen',
          home: Scaffold(
            body: Container(
              color: Colors.black,
            ),
          ),
          routes: {
            '/launch_screen': (context) => const LaunchScreen(),
            '/first_onBoarding_screen': (context) => const FirstOnBoardingScreen(),
            '/second_onBoarding_screen': (context) => const SecondOnBoardingScreen(),
            '/third_onBoarding_screen': (context) => const ThirdOnBoardingScreen(),
            '/main_screen': (context) => const MainScreen(),
            // '/single_messanger_screen': (context) => const SingleMessangerScreen(),
            '/new_post_screen': (context) => const NewPostScreen(),
            '/user_profile_screen': (context) => const UserProfileScreen(),
            '/martyr_profile_screen': (context) => MartyrProfileScreen(),
            '/login_screen': (context) => LoginScreen(),
            // '/main_auth_screen': (context) => MainAuthScreen(),
            '/sing_up_screen': (context) => SingUpScreen(),
            '/otp_code_screen': (context) => OtpCodeScreen(),
            '/terms_conditions_screen': (context) => TermsConditionsScreen(),
            // '/drawer_menu_screen': (context) => const DrawerMenuScreen(),
            '/messanger_screen': (context) => const MessangerScreen(),
            '/search_screen': (context) => const SearchScreen(),
            '/notifications_screen': (context) => const NotificationsScreen(),
            '/saved_screen': (context) => const SavedScreen(),
            '/activities_log_screen': (context) => const ActivitiesLogScreen(),
            '/single_messanger_screen': (context) => SingleMessangerScreen(),

        },
        );
      },
    );
  }
}
