import 'package:budget_planner_app/utils/demo_data.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class TipArticle extends StatefulWidget {

  final String image;
  final String text;


  TipArticle({
  required  this.image,
  required  this.text});

  @override
  _TipArticleState createState() => _TipArticleState();
}

class _TipArticleState extends State<TipArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xff472FC8)),

        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.ios_share_outlined))
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.only(
            bottom: SizeConfig.scaleHeight(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.scaleHeight(10),),
              Container(
                  width: double.infinity,
                  height: SizeConfig.scaleHeight(348),
                  child: Stack(
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          widget.image,
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: SizeConfig.scaleWidth(26)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: SizeConfig.scaleHeight(31.62),),
                    TextApp(text: widget.text, color:Color(0xff0D0E56), fontSize: 20,fontWeight: FontWeight.w700,),
                    SizedBox(height: SizeConfig.scaleHeight(11),),
                    TextApp(text: text_tips, color:Color(0xff7B7C98), fontSize: 20,fontWeight: FontWeight.w400,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
