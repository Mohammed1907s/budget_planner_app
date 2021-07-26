import 'package:budget_planner_app/utils/size_config.dart';
import 'package:flutter/material.dart';

class AddActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.scaleHeight(45),
      width: SizeConfig.scaleWidth(45),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF472FC8),
      ),
      child: IconButton(
        onPressed: () => Navigator.pushNamed(context, '/add_operation'),
        padding: EdgeInsets.zero,
        icon: Icon(Icons.add),
        iconSize: SizeConfig.scaleWidth(30),
        color: Colors.white,
      ),
    );
  }
}
