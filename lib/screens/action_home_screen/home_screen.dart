import 'package:budget_planner_app/getx_controllers/add_operation_getx_controller.dart';
import 'package:budget_planner_app/models/actions.dart';
import 'package:budget_planner_app/screens/action_screen.dart';
import 'package:budget_planner_app/storge/app_pref_controller.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/action_widget.dart';
import 'package:budget_planner_app/widgets/actions_date_text.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
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
          SizedBox(
            height: SizeConfig.scaleHeight(110),
          ),
          Visibility(
            child: LimitHome(
              msg: AppLocalizations.of(context)!.rich_limit,
              onTap: () {
                setState(() {
                  hideMsg = false;
                });
              },
            ),
            visible: (SharedPrefController()
                .getUser()
                .dayLimit <
                ActionsGetxController.to.totalExpenses) &&
                hideMsg,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(74),
          ),
          Container(
            width: SizeConfig.scaleHeight(260),
            height: SizeConfig.scaleHeight(260),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFE9E7F1),
                  offset: Offset(0, SizeConfig.scaleHeight(13)),
                  blurRadius: SizeConfig.scaleHeight(11),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: CircularPercentIndicator(
              reverse: false,
              startAngle: 180,
              radius: SizeConfig.scaleHeight(259.6),
              lineWidth: 10.0,
              percent: getPercent,
              restartAnimation: true,
              progressColor: SharedPrefController()
                  .getUser()
                  .dayLimit > ActionsGetxController.to.totalExpenses
                  ? Color(0xFF0D0E56)
                  : Colors.red.shade900,
              backgroundColor: Colors.white,
              animation: true,
              onAnimationEnd: () {},
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: ("\$  "),
                          style: TextStyle(
                            color: Color(0xFF0D0E56),
                            fontSize: SizeConfig.scaleTextFont(18),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: (ActionsGetxController.to.totalExpenses
                              .toString()),
                          style: TextStyle(
                            color: Color(0xFF0D0E56),
                            fontFamily: 'Montserrat',
                            fontSize: SizeConfig.scaleTextFont(40),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(0.3),
                  ),
                  TextApp(
                    text :AppLocalizations.of(context)!.spent_today,
                    color: Color(0xff7B7C98),
                    fontSize: SizeConfig.scaleTextFont(16),
                    textAlign: TextAlign.center, fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(13),
                  ),
                  Divider(
                    indent: SizeConfig.scaleWidth(33),
                    endIndent: SizeConfig.scaleWidth(33),
                    color: Color(0xFFE9E7F1),
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(11),
                  ),
                  TextApp(
                    text : AppLocalizations.of(context)!.balance_for_today,
                    color: Color(0xff7B7C98),
                    fontSize: SizeConfig.scaleTextFont(16),
                    textAlign: TextAlign.center, fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(6),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: ("\$  "),
                          style: TextStyle(
                            color: Color(0xff00BEA1),
                            fontSize: SizeConfig.scaleTextFont(13),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'montserrat',
                          ),
                        ),
                        TextSpan(
                          text:
                          (ActionsGetxController.to.totalIncome.toString()),
                          style: TextStyle(
                            color: Color(0xff00BEA1),
                            fontSize: SizeConfig.scaleTextFont(23.1),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'montserrat',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(
                        left: SizeConfig.scaleWidth(12),
                        right: SizeConfig.scaleWidth(12),
                        top: SizeConfig.scaleHeight(10),
                        bottom: SizeConfig.scaleHeight(27),
                      ),
                      itemCount: lastOperation.length,
                      separatorBuilder:
                          (BuildContext context, int index) {
                        return Divider(
                          height: 0,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return ActionWidget(
                          onTap: () {},
                          operation: lastOperation[index],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.scaleWidth(15),
                        vertical: SizeConfig.scaleHeight(25)),
                    child: ElevatedButtonApp(
                        text: AppLocalizations.of(context)!.see_more,
                        onPressed: () {
                          navigationToActionScreen(context: context);
                        }, color: Color(0xff472FC8),),
                  )
                ],
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
    if (ActionsGetxController.to.totalExpenses > SharedPrefController()
        .getUser()
        .dayLimit && ActionsGetxController.to.totalExpenses != 0) {
      return 0.99;
    }
    return ActionsGetxController.to.totalExpenses / SharedPrefController().getUser().dayLimit;
  }
}
