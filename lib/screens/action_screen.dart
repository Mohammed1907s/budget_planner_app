import 'package:budget_planner_app/getx_controllers/add_operation_getx_controller.dart';
import 'package:budget_planner_app/screens/operation_details_screen.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/action_widget.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:budget_planner_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
class ActionsScreen extends StatefulWidget {
  @override
  _ActionsScreenState createState() => _ActionsScreenState();
}

class _ActionsScreenState extends State<ActionsScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,

          title: TextApp(
           text: AppLocalizations.of(context)!.action,
            color:  Color(0xFF0D0E56),
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.scaleTextFont(24),
            textAlign: TextAlign.center,

          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.scaleWidth(20),
              vertical: SizeConfig.scaleHeight(20)),
          child: Column(
            children: [
              AppTextField(
                hint: AppLocalizations.of(context)!.search,
                controller: controller,
                prefixIcon: Icons.search_rounded,
              ),
              Expanded(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.scaleWidth(12),
                      vertical: SizeConfig.scaleHeight(12)),
                  margin: EdgeInsets.only(top: SizeConfig.scaleHeight(15)),
                  child: GetBuilder<ActionsGetxController>(
                      builder: (ActionsGetxController controller) {
                        return ListView.separated(
                          itemCount: controller.operations.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                index == 0
                                    ? Column(
                                  children: [
                                    TextApp(
                                     text:  'Today',
                                      fontSize: 12,
                                      color: Colors.grey, fontWeight: FontWeight.w600,
                                    ),
                                    ActionWidget(
                                      operation: controller.operations
                                          .elementAt(index),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                OperationDetailsScreen(
                                                  operation: controller.operations
                                                      .elementAt(index),
                                                ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                )
                                    : Column(
                                  children: [
                                    Visibility(
                                      visible: ActionsGetxController
                                          .to.operations[index].date !=
                                          ActionsGetxController
                                              .to.operations[index - 1].date,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: SizeConfig.scaleHeight(20)),
                                        child: TextApp(
                                         text: DateFormat.MMMMEEEEd('en').format(
                                              ActionsGetxController
                                                  .to.operations[index].date),
                                          fontSize: SizeConfig.scaleTextFont(12),
                                          color: Colors.grey, fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    ActionWidget(
                                      operation: controller.operations.elementAt(index),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                OperationDetailsScreen(
                                                  operation: controller.operations
                                                      .elementAt(index),
                                                ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                                thickness: 0.5, color:Colors.grey.shade300);
                          },
                        );
                      }),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(SizeConfig.scaleHeight(25)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0, 10),
                        color: Color(0xFFE9E7F1),
                        blurRadius: SizeConfig.scaleHeight(18),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
