
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActionDateText extends StatelessWidget {
  final DateTime date;

  ActionDateText({required this.date});

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat.yMd('en').format(date),
      style: TextStyle(
        color: Color(0xFFB9BACE),
        fontSize: SizeConfig.scaleTextFont(12),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
