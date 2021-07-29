import 'package:budget_planner_app/getx_controllers/category_getx_controller.dart';
import 'package:budget_planner_app/models/category.dart';
import 'package:budget_planner_app/utils/enums.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:budget_planner_app/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesScreen extends StatefulWidget {
  final bool withScaffold;

  CategoriesScreen({this.withScaffold = false});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin{
  late TabController _tabController;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder(
      builder: (CategoryGetxController controller) {
        List<Category> expenses =
        controller.category.where((element) => element.expense).toList();
        List<Category> income =
        controller.category.where((element) => !element.expense).toList();
        return Column(
          children: [
            SizedBox(height: SizeConfig.scaleHeight(10),),
            Container(
              height: SizeConfig.scaleHeight(40),
              margin:
              EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(15)),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color:  Color(0xFFF1F4FF),
                borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(20)),
              ),
              child: TabBar(
                controller:_tabController,
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                  color: Color(0xFF472FC8),
                  borderRadius:
                  BorderRadius.circular(SizeConfig.scaleHeight(40)),
                ),
                labelStyle: TextStyle(
                  fontSize: SizeConfig.scaleTextFont(13),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
                tabs: [
                  Tab(text: AppLocalizations.of(context)!.expenses),
                  Tab(text: AppLocalizations.of(context)!.incomes),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.scaleHeight(10)),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.scaleWidth(20),
                        vertical: SizeConfig.scaleHeight(20)),
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.scaleWidth(15)),
                    child: ListView.separated(
                      itemCount: expenses.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return CategoryWidget(
                          category: expenses[index],
                          onTap: () {},
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                            thickness: 0.5, color: Color(0xFF7B7C98));
                      },
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(SizeConfig.scaleHeight(25)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: Offset(0, SizeConfig.scaleHeight(10)),
                            color: Color(0xFFE9E7F1),
                            blurRadius: SizeConfig.scaleHeight(18),
                            spreadRadius: 0),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.scaleWidth(20),
                        vertical: SizeConfig.scaleHeight(20)),
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.scaleWidth(15)),
                    child: ListView.separated(
                      itemCount: income.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return CategoryWidget(
                          category: income[index],
                          onTap: () {},
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          thickness: 0.5,
                          color: Color(0xFF7B7C98),
                        );
                      },
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(SizeConfig.scaleHeight(25)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: Offset(0, SizeConfig.scaleHeight(10)),
                            color: Color(0xFFE9E7F1),
                            blurRadius: SizeConfig.scaleHeight(18),
                            spreadRadius: 0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
