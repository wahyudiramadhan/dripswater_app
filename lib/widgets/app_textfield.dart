import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/app_color.dart';

class AppTextfield extends StatelessWidget {
  final String hint, title;
  final bool isObsecure;
  const AppTextfield(
      {super.key,
      this.hint = "hintText",
      this.isObsecure = false,
      this.title = "title"});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: ColorApp.textGrayColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 7),
        TextField(
          obscureText: true,
          obscuringCharacter: "*",
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(borderRadius: BorderRadius.zero),
          ),
        ),
      ],
    );
  }
}
