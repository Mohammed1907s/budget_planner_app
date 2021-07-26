
import 'package:budget_planner_app/models/currency.dart';
import 'package:budget_planner_app/storge/app_pref_controller.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:flutter/material.dart';

class CurrencyWidget extends StatelessWidget {
  final Currency currency;
  final void Function() onTap;

  CurrencyWidget({required this.currency, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            CircleAvatar(
              child: Text(
                SharedPrefController().languageCode == 'ar' ? currency.nameAr[0]: currency.nameEn[0],
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color(0xFF472FC8),
              radius: 20,
            ),
            SizedBox(width: SizeConfig.scaleWidth(15)),
            Text(
                SharedPrefController().languageCode == 'ar' ? currency.nameAr: currency.nameEn
            ),
          ],
        ),
      ),
    );
  }
}
