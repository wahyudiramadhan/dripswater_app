import 'package:dripswater/const/app_color.dart';
import 'package:dripswater/pages/home_page.dart';
import 'package:dripswater/pages/login_page.dart';
import 'package:dripswater/pages/regist_page.dart';
import 'package:dripswater/widgets/app_button.dart';
import 'package:dripswater/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WellcomePage extends StatelessWidget {
  WellcomePage({super.key});

  final List image = [
    "wellcome_img.png",
    "wellcome_img.png",
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/wellcome_img.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const AppLargeText(
                    text: "Welcome to Drips water",
                    color: Colors.white,
                  ),
                  const AppSmallText(
                    text: "Water Delivery app",
                    color: Colors.white,
                  ),
                  const SizedBox(height: 28),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationPage(),
                      ),
                    ),
                    child: const AppButton(
                      text: "Create an account",
                      bgColor: Colors.white,
                      textColor: ColorApp.whiteGrayColor,
                    ),
                  ),
                  const SizedBox(height: 18),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    ),
                    child: const AppOutlineButton(
                      text: "Login",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const HomePage()));
                    },
                    child: const AppTextButton(
                      text: "Continue as Guest",
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
