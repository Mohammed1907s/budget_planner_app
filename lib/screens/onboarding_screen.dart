import 'package:budget_planner_app/utils/demo_data.dart';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:budget_planner_app/widgets/e_button_onboarding.dart';
import 'package:budget_planner_app/widgets/on_boarding_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: SizeConfig.scaleHeight(62),
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(87)),
              width: SizeConfig.scaleWidth(199),
              height: SizeConfig.scaleHeight(10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: LinearProgressIndicator(
                  //color: Colors.blue,

                  value: (_currentPage + 1) / 3,
                  valueColor: AlwaysStoppedAnimation(Color(0xff472FC8)),
                  backgroundColor: Color(0xffF1F4FF),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int selectedPage) {
                  print('Page: $selectedPage');
                  setState(() {
                    _currentPage = selectedPage;
                  });
                },
                children: [
                  OnBoardingContent(
                    image: 'onboarding',
                    title: 'Take hold of your finances',
                    message: ON_BOARDING_MESSAGE,
                  ),
                  OnBoardingContent(
                    image: 'onboarding1',
                    title: 'See where your money goes',
                    message: ON_BOARDING_MESSAGE_1,
                  ),
                  OnBoardingContent(
                    image: 'onboarding2',
                    title: 'Reach your goals with ease',
                    message: ON_BOARDING_MESSAGE_2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(60),
            ),
            EButtonOnBoarding(
                onPressed: () {
                  if (_currentPage == 2) {
                    Navigator.pushReplacementNamed(context, '/login_screen');
                  } else if (_currentPage == 1) {
                    print('$_currentPage');
                    _pageController.jumpToPage(2);
                  } else
                    _pageController.jumpToPage(1);
                },
                currentPage: _currentPage,
                text: ''),
            TextButton(
              onPressed: () {
                _pageController.jumpToPage(2);
              },
              child: Visibility(
                  visible: _currentPage != 2,
                  child: TextApp(
                      text: 'Skip',
                      color: Color(0xff7B7C98),
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      ),
    );
  }
}
