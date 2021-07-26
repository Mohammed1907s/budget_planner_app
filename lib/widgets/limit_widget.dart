
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

class LimitHome extends StatelessWidget {

  final String msg;
  final void Function()? onTap;

  LimitHome({ required this.msg, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.scaleHeight(5)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(0, SizeConfig.scaleHeight(10)),
            color: Color(0xFFE9E7F1),
            blurRadius: SizeConfig.scaleHeight(18),
            spreadRadius: 0,
          ),
        ],
      ),
        child: Row(
          children: [
            Icon(Icons.notifications_active,color: Colors.red.shade900,),
            SizedBox(width: 5,),
            TextApp(
              text: msg,
              color: Colors.black,
              fontSize: SizeConfig.scaleTextFont(15),
              fontWeight: FontWeight.w500,
            ),
            Spacer(),
            IconButton(icon: Icon(Icons.clear), onPressed: onTap??(){})
          ],
        ),
    );
  }
}
