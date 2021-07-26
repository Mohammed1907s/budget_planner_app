import 'package:budget_planner_app/utils/size_config.dart';
import 'package:flutter/material.dart';

class TextApp extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign? textAlign;


  TextApp({
   required this.text,
   required this.color,
   required this.fontSize,
   required this.fontWeight, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontFamily: 'Montserrat',
        fontSize: SizeConfig.scaleTextFont(fontSize),
        fontWeight: fontWeight,
      ),

    );
  }
}

/*Text(
      'LOGIN',
      style: TextStyle(
        color: Color(0xff0D0E56),
        fontFamily: 'Montserrat',
        fontSize: SizeConfig.scaleTextFont(20),
        fontWeight: FontWeight.w700,
      ),
    );*/
