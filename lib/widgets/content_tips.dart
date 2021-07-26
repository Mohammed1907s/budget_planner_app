import 'package:budget_planner_app/screens/tip_article.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContentTips extends StatelessWidget {
  final String image;
  final String text;


  ContentTips({
   required this.image,
   required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TipArticle(image: image, text: text,
                ),
          ),
        );
      },
      child: Container(

        height:SizeConfig.scaleHeight(230),
        width: SizeConfig.scaleWidth(182),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0,10),
                  color: Color(0xffE9E7F1).withAlpha(255),
                  blurRadius: 18,
                  spreadRadius: 0
              )
            ]
        ),
        child: Column(
          children: [
            Container(

              width: double.infinity,
              height: SizeConfig.scaleHeight(157),
              child: Padding(
                padding:  EdgeInsets.all(SizeConfig.scaleHeight(8)),
                child: SvgPicture.asset(
                  image,

                ),
              ),

            ),
            SizedBox(height: SizeConfig.scaleHeight(8),),
            TextApp(text: text, color: Color(0xff0D0E56), fontSize: 15, fontWeight: FontWeight.w600,textAlign: TextAlign.center,),
            
          ],
        ),
      ),
    );
  }
}
