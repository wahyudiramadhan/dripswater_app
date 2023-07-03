import 'package:flutter/material.dart';

import '../const/app_color.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text.dart';
import '../widgets/app_textfield.dart';
import 'login_page.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme:
            const IconThemeData(color: ColorApp.blueButtonColor, size: 35),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const AppLargeText(
                text: "Create your Account",
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
                title: "Name",
                hint: "Product Experience",
              ),
              const SizedBox(height: 17),
              const AppTextfield(
                title: "Email",
                hint: "Productionexperience@gmail.com",
              ),
              const SizedBox(height: 17),
              const AppTextfield(
                isObsecure: true,
                title: "Password",
                hint: "****************",
              ),
              const SizedBox(height: 17),
              const AppTextfield(
                isObsecure: true,
                title: "Confirm Password",
                hint: "****************",
              ),
              const SizedBox(height: 67),
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
                        builder: (context) => const LoginPage(),
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
      ),
    );
  }
}
