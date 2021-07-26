import 'package:budget_planner_app/database/db_provider.dart';
import 'package:budget_planner_app/getx_controllers/language_getx_controller.dart';
import 'package:budget_planner_app/screens/about_screen.dart';
import 'package:budget_planner_app/screens/action_home_screen/add_operation .dart';
import 'package:budget_planner_app/screens/add_category.dart';
import 'package:budget_planner_app/screens/auth/create_account_screen.dart';
import 'package:budget_planner_app/screens/auth/create_success.dart';
import 'package:budget_planner_app/screens/auth/login_screen.dart';
import 'package:budget_planner_app/screens/auth/pin_code_screen.dart';
import 'package:budget_planner_app/screens/category_screen.dart';
import 'package:budget_planner_app/screens/currency_screen.dart';
import 'package:budget_planner_app/screens/launch_screen.dart';

import 'package:budget_planner_app/screens/main_screen.dart';
import 'package:budget_planner_app/screens/onboarding_screen.dart';
import 'package:budget_planner_app/screens/settings_screen.dart';
import 'package:budget_planner_app/storge/app_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBProvider().initDatabase();
  await SharedPrefController().initSharePre();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  LanguageGetxController languageGetxController =
  Get.put(LanguageGetxController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ar'),
          const Locale('en'),
        ],
        locale: Locale(languageGetxController.languageCode.value),
        initialRoute: ('/launch_screen'),
        routes: {
          '/launch_screen': (context) => LaunchScreen(),
          '/onboarding_screen': (context) => OnBoardingScreen(),
          '/login_screen': (context) => LoginScreen(),
          '/create_account_screen': (context) => CreateAccountScreen(),
          '/create_success': (context) => CreateAccountSuccess(),
          '/settings_screen': (context) => SettingScreen(),
          '/about_screen': (context) => AboutScreen(),
          '/pin_code_screen': (context) => PinCodeScreen(),
          '/main_screen': (context) => MainScreen(),
          '/add_operation': (context) => AddOperation(),
          '/add_category': (context) => AddCategoryScreen(),
          '/category_screen': (context) => CategoryScreen(),
          //'/currency_screen': (context) => CurrencyScreen(),
        },
      );
    });
  }
}

