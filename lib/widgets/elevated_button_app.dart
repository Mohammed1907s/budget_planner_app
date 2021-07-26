import 'package:budget_planner_app/utils/size_config.dart';
import 'package:flutter/material.dart';

class ElevatedButtonApp extends StatelessWidget {
  final void Function() onPressed;
  final Color color;

  final String text;


  ElevatedButtonApp({
    required this.onPressed,
    required this.color,
    required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(text ,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontSize: SizeConfig.scaleTextFont(15),
            fontWeight: FontWeight.w700,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
          minimumSize: Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ));
  }
}