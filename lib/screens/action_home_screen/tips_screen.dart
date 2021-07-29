import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/content_tips.dart';
import 'package:flutter/material.dart';
class TipsScreen extends StatefulWidget {
  const TipsScreen({Key? key}) : super(key: key);

  @override
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: Color(0xffF1F4FF),

      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20)),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.scaleHeight(35),),
            TextField(

              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  left: SizeConfig.scaleWidth(14),
                  top: SizeConfig.scaleHeight(11),
                  bottom: SizeConfig.scaleHeight(11),
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Color(0xffBABAD7),
                  fontFamily: 'Montserrat',

                  fontSize: SizeConfig.scaleHeight(15),
                ),
                prefixIcon: Icon(Icons.search,
                  color: Color(0xff0D0E56),
                  size: SizeConfig.scaleHeight(24),),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    )
                ),
                focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    )
                ),
              ),
            ),
            SizedBox(height: SizeConfig.scaleHeight(27),),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2,
                crossAxisSpacing: SizeConfig.scaleWidth(10),
                mainAxisSpacing:SizeConfig.scaleHeight(17),
                childAspectRatio: SizeConfig.scaleWidth(182)/SizeConfig.scaleHeight(230),
              ),
                children: [
                  ContentTips(image: 'images/onboarding.svg',text: 'How to savea budget 10 tip'),
                  ContentTips(image: 'images/onboarding2.svg',text: 'See where your money is going'),
                  ContentTips(image: 'images/onboarding1.svg',text: 'Take hold of your finances'),
                  ContentTips(image: 'images/onboarding.svg',text: 'Take hold of your finances',),
                  ContentTips(image: 'images/onboarding1.svg',text: 'How to save a budget',),
                  ContentTips(image: 'images/onboarding2.svg',text: 'See where your money',),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
