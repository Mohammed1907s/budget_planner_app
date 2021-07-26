import 'package:budget_planner_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class OnBoardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String message;

  OnBoardingContent({
    required this.image,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: SizeConfig.scaleHeight(45),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xff0D0E56),
              fontSize: SizeConfig.scaleTextFont(20),
              fontWeight: FontWeight.w700,
              fontFamily: 'Montserrat'),
        ),
        SizedBox(
          height: SizeConfig.scaleHeight(11),
        ),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF7B7C98),
            fontFamily: 'Montserrat',
            fontSize: SizeConfig.scaleTextFont(15),
            fontWeight: FontWeight.w400,
          ),
        ),
        //SizedBox(height: SizeConfig.scaleHeight(10),),
        Spacer(),
        SvgPicture.asset(
          'images/$image.svg',
          fit: BoxFit.contain,
          //height: SizeConfig.scaleHeight(310),
          //width: SizeConfig.scaleWidth(275),
        ),
      ],
    );
  }
}
