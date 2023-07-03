import 'package:dripswater/const/app_color.dart';
import 'package:dripswater/pages/regist_page.dart';
import 'package:dripswater/widgets/app_button.dart';
import 'package:dripswater/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../widgets/app_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: ColorApp.blueButtonColor,
          size: 35,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const AppLargeText(
              text: "Welcome Back!",
              color: ColorApp.textBlueColor,
            ),
            const SizedBox(height: 12),
            const AppSmallText(
              text:
                  "Please fill in your email password to login to\nyour account.",
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 39),
            const AppTextfield(
              title: "Email",
              hint: "Productionexperience@gmail.com",
            ),
            const SizedBox(height: 19),
            const AppTextfield(
              title: "Password",
              hint: "************",
              isObsecure: true,
            ),
            const SizedBox(height: 9),
            const AppTextButton(
              color: ColorApp.textGrayColor,
              text: "Forgot Password?",
              fontWeight: FontWeight.bold,
              alignment: Alignment.centerRight,
            ),
            const SizedBox(height: 100),
            const AppButton(
              text: "Login",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don’t  have an account?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationPage(),
                    ),
                  ),
                  child: const AppTextButton(
                    text: "Sign UP",
                    color: ColorApp.textBlueColor,
                    alignment: Alignment.centerLeft,
                    fontWeight: FontWeight.bold,
                    textDecoration: TextDecoration.underline,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
