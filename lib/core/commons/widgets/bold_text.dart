import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoldText extends StatelessWidget {
  final String content;
  final Color textColor;

  const BoldText({super.key, required this.content, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(content,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
              color: textColor, fontSize: 25.0, fontWeight: FontWeight.bold),
        ), textAlign: TextAlign.center);
  }
}
