

import 'package:budget_planner_app/getx_controllers/category_getx_controller.dart';
import 'package:budget_planner_app/getx_controllers/currency_getx_controller.dart';
import 'package:budget_planner_app/models/actions.dart';
import 'package:budget_planner_app/models/currency.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:budget_planner_app/widgets/app_text_field.dart';
import 'package:budget_planner_app/widgets/category_type.dart';
import 'package:budget_planner_app/widgets/main_container_widget.dart';
import 'package:budget_planner_app/widgets/squre_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class OperationDetailsScreen extends StatelessWidget {
  final Operation operation;
  Currency? _currency;

  OperationDetailsScreen({required this.operation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextApp(
          text: AppLocalizations.of(context)!.expense_details,
          color: Color(0xFF0D0E56),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: SizeConfig.scaleWidth(20),
            left: SizeConfig.scaleWidth(20),
            top: SizeConfig.scaleHeight(130)

          ),
          child: Column(
            children: [
              

              Center(child: SquareImage(name: 'icon_wallet')),
              SizedBox(
                height: SizeConfig.scaleHeight(13),
              ),
              TextApp(
                  text: CategoryGetxController.to
                      .getCategoryName(operation.categoryId),
                  color: Color(0xff0D0E56),
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
              SizedBox(
                height: SizeConfig.scaleHeight(20),
              ),
              AppTextField(
                hight: SizeConfig.scaleHeight(67),
                controller: null,
                hint: operation.amount.toString(),
                enable: false,
                hintColor: Color(0xFF0D0E56),
                hintSize: SizeConfig.scaleTextFont(30),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Row(
                children: [
                  CategoryTypeWidget(
                    title: AppLocalizations.of(context)!.expenses,
                    icon: Icon(
                      Icons.arrow_upward_sharp,
                      color: Colors.red.shade900,
                    ),
                    index: operation.expense ? 1 : 0,
                  ),
                  SizedBox(
                    width: SizeConfig.scaleWidth(10),
                  ),
                  CategoryTypeWidget(
                      title: AppLocalizations.of(context)!.incomes,
                      icon: Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.green.shade900,
                      ),
                      index: !operation.expense ? 2 : 0),
                ],
              ),
              SizedBox(height: SizeConfig.scaleHeight(20)),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(15)),
                margin: EdgeInsets.only(bottom: SizeConfig.scaleHeight(10)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(SizeConfig.scaleHeight(10)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        offset: Offset(0, SizeConfig.scaleHeight(10)),
                        color: Color(0xFFE9E7F1),
                        blurRadius: SizeConfig.scaleHeight(18),
                        spreadRadius: 0),
                  ],
                ),
                child: Column(
                  children: [
                    MainContainerWidget(
                      title: AppLocalizations.of(context)!.categories,
                      value: CategoryGetxController.to
                          .getCategoryName(operation.categoryId),
                      iconData: Icons.arrow_forward_ios,
                    ),
                    Divider(thickness: SizeConfig.scaleHeight(1) ,height: 0, color: Color(0xFF7B7C98)),
                    MainContainerWidget(
                      title: AppLocalizations.of(context)!.date,
                      value: DateFormat.yMd('en').format(operation.date),
                      iconData: Icons.arrow_forward_ios,
                    ),
                    Divider(thickness: SizeConfig.scaleHeight(1) ,height: 0, color: Color(0xFF7B7C98)),
                    MainContainerWidget(
                      title: AppLocalizations.of(context)!.currency,
                      value: CurrencyGetxController.to
                          .getCurrencyName(operation.currencyId),
                      iconData: Icons.arrow_forward_ios,
                    ),
                  ],
                ),
              ),
              AppTextField(
                enable: false,
                hight: SizeConfig.scaleHeight(112),
                hintColor: Colors.grey,
                hint: operation.notes,
                controller: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
