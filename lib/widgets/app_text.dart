import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLargeText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const AppLargeText({
    super.key,
    required this.text,
    this.color = Colors.black54,
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}

class AppSmallText extends StatelessWidget {
  final Color color;
  final String text;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  const AppSmallText(
      {super.key,
      required this.text,
      this.color = Colors.black54,
      this.textAlign = TextAlign.center,
      this.fontSize = 14.0,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
