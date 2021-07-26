import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextApp(
            text: AppLocalizations.of(context)!.aboutapp,
            color: Color(0xff0D0E56),
            fontSize: 20,
            fontWeight: FontWeight.w700),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xff472FC8)),
      ),

      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin:
            EdgeInsets.only(left: SizeConfig.scaleWidth(122),right: SizeConfig.scaleWidth(122),top: SizeConfig.scaleHeight(196)),

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
          ),
          SizedBox(height: SizeConfig.scaleHeight(15),),
          TextApp(text: 'PalLancer - Flutter', color: Color(0xff0D0E56), fontSize: 18, fontWeight: FontWeight.w300),
          TextApp(text: 'Mohammed Radwan', color: Color(0xff0D0E56).withOpacity(0.47), fontSize: 15, fontWeight: FontWeight.w300),
          Spacer(),
          TextApp(text: 'V 1.0.0', color: Color(0xff0D0E56), fontSize: 15, fontWeight: FontWeight.w300,textAlign: TextAlign.center,),
          SizedBox(height: SizeConfig.scaleHeight(20),)
        ],
      ),
    );
  }
}
