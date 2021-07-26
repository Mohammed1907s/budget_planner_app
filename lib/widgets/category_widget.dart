import 'package:budget_planner_app/models/category.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {

  final Category category;
  final void Function() onTap;

  CategoryWidget({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: SizeConfig.scaleWidth(20)),
        child: Row(
          children: [
            Container(
              width: SizeConfig.scaleWidth(50),
              height: SizeConfig.scaleHeight(50),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xFF472FC8),
                  borderRadius: BorderRadius.circular(10)),
              child:  TextApp(
                text : category.name[0].toUpperCase(),
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: SizeConfig.scaleWidth(20)),
            TextApp(
              text :category.name,
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
