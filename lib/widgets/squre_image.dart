import 'package:budget_planner_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SquareImage extends StatelessWidget {
  late String name;


  SquareImage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(127)),
      width: SizeConfig.scaleWidth(120),
      height: SizeConfig.scaleHeight(115),
      child: Center(
          child: SvgPicture.asset(
            'images/$name.svg',
            //width: SizeConfig.scaleWidth(56.81),
           // height: SizeConfig.scaleHeight(52.93),
          )),
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(SizeConfig.scaleHeight(29)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFFE9E7F1).withOpacity(1),
              offset: Offset(0, 10),
              blurRadius: 18,
              spreadRadius: 0,
            ),
          ]),
    );
  }
}
