import 'package:budget_planner_app/utils/size_config.dart';
import 'package:flutter/material.dart';


class ContentSetting extends StatelessWidget {
  final Color colorBorder , leadingIconColor, titleColor,colorArrow,containerColor;
  final IconData leadingIcon;
  final String title;
  final Function()? onTap;


  ContentSetting({
    required  this.colorBorder,
    required  this.leadingIconColor,
    required  this.titleColor,
    required  this.colorArrow,
    required  this.leadingIcon,
    required  this.title,
    this.onTap, this.containerColor=Colors.white});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: SizeConfig.scaleHeight(15)),
      child: GestureDetector(
        onTap: onTap ,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: containerColor,
            border:Border.all(color: colorBorder,width: SizeConfig.scaleWidth(1)),
            boxShadow: [
              BoxShadow(
                color: Color(0xff8F8F8F).withOpacity(0.4),
                spreadRadius: 0,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          height: SizeConfig.scaleHeight(70),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20),vertical: SizeConfig.scaleHeight(23)),
            child: Row(

              children: [
                Icon(
                  leadingIcon,
                  color: leadingIconColor,
                  size: SizeConfig.scaleHeight(20),
                ),
                SizedBox(width: SizeConfig.scaleWidth(10),),
                Text(
                  title,
                  style: TextStyle(
                    color: titleColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                    fontSize: SizeConfig.scaleTextFont(15),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: colorArrow,
                  size: SizeConfig.scaleHeight(13),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}