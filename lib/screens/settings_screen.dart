import 'package:budget_planner_app/database/controllers/user_db_controller.dart';
import 'package:budget_planner_app/getx_controllers/add_operation_getx_controller.dart';
import 'package:budget_planner_app/getx_controllers/category_getx_controller.dart';
import 'package:budget_planner_app/getx_controllers/language_getx_controller.dart';
import 'package:budget_planner_app/main.dart';
import 'package:budget_planner_app/storge/app_pref_controller.dart';
import 'package:budget_planner_app/utils/helpers.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:budget_planner_app/widgets/content_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with Helpers {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: TextApp(
              text: AppLocalizations.of(context)!.settings,
              color: Color(0xff0D0E56),
              fontSize: 20,
              fontWeight: FontWeight.w700),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xff472FC8)),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
           // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.scaleHeight(34),
              ),
              TextApp(
                text: AppLocalizations.of(context)!.general,
                color: Color(0xff0D0E56),
                fontSize: 15,
                fontWeight: FontWeight.w500,

              ),
              SizedBox(
                height: SizeConfig.scaleHeight(15),
              ),
              ContentSetting(
                onTap: (){
                  Navigator.pushNamed(context, '/about_screen');
                },
                  colorBorder: Colors.transparent,
                  leadingIconColor: Color(0xff0D0E56),
                  titleColor: Color(0xff0D0E56),
                  colorArrow: Color(0xff0D0E56),
                  leadingIcon: Icons.info,
                  title: AppLocalizations.of(context)!.aboutapp),
              ContentSetting(
                  onTap:(){changeLang();} ,
                  colorBorder: Colors.transparent,
                  leadingIconColor: Color(0xff0D0E56),
                  titleColor: Color(0xff0D0E56),
                  colorArrow: Color(0xff0D0E56),
                  leadingIcon: Icons.language,
                  title: AppLocalizations.of(context)!.language),
              ContentSetting(
                onTap: ()async =>await SharedPrefController().logout(),
                  colorBorder: Colors.transparent,
                  leadingIconColor: Color(0xff0D0E56),
                  titleColor: Color(0xff0D0E56),
                  colorArrow: Colors.transparent,
                  leadingIcon: Icons.logout,
                  title: AppLocalizations.of(context)!.logout),
              SizedBox(
                height: SizeConfig.scaleHeight(10),
              ),
              TextApp(
                text: AppLocalizations.of(context)!.accountdata,
                color: Color(0xff0D0E56),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(15),
              ),
              ContentSetting(
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        barrierColor: Color(0xff000000).withOpacity(0.23),
                        builder: (_) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    color: Color(0xffD50000),
                                    width: SizeConfig.scaleWidth(1),
                                  )),
                              title: TextApp(
                                  text: AppLocalizations.of(context)!.clear,
                                  color: Color(0xffD50000),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                              content: TextApp(
                                  text: AppLocalizations.of(context)!.cleardata,
                                  color: Color(0xff0D0E56),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                              actions: [
                                TextButton(
                                  child: TextApp(
                                      text: AppLocalizations.of(context)!.no,
                                      color: Color(0xff0D0E56),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: TextApp(
                                      text: AppLocalizations.of(context)!.yes,
                                      color: Color(0xffD50000),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                  onPressed: () async => await deleteData(context),
                                ),
                              ],
                            ));
                  },
                  colorBorder: Color(0xffD50000),
                  leadingIconColor: Color(0xffD50000),
                  titleColor: Color(0xffD50000),
                  colorArrow: Colors.transparent,
                  leadingIcon: Icons.delete_forever,
                  title: AppLocalizations.of(context)!.clear),
              ContentSetting(
                onTap: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      barrierColor: Color(0xff000000).withOpacity(0.23),
                      builder: (_) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: Color(0xffD50000),
                                  width: SizeConfig.scaleWidth(1),
                                )),
                            title: TextApp(
                                text: AppLocalizations.of(context)!.removeaccount,
                                color: Color(0xffD50000),
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                            content: TextApp(
                                text: AppLocalizations.of(context)!.sureremoveaccount,
                                color: Color(0xff0D0E56),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                            actions: [
                              TextButton(
                                child: TextApp(
                                    text: AppLocalizations.of(context)!.no,
                                    color: Color(0xff0D0E56),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: TextApp(
                                    text: AppLocalizations.of(context)!.yes,
                                    color: Color(0xffD50000),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                                onPressed: () async => await deleteAccount(context: context),
                              ),
                            ],
                          ));
                },
                colorBorder: Color(0xffD50000),
                leadingIconColor: Colors.white,
                titleColor: Colors.white,
                colorArrow: Colors.transparent,
                leadingIcon: Icons.person_remove,
                title: AppLocalizations.of(context)!.removeaccount,
                containerColor: Color(0xffD50000),
              ),
              Spacer(),
              TextApp(text: 'Budget Planner', color: Color(0xff0D0E56), fontSize: 15, fontWeight: FontWeight.w800,textAlign: TextAlign.center,),
              TextApp(text: 'V 1.0.0', color: Color(0xff0D0E56), fontSize: 15, fontWeight: FontWeight.w300,textAlign: TextAlign.center,),
              SizedBox(height: SizeConfig.scaleHeight(20),)
            ],
          ),
        ));
  }
  void changeLang() {
    String newLanguageCode =
    SharedPrefController().languageCode == 'ar' ? 'en' :  'ar';
    print(newLanguageCode);
    LanguageGetxController.to.changeLanguage(newLanguageCode);
  }

  Future logout({required BuildContext context}) async {
    bool status = await SharedPrefController().logout();
    if (status) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/login_screen', (route) => false);
    }
  }

  Future<void> deleteData(BuildContext context) async {
    bool status = await deleteDialog(
      context: context,
      title: AppLocalizations.of(context)!.clear,
      content: AppLocalizations.of(context)!.cleardata,
    );
    if (status) {
      await ActionsGetxController.to.deleteAllRows();
      await CategoryGetxController.to.deleteAllRows();
    }
  }

  Future<void> deleteAccount({required BuildContext context}) async {
    bool userDeleted = await SharedPrefController().logout();
    print(userDeleted);
    if (userDeleted) {
      await ActionsGetxController.to.deleteAllRows();
      await CategoryGetxController.to.deleteAllRows();
      SharedPrefController().logout();
      showSnackBar(context, message: 'Account Deleted Successfully!');
      Navigator.pushNamedAndRemoveUntil(context, '/login_screen', (route) => false);
    }
  }
}
