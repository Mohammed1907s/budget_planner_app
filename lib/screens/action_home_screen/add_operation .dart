
import 'package:budget_planner_app/getx_controllers/add_operation_getx_controller.dart';
import 'package:budget_planner_app/getx_controllers/category_getx_controller.dart';
import 'package:budget_planner_app/getx_controllers/currency_getx_controller.dart';
import 'package:budget_planner_app/models/actions.dart';

import 'package:budget_planner_app/models/category.dart';
import 'package:budget_planner_app/models/currency.dart';
import 'package:budget_planner_app/models/user_action.dart';
import 'package:budget_planner_app/screens/action_home_screen/categories_screen.dart';
import 'package:budget_planner_app/screens/category_screen.dart';
import 'package:budget_planner_app/screens/create_operation_success.dart';
import 'package:budget_planner_app/screens/currency_screen.dart';
import 'package:budget_planner_app/storge/app_pref_controller.dart';
import 'package:budget_planner_app/utils/enums.dart';
import 'package:budget_planner_app/utils/helpers.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:budget_planner_app/widgets/app_text_field.dart';
import 'package:budget_planner_app/widgets/category_type.dart';
import 'package:budget_planner_app/widgets/elevated_button_app.dart';
import 'package:budget_planner_app/widgets/main_container_widget.dart';
import 'package:budget_planner_app/widgets/squre_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class AddOperation extends StatefulWidget {
  const AddOperation({Key? key}) : super(key: key);

  @override
  _AddOperationState createState() => _AddOperationState();
}

class _AddOperationState extends State<AddOperation> with Helpers {
  bool _addEnabled = false;
  Currency? _currency;
  Category? _category;

  DateTime? _pickedDateValue;
  String? _pickedDate;
  late TextEditingController _noteController;
  late TextEditingController _moneyTextController;

