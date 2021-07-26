import 'package:budget_planner_app/utils/size_config.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextInputType textInputType;
  final String hint;
  final double? hight;
  final IconData? prefixIcon;
  final bool? enable;
  final Color? hintColor;
  TextAlign textAlign;
  final void Function(String value)? onChanged;
  final bool obscureText;
  final TextEditingController? controller;
  final double hintSize;

  AppTextField({
    this.textAlign = TextAlign.start,
    required this.controller,
    this.textInputType = TextInputType.text,
    required this.hint,
    this.obscureText = false,
    this.hight,
    this.prefixIcon,
    this.enable,
    this.hintColor,
    this.hintSize = 15, this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hight,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000).withOpacity(0.21),
              offset: Offset(0, 0),
              blurRadius: 6,
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(9)),
      child: TextField(
          onChanged: onChanged,
          textAlign: textAlign,
          enabled: enable,
          controller: controller,
          keyboardType: textInputType,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon,
                    color: Color(
                      0xFF0D0E56,
                    ))
                : null,
            hintStyle: TextStyle(
                fontSize: SizeConfig.scaleTextFont(15),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                color: hintColor),
            hintText: (hint),

            contentPadding: EdgeInsets.symmetric(
                horizontal: SizeConfig.scaleWidth(20),
                vertical: SizeConfig.scaleHeight(11)),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          )),
    );
  }
}
