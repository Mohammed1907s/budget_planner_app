import 'package:budget_planner_app/getx_controllers/add_operation_getx_controller.dart';
import 'package:budget_planner_app/getx_controllers/bn_getx_controller.dart';
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

  CategoryGetxController _categoryGetxController = Get.put(CategoryGetxController());
  ActionsGetxController _actionsGetxController = Get.put(ActionsGetxController());

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: BnGetxController(),
      builder: (BnGetxController controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: controller.currentIndex.value != 3
              ? Colors.white
              : Color(0xFFF1F4FF),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: controller.currentIndex.value != 3
                ? Colors.white
                : Color(0xFFF1F4FF),
            centerTitle: true,
            title: Text(controller.title,style: TextStyle(color: Color(0xFF351DB6)),),
            actions: [
              Visibility(
                visible: controller.index == 0,
                child: IconButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/settings_screen'),
                  icon: Icon(Icons.settings,color: Color(0xFF351DB6),),
                ),
              ),
              Visibility(
                visible: controller.index == 1,
                child: IconButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/add_category'),
                  icon: Icon(Icons.add_circle_outlined,color: Color(0xFF351DB6),),
                ),
              ),
            ],
          ),
          body: controller.screen,
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int currentIndex) {
              if (currentIndex != 2)
                controller.changeSelectedIndex(index: currentIndex);
            },
            currentIndex: controller.index,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xFF0D0E56),
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.scaleWidth(10),
            ),
            unselectedItemColor: Color(0xFFD3CFEA),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.scaleWidth(10),
            ),
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
        );
      },
    );
  }
}

/*class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  CategoryGetxController categoryGetxController = Get.put(CategoryGetxController());
  ActionsGetxController actionGetxController = Get.put(ActionsGetxController());

  List<ActionHomeScreen> _action_home_screens = [
    const ActionHomeScreen(title: 'Home', widget: HomeScreen()),
    const ActionHomeScreen(title: 'Category', widget: CategoriesScreen()),
    const ActionHomeScreen(title: '         ', widget: AddOperation()),
    const ActionHomeScreen(title: 'Profile', widget: ProfileScreen()),
    const ActionHomeScreen(title: 'Tips', widget: TipsScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,

        title: TextApp(
            text: _action_home_screens[_currentIndex].title,
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
            icon: Icon(Icons.dashboard),
            label: AppLocalizations.of(context)!.home,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: AppLocalizations.of(context)!.categories,
          ),
          BottomNavigationBarItem(
            icon: FloatingActionButton(
              backgroundColor: Color(0xff472FC8),

              onPressed: (){

               Navigator.pushNamed(context, '/add_operation')
              ;},
              child: Icon(Icons.add,size: 35,),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppLocalizations.of(context)!.profile,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: AppLocalizations.of(context)!.tips,
          ),
        ],
      ),
      body: _action_home_screens[_currentIndex].widget,
    );
  }
}
*/