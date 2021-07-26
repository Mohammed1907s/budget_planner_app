import 'package:budget_planner_app/database/controllers/user_db_controller.dart';
import 'package:budget_planner_app/getx_controllers/currency_getx_controller.dart';
import 'package:budget_planner_app/models/currency.dart';
import 'package:budget_planner_app/models/user.dart';
import 'package:budget_planner_app/screens/auth/pin_code_screen.dart';
import 'package:budget_planner_app/screens/currency_screen.dart';
import 'package:budget_planner_app/storge/app_pref_controller.dart';
import 'package:budget_planner_app/utils/helpers.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:budget_planner_app/widgets/app_text_field.dart';
import 'package:budget_planner_app/widgets/elevated_button_app.dart';
import 'package:budget_planner_app/widgets/main_container_widget.dart';
import 'package:budget_planner_app/widgets/squre_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with Helpers {
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController dallyLimitController;
  Currency? currency;
  String? binCode;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    dallyLimitController = TextEditingController();
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    dallyLimitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: SizeConfig.scaleHeight(103)),
        child: Column(
          children: [
        Center(child: SquareImage(name: 'ic-profile-inactive')),
      SizedBox(
        height: SizeConfig.scaleHeight(13),
      ),
      TextApp(
          text: user.name,
          color: Color(0xff0D0E56),
          fontSize: 20,
          fontWeight: FontWeight.w700),
      SizedBox(
        height: SizeConfig.scaleHeight(20),),
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
                          controller: userNameController,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontSize: SizeConfig.scaleTextFont(15),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF7B7C98)),
                            hintText: user.name,
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
                      controller: emailController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                            fontSize: SizeConfig.scaleTextFont(15),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF7B7C98)),
                        hintText: user.email,
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
                  value: currency == null
                      ? CurrencyGetxController.to
                      .getCurrencyName(user.currencyId)
                      : currency!.nameEn,
                  iconData: Icons.arrow_forward_ios,
                  onTap: () async{
            Currency selectedCurrency = await Navigator.push(context,MaterialPageRoute(builder: (context) => CurrencyScreen(),),);
            setState(() {currency = selectedCurrency;});}
              ,),
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
                    controller: dallyLimitController,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontSize: SizeConfig.scaleTextFont(15),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF7B7C98)),
                      hintText: user.dayLimit.toString(),
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
              value: binCode,
              iconData: Icons.arrow_forward_ios,
              onTap: () async {
                String code = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PinCodeScreen(),
                  ),
                );
                setState(() {
                  binCode = code;
                });
              },
            ),
          ],
        ),
      ),
    ),
    Padding(
    padding:EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(35)),
    child: ElevatedButtonApp(
    text: AppLocalizations.of(context)!.save,
    onPressed: () async {
    await performSave();
    setState(() {});
    }, color: Color(0xff472FC8),
    ),
    ),
    ],
    ),
    ),
    );
  }

  User get user {
    User user = SharedPrefController().getUser();
    return user;
  }

  Future<void> performSave() async {
    bool updated = await UserDbController().update(userUpdated);
    if (updated) {
      SharedPrefController().save(userUpdated);
      showSnackBar(context, message: 'Account Updated Successfully!');
      clearFields();
    } else {
      showSnackBar(context, message: 'Account Updated Field!');
    }
  }

  User get userUpdated {
    User updatedUser = user;
    updatedUser.name = userNameController.text.isNotEmpty
        ? userNameController.text
        : user.name;
    updatedUser.dayLimit = dallyLimitController.text.isNotEmpty
        ? double.parse(dallyLimitController.text)
        : user.dayLimit;
    updatedUser.email =
    emailController.text.isNotEmpty ? emailController.text : user.email;
    updatedUser.currencyId = currency == null ? user.currencyId : currency!.id;
    updatedUser.pin = binCode == null ? user.pin : int.parse(binCode!);
    return updatedUser;
  }

  void clearFields() {
    userNameController.text = '';
    dallyLimitController.text = '';
    emailController.text = '';
  }
}
