import 'package:budget_planner_app/getx_controllers/add_operation_getx_controller.dart';
import 'package:budget_planner_app/getx_controllers/category_getx_controller.dart';
import 'package:budget_planner_app/models/action_home_screen.dart';
import 'package:budget_planner_app/screens/action_home_screen/add_operation .dart';
import 'package:budget_planner_app/screens/action_home_screen/categories_screen.dart';
import 'package:budget_planner_app/screens/action_home_screen/home_screen.dart';
import 'package:budget_planner_app/screens/action_home_screen/profile_screen.dart';
import 'package:budget_planner_app/screens/action_home_screen/tips_screen.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/add_action_button.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  CategoryGetxController categoryGetxController = Get.put(CategoryGetxController());
  ActionsGetxController actionGetxController = Get.put(ActionsGetxController());

  List<ActionHomeScreen> screens = <ActionHomeScreen>[
    ActionHomeScreen(title: 'Home', widget: HomeScreen()),
    ActionHomeScreen(title: 'Category', widget: CategoriesScreen()),
    ActionHomeScreen(title: '         ', widget: AddOperation()),
    ActionHomeScreen(title: 'Profile', widget: ProfileScreen()),
    ActionHomeScreen(title: 'Tips', widget: TipsScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,

        title: TextApp(
            text: screens[_currentIndex].title,
            color: Color(0xff0D0E56),
            fontSize: 20,
            fontWeight: FontWeight.w700),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xff472FC8)),

        actions: [
        Visibility(
        visible: _currentIndex == 0,
        child: IconButton(
          onPressed: () => Navigator.pushNamed(context, '/settings_screen'),
          icon: Icon(Icons.settings),
        ),
        ),Visibility(
        visible: _currentIndex == 1,
        child: IconButton(
          onPressed: () => Navigator.pushNamed(context, '/add_category'),
          icon: Icon(Icons.add_circle),
        ),
        ), ],
      ),


      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff0D0E56),
        unselectedItemColor: Color(0xffD3CFEA).withOpacity(1),
        elevation: 0,
        backgroundColor: Color(0xffFFFFFF).withOpacity(0.82),
        iconSize: SizeConfig.scaleHeight(24),
        unselectedLabelStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            fontSize: SizeConfig.scaleTextFont(10)),
        selectedLabelStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            fontSize: SizeConfig.scaleTextFont(10)),
        type: BottomNavigationBarType.fixed,
        onTap: (int currentIndex) {
          setState(() {
            _currentIndex = currentIndex;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart_outlined_outlined),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: AppLocalizations.of(context)!.categories,
          ),
          BottomNavigationBarItem(
            icon: AddActionButton(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppLocalizations.of(context)!.profile,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error_outline),
            label: AppLocalizations.of(context)!.tips,
          ),
        ],
      ),
      body: screens[_currentIndex].widget,
    );
  }
}
