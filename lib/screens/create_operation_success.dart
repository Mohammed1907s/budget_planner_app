import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CreateOperationSuccess extends StatefulWidget {
  const CreateOperationSuccess({Key? key}) : super(key: key);

  @override
  _CreateOperationSuccessState createState() => _CreateOperationSuccessState();
}

class _CreateOperationSuccessState extends State<CreateOperationSuccess> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/main_screen');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(150)),

            width: SizeConfig.scaleWidth(120),
            height: SizeConfig.scaleHeight(115),
            //color: Colors.white,
            child: Center(
              child: SvgPicture.asset(
                'images/ic_like.svg',
                width: SizeConfig.scaleWidth(61.08),
                height: SizeConfig.scaleHeight(67.55),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(29)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFE9E7F1).withOpacity(1),
                    offset: Offset(0, 10),
                    blurRadius: 18,
                    spreadRadius: 0,
                  ),
                ]),
          ),
          SizedBox(height: SizeConfig.scaleHeight(26),),
          TextApp(text: AppLocalizations.of(context)!.well_done, color: Color(0xff0D0E56), fontSize: 15, fontWeight: FontWeight.w700,),
          SizedBox(height: SizeConfig.scaleHeight(12),),
          TextApp(text: AppLocalizations.of(context)!.success_add_operation, color: Color(0xff7B7C98), fontSize: 15, fontWeight: FontWeight.w400,),


        ],
      ),
    );
  }
}
