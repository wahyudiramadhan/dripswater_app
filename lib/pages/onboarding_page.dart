import 'package:dripswater/pages/wellcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:dripswater/const/app_color.dart';

import '../widgets/app_button.dart';
import '../widgets/app_text.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPageIndex = 0;
  final _pageController = PageController();

  List img = [
    "bg1.svg",
    "bg2.svg",
    "bg3.svg",
  ];

  List title = [
    'We provide best quality \n water',
    'Schedule when you want \n your water delivered',
    'Fast and responsibily \n delivery '
  ];

  List content = [
    "Lorem ipsum dolor sit amet, consectetur \n adipiscing elit, sed",
    "Lorem ipsum dolor sit amet, consectetur \n adipiscing elit, sed",
    "Lorem ipsum dolor sit amet, consectetur \n adipiscing elit, sed"
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Center(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int pageIndex) {
              setState(() {
                _currentPageIndex = pageIndex;
              });
            },
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _currentPageIndex == 0
                      ? Container(
                          height: 10,
                        )
                      : InkWell(
                          onTap: () {
                            if (_currentPageIndex > 0) {
                              setState(() {
                                _currentPageIndex--;
                              });
                              _pageController.animateToPage(
                                _currentPageIndex,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.only(right: 30),
                            height: 10,
                            alignment: Alignment.centerRight,
                            child: const Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: ColorApp.blueButtonColor,
                            ),
                          ),
                        ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/${img[index]}',
                      ),
                      const SizedBox(height: 13),
                      AppLargeText(text: title[index]),
                      const SizedBox(height: 20),
                      AppSmallText(text: content[index]),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.all(5),
                          width: index == indexDots ? 25 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: ColorApp.blueButtonColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      })),
                  InkWell(
                    onTap: () {
                      if (_currentPageIndex < 2) {
                        setState(() {
                          _currentPageIndex++;
                        });
                        _pageController.animateToPage(
                          _currentPageIndex,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WellcomePage(),
                          ),
                        );
                      }
                    },
                    child: AppButton(text: index == 2 ? "Get started" : "NEXT"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
