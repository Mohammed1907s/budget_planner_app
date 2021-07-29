import 'package:budget_planner_app/getx_controllers/add_operation_getx_controller.dart';
import 'package:budget_planner_app/models/actions.dart';
import 'package:budget_planner_app/models/user.dart';
import 'package:budget_planner_app/screens/action_screen.dart';
import 'package:budget_planner_app/storge/app_pref_controller.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/action_widget.dart';
import 'package:budget_planner_app/widgets/actions_date_text.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:budget_planner_app/widgets/circular_progress_info.dart';
import 'package:budget_planner_app/widgets/elevated_button_app.dart';
import 'package:budget_planner_app/widgets/limit_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool hideMsg = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(25)),
      child: Column(
        children: [
          Visibility(
              child: LimitHome(
                msg: AppLocalizations.of(context)!.rich_limit,onTap: () {
                setState(() {
                  hideMsg = false;
                });
              },),
          visible: (SharedPrefController()
              .getUser()
              .dayLimit <
              ActionsGetxController.to.totalExpenses) &&
              hideMsg,),
          Container(
            height: SizeConfig.scaleHeight(260),
            width: SizeConfig.scaleWidth(260),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFF1F4FF).withAlpha(48),
                  offset: Offset(0, 13),
                  blurRadius: 11,
                  spreadRadius: 0,
                )
              ],
            ),
            child: CircularPercentIndicator(
              radius: SizeConfig.scaleHeight(260),
              lineWidth: 11.0,
              percent: getPercent,

              startAngle: 180,
              backgroundColor: Color(0xFF472FC8).withOpacity(0.1),
              progressColor: SharedPrefController()
                  .getUser()
                  .dayLimit > ActionsGetxController.to.totalExpenses
                  ? Color(0xFF472FC8)
                  : Colors.red.shade900,
              animation: true,
              circularStrokeCap: CircularStrokeCap.round,
              center: CircularProgressInfo(
                expenses: ActionsGetxController.to.totalExpenses.toStringAsFixed(2),
                balance: SharedPrefController().getUser().dayLimit,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                bottom: SizeConfig.scaleHeight(25),
                top: SizeConfig.scaleHeight(40)),
            alignment: AlignmentDirectional.centerStart,
            child: TextApp(
             text: AppLocalizations.of(context)!.last_actions,
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.scaleTextFont(20),
              color: Color(0xFF0D0E56),
            ),
          ),
          lastOperation.isNotEmpty
              ? Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(SizeConfig.scaleHeight(8)),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, SizeConfig.scaleHeight(5)),
                      blurRadius: SizeConfig.scaleHeight(18),
                      spreadRadius: 0,
                      color: Color(0xFFE9E7F1),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: SizeConfig.scaleHeight(24),
                          );
                        },
                        itemCount: lastOperation.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              index == 0
                                  ? Column(
                                children: [
                                  ActionDateText(
                                    date:
                                    lastOperation[index].date,
                                  ),
                                  SizedBox(
                                    height:
                                    SizeConfig.scaleHeight(20),
                                  ),
                                  ActionWidget(
                                    operation:lastOperation[index] ,
                                    onTap: (){},
                                  ),
                                ],
                              )
                                  : Column(
                                children: [
                                  Visibility(
                                    visible: lastOperation[index].date !=
                                        lastOperation[index - 1].date,
                                    child: ActionDateText(
                                      date: lastOperation[index].date,
                                    ),
                                  ),
                                  ActionWidget(
                                    operation: lastOperation[index],
                                    onTap: (){},
                                  ),
                                ],
                              ),

                            ],
                          );
                        },
                      ),
                    ),
                    ElevatedButtonApp(
                        text: AppLocalizations.of(context)!.see_more,
                        onPressed: () {
                          navigationToActionScreen(context: context);
                        }, color: Color(0xff472FC8),)
                  ],
                ),
              ),
            ),
          )
              : Container(),
        ],
      ),
    );
  }


  navigationToActionScreen({required BuildContext context}) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ActionsScreen()));
  }

  List<Operation> get lastOperation {
    return ActionsGetxController.to.getTheLastActions();
  }

  double get getPercent {
    if (ActionsGetxController.to.totalExpenses >= SharedPrefController()
        .getUser()
        .dayLimit && ActionsGetxController.to.totalExpenses != 0) {
      return 0.99;
    }
    return ActionsGetxController.to.totalExpenses / SharedPrefController().getUser().dayLimit;
  }
}
