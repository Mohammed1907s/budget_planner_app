import 'package:budget_planner_app/getx_controllers/category_getx_controller.dart';
import 'package:budget_planner_app/models/category.dart';
import 'package:budget_planner_app/utils/enums.dart';
import 'package:budget_planner_app/utils/helpers.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:budget_planner_app/widgets/app_text_field.dart';
import 'package:budget_planner_app/widgets/category_type.dart';
import 'package:budget_planner_app/widgets/elevated_button_app.dart';
import 'package:budget_planner_app/widgets/squre_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AddCategoryScreen extends StatefulWidget {
  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> with Helpers {
  int expensesSelected = 0;
  int incomeSelected = 0;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: SizeConfig.scaleWidth(20),
            end: SizeConfig.scaleWidth(20),
            top: SizeConfig.scaleHeight(80),
          ),
          child: Column(
            children: [
              Center(child: SquareImage(name: 'icon_wallet')),
              SizedBox(
                height: SizeConfig.scaleHeight(13),
              ),
              TextApp(
                  text: AppLocalizations.of(context)!.add_category,
                  color: Color(0xff0D0E56),
                  fontSize: 20,
                  fontWeight: FontWeight.w700),

              SizedBox(height: SizeConfig.scaleHeight(50)),
              Row(
                children: [
                  CategoryTypeWidget(
                    title: AppLocalizations.of(context)!.expenses,
                    index: expensesSelected,
                    icon: Icon(
                      Icons.arrow_upward_sharp,
                      color: Colors.red.shade900,
                    ),
                    onPressed: () {
                      setState(() {
                        expensesSelected = 1;
                        incomeSelected = 0;
                      });
                    },
                  ),
                  SizedBox(
                    width: SizeConfig.scaleWidth(10),
                  ),
                  CategoryTypeWidget(
                    title: AppLocalizations.of(context)!.incomes,
                    index: incomeSelected,
                    icon: Icon(
                      Icons.arrow_downward_rounded,
                      color: Colors.green.shade900,
                    ),
                    onPressed: () {
                      setState(() {
                        incomeSelected = 2;
                        expensesSelected = 0;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.scaleHeight(10),),
              AppTextField(
                  controller: textEditingController,
                  hint: AppLocalizations.of(context)!.enter_category_name,
                  hight : SizeConfig.scaleHeight(67)),

              SizedBox(
                height: SizeConfig.scaleHeight(10),
              ),

              ElevatedButtonApp(
                color: Color(0xff472FC8),
                text: AppLocalizations.of(context)!.add,

                onPressed: () async {
                  await performSave();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future performSave() async {
    if (checkData()) {
      await save();
      Navigator.pop(context);
    }
  }

  bool checkData() {
    if (textEditingController.text.isNotEmpty && categorySelect()) {
      return true;
    }
    showSnackBar(context, message: AppLocalizations.of(context)!.empty_field_error, error: true);
    return false;
  }

  Future save() async {
    bool created = await CategoryGetxController.to.createCategory(category);
    String message =
    created ?  AppLocalizations.of(context)!.category_created_successfully : AppLocalizations.of(context)!.category_created_field;
    showSnackBar(context, message: message, error: !created);
  }

  Category get category {
    Category category = Category();
    category.name = textEditingController.text;
    category.expense = expensesSelected == 1;
    return category;
  }

  bool categorySelect() {
    if (incomeSelected == 0) {
      if (expensesSelected == 0) {
        return false;
      }
    }
    return true;
  }
}

  /*
  * Future performSave() async {
    if (checkData()) {
      await save();
      Navigator.pop(context);
    }
  }

  bool checkData() {
    if (_categoryTextController.text.isNotEmpty && categorySelect()) {
      return true;
    }
    showSnackBar(context: context, content: AppLocalizations.of(context)!.empty_field_error, error: !true);
    return false;
  }

  Future save() async {
    bool created = await CategoryGetxController.to.create(category: category);
    String message =
    created ?  AppLocalizations.of(context)!.category_created_successfully : AppLocalizations.of(context)!.category_created_field;
    showSnackBar(context: context, content: message, error: !true);

  }

  Category get category {
    Category category = Category();
    category.name = _categoryTextController.text;
    category.expense = _categoryType == CategoryType.Expense;
    category.userId = UsersGetxController.to.user.id;
    return category;
  }
  void changeCategoryType(CategoryType? categoryType) {
    setState(() {
      _categoryType = categoryType;
    });
    performSave();
  }

  bool checkData() {
    if (_categoryType != null && _categoryNameTextController.text.isNotEmpty) {
      return true;
    }
    return false;
  }*/
