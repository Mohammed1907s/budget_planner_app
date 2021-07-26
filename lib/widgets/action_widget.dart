
import 'package:budget_planner_app/getx_controllers/category_getx_controller.dart';
import 'package:budget_planner_app/models/actions.dart';

import 'package:budget_planner_app/models/user_action.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

class ActionWidget extends StatelessWidget {
  final Operation operation;
  final void Function() onTap;

  ActionWidget({required this.operation, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Container(
              width: SizeConfig.scaleWidth(50),
              height: SizeConfig.scaleHeight(50),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xFF472FC8),
                  borderRadius: BorderRadius.circular(10)),
              child: TextApp(
               text:  CategoryGetxController.to
                    .getCategoryName(operation.categoryId)[0]
                    .toUpperCase(),
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text : CategoryGetxController.to
                      .getCategoryName(operation.categoryId),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Color(0xFF0D0E56),
                ),
                TextApp(
                  text : operation.notes,
                  fontSize: 15,
                  color: Colors.grey, fontWeight: FontWeight.w500,
                )
              ],
            ),
            Spacer(),
            TextApp(
              text :  operation.expense
                  ? '- \$' + operation.amount.toString()
                  : '+ \$' + operation.amount.toString(),
              fontSize: 15,
              color: operation.expense ? Colors.red.shade900 : Colors.green,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }
}
