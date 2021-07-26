import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CategoryTypeWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final int index;
  final void Function()? onPressed;

  CategoryTypeWidget(
      {required this.title,
        required this.icon,
        this.index = 0,
        this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (onPressed != null) onPressed!();
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: SizeConfig.scaleHeight(22)),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon,
                SizedBox(
                  height: SizeConfig.scaleHeight(8),
                ),
                TextApp(
                  text: title,
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.scaleTextFont(15),
                  color: Color(0xFF181819),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(10)),
            border: Border.all(
                width: 2,
                color: index == 0
                    ? Colors.white
                    : index == 1
                    ? Colors.red
                    : Colors.green),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(0, SizeConfig.scaleHeight(3)),
                  color: Color(0xFFE9E7F1),
                  blurRadius: SizeConfig.scaleHeight(6),
                  spreadRadius: 0),
            ],
          ),
        ),
      ),
    );
  }
}
