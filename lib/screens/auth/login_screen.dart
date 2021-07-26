import 'package:budget_planner_app/database/controllers/user_db_controller.dart';
import 'package:budget_planner_app/models/user.dart';
import 'package:budget_planner_app/storge/app_pref_controller.dart';
import 'package:budget_planner_app/utils/helpers.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:budget_planner_app/widgets/app_text_field.dart';
import 'package:budget_planner_app/widgets/e_button_onboarding.dart';
import 'package:budget_planner_app/widgets/elevated_button_app.dart';
import 'package:budget_planner_app/widgets/squre_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers{

  late TapGestureRecognizer _tapGestureRecognizer;
  late TextEditingController _emailTextController;
  late TextEditingController _pinTextController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _emailTextController = TextEditingController();
    _pinTextController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer();
    _tapGestureRecognizer.onTap = navigateToCreateAccountScreen;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _pinTextController.dispose();
    super.dispose();
  }

  navigateToCreateAccountScreen() {
    Navigator.pushNamed(context, '/create_account_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //mainAxisSize: MainAxisSize.min,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.scaleHeight(81),
            ),
            SquareImage(name: 'wallet',),
            SizedBox(
              height: SizeConfig.scaleHeight(13),
            ),
            TextApp(text: AppLocalizations.of(context)!.login, color: Color(0xff0D0E56), fontSize: 20, fontWeight: FontWeight.w700),
            SizedBox(
              height: SizeConfig.scaleHeight(11),
            ),
            TextApp(text: AppLocalizations.of(context)!.login_msg,
                color: Color(0xff7B7C98), fontSize: 15, fontWeight: FontWeight.w400),

            SizedBox(
              height: SizeConfig.scaleHeight(50),
            ),
            AppTextField(
              controller: _emailTextController,
              textInputType: TextInputType.emailAddress,
              hint: AppLocalizations.of(context)!.emailaddress,
            ),
            SizedBox(height: 15),
            AppTextField(
              textInputType: TextInputType.number,
              controller: _pinTextController,
              hint: AppLocalizations.of(context)!.pincode,
              obscureText: true,
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(30),
            ),
            ElevatedButtonApp(onPressed: ()async {
              await performLogin();},
              text: AppLocalizations.of(context)!.login,
              color: Color(0xff351DB6),),
            SizedBox(
              height: SizeConfig.scaleHeight(20),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: AppLocalizations.of(context)!.donthaveaccount,
                  style: TextStyle(
                    color: Color(0xFF7B7C98),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: SizeConfig.scaleTextFont(15),
                  ),
                  children: [
                    TextSpan(
                      recognizer: _tapGestureRecognizer,
                      text: AppLocalizations.of(context)!.createnow,
                      style: TextStyle(
                        color: Color(0xff351DB6),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.scaleTextFont(15),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_emailTextController.text.isNotEmpty && _pinTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: AppLocalizations.of(context)!.empty_field_error, error: true);
    return false;
  }

  Future login() async {
    User? user = await UserDbController().login(email: _emailTextController.text, pin: _pinTextController.text);
    if (user != null) {
      showSnackBar(context, message: AppLocalizations.of(context)!.login_successfully);
      SharedPrefController().save(user);
      Navigator.pushNamedAndRemoveUntil(context, '/main_screen', (route) => false);
    } else{
      showSnackBar(context, message: AppLocalizations.of(context)!.invalid_email_or_pin, error: true);
    }
  }
}





