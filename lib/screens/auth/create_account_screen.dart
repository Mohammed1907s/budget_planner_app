import 'package:budget_planner_app/database/controllers/user_db_controller.dart';
import 'package:budget_planner_app/models/currency.dart';
import 'package:budget_planner_app/models/user.dart';
import 'package:budget_planner_app/screens/auth/create_success.dart';
import 'package:budget_planner_app/screens/auth/pin_code_screen.dart';
import 'package:budget_planner_app/screens/currency_screen.dart';
import 'package:budget_planner_app/utils/helpers.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:budget_planner_app/widgets/app_text_field.dart';
import 'package:budget_planner_app/widgets/elevated_button_app.dart';
import 'package:budget_planner_app/widgets/main_container_widget.dart';
import 'package:budget_planner_app/widgets/squre_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen>
    with Helpers {
  late TextEditingController _nameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _dailyTextController;
  Currency? _currency;
  String? pinCode = '';
  bool _createdEnabled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _dailyTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextController.dispose();
    _emailTextController.dispose();
    _dailyTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.scaleHeight(25),
              ),
              SquareImage(
                name: 'wallet',
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(13),
              ),
              TextApp(
                  text: AppLocalizations.of(context)!.get_start,
                  color: Color(0xFF0D0E56),
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
              SizedBox(
                height: SizeConfig.scaleHeight(11),
              ),
              TextApp(
                  text: AppLocalizations.of(context)!.create_account_message,
                  color: Color(0xff7B7C98),
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
              SizedBox(
                height: SizeConfig.scaleHeight(21),
              ),
              Container(
                //height: SizeConfig.scaleHeight(344),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff000000).withOpacity(0.25),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.scaleWidth(15),
                      vertical: SizeConfig.scaleHeight(22)),
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: SizeConfig.scaleHeight(47),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextApp(
                                text: AppLocalizations.of(context)!.name,
                                color: Color(0xff181819),
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: SizeConfig.scaleHeight(24)),
                                child: TextField(
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.right,
                                  controller: _nameTextController,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontSize: SizeConfig.scaleTextFont(15),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF7B7C98)),
                                    hintText:
                                        AppLocalizations.of(context)!.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        height: SizeConfig.scaleHeight(1),
                      ),
                      Row(
                        children: [
                          TextApp(
                              text: AppLocalizations.of(context)!.emailaddress,
                              color: Color(0xff181819),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          Expanded(
                            child: TextField(
                              textDirection: TextDirection.ltr,
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.end,
                              controller: _emailTextController,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    fontSize: SizeConfig.scaleTextFont(15),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF7B7C98)),
                                hintText: AppLocalizations.of(context)!.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                      Divider(thickness: 1, height: SizeConfig.scaleHeight(1)),
                      MainContainerWidget(
                        title: AppLocalizations.of(context)!.currency,
                        value: _currency == null ? '' : _currency!.nameEn,
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
                      Divider(
                          thickness: 0.5, height: SizeConfig.scaleHeight(1)),
                      Row(
                        children: [
                          TextApp(
                              text: AppLocalizations.of(context)!.daily_limit,
                              color: Color(0xff181819),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.end,
                              controller: _dailyTextController,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    fontSize: SizeConfig.scaleTextFont(15),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF7B7C98)),
                                hintText: ('\$ 5000'),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                          thickness: 0.5, height: SizeConfig.scaleHeight(1)),
                      MainContainerWidget(
                        title: AppLocalizations.of(context)!.set_your_pin,
                        value: pinCode,
                        iconData: Icons.arrow_forward_ios,
                        onTap: () async {
                          String code = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PinCodeScreen(),
                            ),
                          );
                          setState(() {
                            pinCode = code;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              ElevatedButtonApp(
                onPressed: () async {
                  await performRegister();
                },
                text: AppLocalizations.of(context)!.createnow,
                color:
                     Color(0xff472FC8) ,
              )
            ],
          ),
        ));
  }

  Future<void> performRegister() async {
    if (checkData()) {
      await register();
    }
  }

  register() async {
    User newUser = user;
    int newUserId = await UserDbController().create(newUser);
    if (newUserId != 0) {
      newUser.id = newUserId;
      showSnackBar(context, message: 'Account Created Successfully!');
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateAccountSuccess(),
          ));
    }
  }






  bool checkData() {
    if (_nameTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty &&
        _dailyTextController.text.isNotEmpty &&
        pinCode != null &&
        _currency != null) {
      return true;
    }

    showSnackBar(context, message: AppLocalizations.of(context)!.empty_field_error , error: true);
    return false;
  }

  User get user {
    User user = User();
    user.name = _nameTextController.text;
    user.email = _emailTextController.text;
    user.dayLimit = double.parse(_dailyTextController.text);
    user.pin = int.parse(pinCode!);
    user.currencyId = _currency!.id;
    return user;
  }
}

/*
* 
* void navigateToPinCodeScreen() async {
    var pinCode =
        await Navigator.pushNamed(context, '/pin_code_screen') as String?;
    if (pinCode != null) {
      setState(() {
        _pinCode = pinCode;
      });
      validateForm();
    }
  }

  void navigateToCurrencyScreen() async {
    var currency =
        await Navigator.pushNamed(context, '/currency_screen') as Currency?;
    if (currency != null) {
      setState(() {
        _currency = currency;
      });
      validateForm();
    }
  }

  void validateForm() {
    updateEnableStatus(checkData());
  }

  void updateEnableStatus(bool status) {
    setState(() {
      _createdEnabled = status;
    });
  }

  bool checkData() {
    return _nameTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty &&
        _currency != null &&
        _dailyLimitTextController.text.isNotEmpty &&
        _pinCode.isNotEmpty;
  }

  void performCreateAccount() async {
    if (_createdEnabled) {
      await createAccount();
    } else {
      //SHOW ERROR MESSAGE
    }
  }

  Future<void> createAccount() async {
    bool status = await UsersGetxController.to.createAccount(user: user);
    if(status){
      CurrencyGetxController.to.undoCheckedCurrency();
      Navigator.pushReplacementNamed(context, '/success_screen');
    }else{
      //SHOW MESSAGE - ERROR
    }
  }

  User get user {
    User user = User();
    user.name = _nameTextController.text;
    user.email = _emailTextController.text;
    user.pin = int.parse(_pinCode);
    user.dayLimit = double.parse(_dailyLimitTextController.text);
    user.currencyId = _currency!.id;
    return user;
  }*/
