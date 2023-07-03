import 'package:dripswater/const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final double width, height, size, borderRadius;
  const AppButton({
    this.text = "Button",
    this.bgColor = ColorApp.blueButtonColor,
    this.textColor = Colors.white,
    this.width = .9,
    this.height = .08,
    this.size = 14.0,
    this.borderRadius = 0.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * width,
      height: MediaQuery.of(context).size.height * height,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        text.toUpperCase(),
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold, fontSize: size, color: textColor),
      ),
    );
  }
}

class AppOutlineButton extends StatelessWidget {
  final String text;
  const AppOutlineButton({this.text = "Button", super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
      ),
      width: MediaQuery.of(context).size.width * .9,
      height: MediaQuery.of(context).size.height * .08,
      child: Text(
        text.toUpperCase(),
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: ColorApp.textWhiteColor,
            textStyle: const TextStyle()),
      ),
    );
  }
}

class AppTextButton extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final Alignment alignment;
  final TextDecoration textDecoration;
  final double fontSize;
  const AppTextButton({
    this.text = "Button",
    this.color = ColorApp.textWhiteColor,
    this.fontWeight = FontWeight.normal,
    this.alignment = Alignment.center,
    this.textDecoration = TextDecoration.none,
    this.fontSize = 14.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * .04),
      alignment: alignment,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color,
            decoration: textDecoration,
            decorationThickness: 3),
      ),
    );
  }
}
