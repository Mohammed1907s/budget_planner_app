
import 'package:budget_planner_app/getx_controllers/category_getx_controller.dart';
import 'package:budget_planner_app/models/category.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:budget_planner_app/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  CategoryGetxController controller = Get.find();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: TextApp(
          text: AppLocalizations.of(context)!.categories,
          color: Color(0xFF0D0E56),
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
          fontSize: SizeConfig.scaleTextFont(20),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outlined),
            color: Color(0xFF472FC8),
            onPressed: () {
              Navigator.pushNamed(context, '/add_category');
            },
          ),
        ],
      ),
      body: GetBuilder(
        builder: (CategoryGetxController controller) {
          List<Category> expenses =
          controller.category.where((element) => element.expense).toList();
          List<Category> income =
          controller.category.where((element) => !element.expense).toList();
          return Column(
            children: [
              SizedBox(
                height: SizeConfig.scaleHeight(110),
              ),
              Container(
                height: SizeConfig.scaleHeight(40),
                margin: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(15)),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Color(0xFFF1F4FF),
                  borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(20)),
                ),
                child: TabBar(
                  controller: tabController,
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    color: Color(0xFF472FC8),
                    borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(40)),
                  ),
                  labelStyle: TextStyle(
                    fontSize: SizeConfig.scaleTextFont(13),
                    fontWeight: FontWeight.bold,
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
                  controller: tabController,
                  children: [
                    Container(
                      margin:
                      EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20), vertical: SizeConfig.scaleHeight(20)),
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(15)),
                      child: ListView.separated(
                        itemCount: expenses.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return CategoryWidget(
                            category: expenses[index],
                            onTap: () {
                              popScreen(
                                  context: context, category: expenses[index]);
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                              thickness: 0.5, color: Color(0xFF7B7C98));
                        },
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(25)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0, SizeConfig.scaleHeight(10)),
                            color: Color(0xFFE9E7F1),
                            blurRadius: SizeConfig.scaleHeight(18),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                      EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20), vertical: SizeConfig.scaleHeight(20)),
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(15)),
                      child: ListView.separated(
                        itemCount: income.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return CategoryWidget(
                              category: income[index],
                              onTap: () {
                                popScreen(context: context, category: income[index]);
                              });
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                              thickness: 0.5, color: Color(0xFF7B7C98));
                        },
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          SizeConfig.scaleHeight(SizeConfig.scaleHeight(25)),
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0, SizeConfig.scaleHeight(SizeConfig.scaleHeight(10))),
                            color: Color(0xFFE9E7F1),
                            blurRadius: SizeConfig.scaleHeight(SizeConfig.scaleHeight(18)),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  popScreen({required Category category, required BuildContext context}) {
    Navigator.pop(context, category);
  }
}
