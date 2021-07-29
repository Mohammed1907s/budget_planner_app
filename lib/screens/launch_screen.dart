import 'package:budget_planner_app/getx_controllers/currency_getx_controller.dart';
import 'package:budget_planner_app/storge/app_pref_controller.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  CurrencyGetxController currencyGetxController = Get.put(CurrencyGetxController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      String route = SharedPrefController().isLoggedIn
          ? '/main_screen'
          : '/onboarding_screen';
      Navigator.pushReplacementNamed(context, route);
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin:
            EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(122)),

            width: SizeConfig.scaleWidth(170),
            height: SizeConfig.scaleHeight(167),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.scaleWidth(41),
                  vertical: SizeConfig.scaleHeight(24)),
              child: SvgPicture.asset('images/launch.svg'),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(45)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFE9E7F1),
                    offset: Offset(0, 10),
                    blurRadius: 18,
                    spreadRadius: 0,
                  ),
                ]),
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(29),
          ),
          Text(
            'Budget Planner',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w800,
              fontSize: SizeConfig.scaleTextFont(24),
              color: Color(0xFF0D0E56),
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
