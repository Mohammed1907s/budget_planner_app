import 'package:budget_planner_app/models/currency.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

class MainContainerWidget extends StatelessWidget {
  final String title;
  final String? value;
  final IconData? iconData;
  final void Function()? onTap;

  MainContainerWidget({
    required this.title,
    this.value,
    this.onTap,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            print('nothing!');
          },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: SizeConfig.scaleHeight(23)),
        child: Row(
          children: [
            TextApp(
              text:  title,
              fontWeight: FontWeight.w500,
              fontSize: 15 ,
              color: Color(0xFF181819),
            ),
            Spacer(),
            TextApp(
              text : value ?? '',
              fontWeight: FontWeight.normal,
              fontSize: 15,
              color:Color(0xFF7B7C98),
            ),
            iconData != null
                ? Icon(
                    Icons.arrow_forward_ios,
                    size: 13,
                    color: Color(0xFF7B7C98),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