  @override
  void initState() {
    // TODO: implement initState
    _moneyTextController = TextEditingController();
    _noteController = TextEditingController();
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _moneyTextController.dispose();
    _noteController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              Navigator.pop(context);
            },
            iconSize: SizeConfig.scaleHeight(27),
          )
        ],
        actionsIconTheme: IconThemeData(color: Color(0xff7B7C98)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: SquareImage(name: 'icon_wallet')),
                SizedBox(
                  height: SizeConfig.scaleHeight(13),
                ),
                TextApp(
                    text: AppLocalizations.of(context)!.add_operation,
                    color: Color(0xff0D0E56),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
                SizedBox(
                  height: SizeConfig.scaleHeight(21),
                ),
                Container(
                  height: SizeConfig.scaleHeight(67),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFFFFFFF),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: TextField(

                    textAlign: TextAlign.center,
                    controller: _moneyTextController,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontSize: SizeConfig.scaleTextFont(21),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF181819)),
                      hintText: ('\$ 0,00'),
                      contentPadding: EdgeInsets.symmetric(
                          //horizontal: SizeConfig.scaleWidth(14),
                          vertical: SizeConfig.scaleHeight(22)),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(11),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CategoryTypeWidget(title: AppLocalizations.of(context)!.expenses,
                      icon: Icon(
                        Icons.arrow_upward_sharp,
                        color: Colors.red.shade900,
                      ),
                      index: _category != null
                          ? _category!.expense
                          ? 1
                          : 0
                          : 0,),
                    SizedBox(
                      width: SizeConfig.scaleWidth(10),
                    ),
                    CategoryTypeWidget(title: AppLocalizations.of(context)!.incomes,
                      icon: Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.green.shade900,
                      ),
                      index: _category != null
                          ? !_category!.expense
                          ? 2
                          : 0
                          : 0,
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(11),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.scaleWidth(15),
                      vertical: SizeConfig.scaleHeight(22)),
                  //height: SizeConfig.scaleHeight(208),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffE9E7F1),
                        offset: Offset(0, 3),
                        blurRadius: 14,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(

                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MainContainerWidget(
                        title: AppLocalizations.of(context)!.categories,
                        value: _category?.name,
                        onTap: () async {
                          Category selectedCategory = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryScreen(),
                            ),
                          );
                          setState(() {
                            _category = selectedCategory;
                          });
                        },
                        iconData: Icons.arrow_forward_ios,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      MainContainerWidget(
                        title: AppLocalizations.of(context)!.date,
                        value: _pickedDate ?? 'D/M/Y ',
                        onTap: () async {
                          await pickDate();
                          setState(() {});
                        },
                        iconData: Icons.arrow_forward_ios,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      MainContainerWidget(
                        title: AppLocalizations.of(context)!.currency,
                        value: _currency?.nameEn,
                        iconData: Icons.arrow_forward_ios,
                        onTap: () async {
                          Currency selectedCurrency = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CurrencyScreen(),
                            ),
                          );
                          setState(() {
                            _currency = selectedCurrency;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.scaleHeight(11),),
                AppTextField(hight: SizeConfig.scaleHeight(112),controller: _noteController, hint: AppLocalizations.of(context)!.note,),
                SizedBox(
                  height: SizeConfig.scaleHeight(30),
                ),
                ElevatedButtonApp(
                  text: AppLocalizations.of(context)!.add,
                  color: _addEnabled
                      ?  Color(0xFF472FC8)
                      : Color(0xFFB1B1BE),
                  onPressed: () async {
                    await performSave();
                  },
                ),

              ]),
        ),
      ),
    );
  }

  Future pickDate() async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: _pickedDateValue ?? DateTime.now(),
      firstDate: DateTime(2021, 1, 1),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (dateTime != null) {
      _pickedDateValue = dateTime;
      var format = DateFormat.yMd('en');
      setState(() {
        _pickedDate = format.format(dateTime);
        print('Date: ${_pickedDate}');
      });

    }
  }


  Future performSave() async {
    if (checkData()) {
      await save();
    }
  }

  bool checkData() {
    if (_pickedDateValue != null &&
        _moneyTextController.text.isNotEmpty &&
        _currency != null &&
        _category != null) {
      return true;
    }
    showSnackBar(context,
        message: AppLocalizations.of(context)!.empty_field_error, error: true);
    return false;
  }

  Future save() async {
    bool _addEnabled = await ActionsGetxController.to.createOperation(operation);
    if (_addEnabled) {
      showSnackBar(context,
          message: AppLocalizations.of(context)!.success_add_operation);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (c) => CreateOperationSuccess()));
    } else {
      showSnackBar(context,
          message: AppLocalizations.of(context)!.failed_add_operation,
          error: true);
    }
  }

  Operation get operation {
    Operation operation = Operation();
    operation.amount = int.parse(_moneyTextController.text);
    operation.categoryId = _category!.id;
    operation.currencyId = _currency!.id;
    operation.expense = _category!.expense;
    operation.notes = _noteController.text;
    operation.date = _pickedDateValue!;
    operation.userId = SharedPrefController().id;
    return operation;
  }
 


}

/*BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate*/
/*Future pickDate() async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021, 1, 1),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (dateTime != null) {
      var format = DateFormat.yMd('en');
      _pickedDate = format.format(dateTime);
      print('Date: $_pickedDate');
    }
  }

  Future performSave() async {
    if (checkData()) {
      await save();
    }
  }

  bool checkData() {
    if (_pickedDate != null &&
        _moneyTextController.text.isNotEmpty &&
        currency != null &&
        category != null) {
      return true;
    }
    showSnackBar(context,
        message: AppLocalizations.of(context)!.empty_field_error, error: true);
    return false;
  }

  Future save() async {
    bool created = await ActionsGetxController.to.createOperation(operation);
    if (created) {
      showSnackBar(context,
          message: AppLocalizations.of(context)!.success_add_operation);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (c)=> CreateOperationSuccess()));
    } else {
      showSnackBar(context,
          message: AppLocalizations.of(context)!.failed_add_operation,
          error: true);
    }
  }

  Operation get operation {
    Operation operation = Operation();
    operation.amount = int.parse(_moneyTextController.text);
    operation.categoryId = category!.id;
    operation.currencyId = currency!.id;
    operation.expense = category!.expense;
    operation.notes = _noteController.text;
    operation.date = _pickedDate!;
    operation.userId = SharedPrefController().id;
    return operation;
  }*/