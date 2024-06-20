import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:difaf_al_wafa_app/providers/language_provider.dart';
import 'package:difaf_al_wafa_app/providers/theme_provider.dart';
import 'package:difaf_al_wafa_app/screens/add_new_screens/add_group_screen.dart';
import 'package:difaf_al_wafa_app/screens/add_new_screens/add_initiative_screen.dart';
import 'package:difaf_al_wafa_app/screens/add_new_screens/new%20_martyrs_profile_screen.dart';
import 'package:difaf_al_wafa_app/screens/auth_screens/login_screen.dart';
import 'package:difaf_al_wafa_app/screens/auth_screens/otp_code_screen.dart';
import 'package:difaf_al_wafa_app/screens/drawer_menu_Screens/other_main_screens/activities_log_screen.dart';
import 'package:difaf_al_wafa_app/screens/other_text_screens/about_us_screen.dart';
import 'package:difaf_al_wafa_app/screens/drawer_menu_Screens/messanger_screens/edit_user_profile_page_screen.dart';
import 'package:difaf_al_wafa_app/screens/drawer_menu_Screens/other_main_screens/saved_screen.dart';
import 'package:difaf_al_wafa_app/screens/primary_screens/launch_screen.dart';
import 'package:difaf_al_wafa_app/screens/add_new_screens/new_post_screen.dart';
import 'package:difaf_al_wafa_app/screens/profile_screens/martyr_profile_screen.dart';
import 'package:difaf_al_wafa_app/screens/primary_screens/notifications_screen.dart';
import 'package:difaf_al_wafa_app/screens/primary_screens/search_screen.dart';
import 'package:difaf_al_wafa_app/screens/profile_screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import 'screens/auth_screens/sing_up_screen.dart';
import 'screens/other_text_screens/terms_conditions_screen.dart';
import 'screens/drawer_menu_Screens/messanger_screens/messanger_screen.dart';
import 'screens/drawer_menu_Screens/messanger_screens/single_messanger_screen.dart';
import 'screens/onbarding_screens/first_onBoarding_screen.dart';
import 'screens/onbarding_screens/second_onBoarding_screen.dart';
import 'screens/onbarding_screens/third_onBoarding_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initSharedPref();
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider(), child: MyApp(),),
        ChangeNotifierProvider<LanguageProvider>(
            create: (_) => LanguageProvider()),
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp(

          themeMode: themeProvider.themeMode,
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          //   brightness: Brightness.light,
          // ),
          // darkTheme: ThemeData(
          //   primarySwatch: Colors.blue,
          //   brightness: Brightness.dark,
          // ),


          // theme: ThemeData(
          //   // primarySwatch: Colors.blueGrey,
          //   brightness: Brightness.light,
          //   primaryColor: HexColor('#333333'),
          //   hintColor: HexColor('#8C9EA0'),
          //   textTheme: TextTheme(
          //     bodyLarge: TextStyle(color: HexColor('#333333')),
          //     bodyMedium:
          //         TextStyle(color: HexColor('#333333').withOpacity(0.7)),
          //   ),
          //   buttonTheme: ButtonThemeData(
          //     buttonColor: HexColor('#333333'),
          //     textTheme: ButtonTextTheme.accent,
          //   ),
          //   appBarTheme: AppBarTheme(
          //     color: HexColor('#FFFFFF'),
          //     iconTheme: IconThemeData(color: HexColor('#333333')),
          //   ),
          //   // colorScheme: ColorScheme(background: Colors.white),
          // ),
          darkTheme: ThemeData(
            // primarySwatch: Colors.blue,
            brightness: Brightness.dark,
            primaryColor: Colors.white,
            hintColor: Colors.white10,
            textTheme: TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white70),
            ),
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.white,
              textTheme: ButtonTextTheme.primary,
            ),
            appBarTheme: AppBarTheme(
              color: HexColor('#333333'),
              iconTheme: IconThemeData(color: Colors.white),
            ),
            // colorScheme: ColorScheme(background: HexColor('#333333')),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: '/launch_screen',
          home: Scaffold(
            body: Container(
              color: Colors.black,
            ),
          ),
          locale: Locale(Provider.of<LanguageProvider>(context).language),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          localeResolutionCallback: (locale, supportedLocales) {
            if (locale == null) {
              return supportedLocales.first;
            }
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },

          routes: {
            '/launch_screen': (context) => const LaunchScreen(),
            '/first_onBoarding_screen': (context) =>
                 FirstOnBoardingScreen(),
            '/second_onBoarding_screen': (context) =>
                 SecondOnBoardingScreen(),
            '/third_onBoarding_screen': (context) =>
                 ThirdOnBoardingScreen(),
            // '/main_screen': (context) => const MainScreen(),
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
            '/activities_log_screen': (context) =>
                const ActivitiesLogScreen(),
            '/single_messanger_screen': (context) => SingleMessangerScreen(),
            '/new _martyrs_profile_screen': (context) =>
                NewMartyrsProfileScreen(),
            '/about_us_screen': (context) => AboutUsScreen(),
            '/edit_user_profile_page_screen': (context) =>
                EditUserProfilePageScreen(),
            '/add_initiative_screen': (context) => AddInitiativeScreen(),
            '/add_group_screen': (context) => AddGroupScreen(),
          },

        );

      },

    );

  }
}
