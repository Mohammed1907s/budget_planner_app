import 'package:budget_planner_app/utils/size_config.dart';
import 'package:flutter/material.dart';


class EButtonOnBoarding extends StatelessWidget {
  final void Function() onPressed;
  final int currentPage;
  final String text;


  EButtonOnBoarding({
   required this.onPressed,
   required this.currentPage,
   required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          currentPage != 2
              ? 'Next'
              : 'Let\'s start' ,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontSize: SizeConfig.scaleTextFont(15),
            fontWeight: FontWeight.w700,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF472FC8),
          minimumSize: Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ));
  }
}