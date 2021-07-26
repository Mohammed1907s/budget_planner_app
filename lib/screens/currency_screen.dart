import 'package:budget_planner_app/getx_controllers/currency_getx_controller.dart';
import 'package:budget_planner_app/models/currency.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:budget_planner_app/widgets/currency_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class CurrencyScreen extends StatefulWidget {

  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: TextApp(
          text:AppLocalizations.of(context)!.currency,
          color: Color(0xFF0D0E56),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Container(
        margin: EdgeInsetsDirectional.only(
          start: SizeConfig.scaleWidth(20),
          end: SizeConfig.scaleWidth(20),
          top: SizeConfig.scaleHeight(30),
        ),
        padding: EdgeInsetsDirectional.only(
          top: SizeConfig.scaleHeight(24),
          start: SizeConfig.scaleWidth(15),
          end: SizeConfig.scaleWidth(15),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 18,
                color: Colors.grey.shade500),
          ],
        ),
        child: GetBuilder<CurrencyGetxController>(
          builder: (CurrencyGetxController controller) {
            return ListView.separated(
              itemCount: controller.currencies.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return CurrencyWidget(
                  currency: controller.currencies[index],
                  onTap: () {
                    popScreen(controller.currencies[index], context);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return Divider(thickness: 0.3, color: Colors.grey.shade500);
              },
            );
          },
        ),
      ),
    );
  }

  popScreen(Currency currency, BuildContext context) {
    Navigator.pop(context, currency);
  }
}
