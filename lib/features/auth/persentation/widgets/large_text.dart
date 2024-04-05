
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_car/core/themes/app_pallete.dart';

class LargeText extends StatelessWidget {
  final String text;
  const LargeText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.imprima(
      textStyle: const TextStyle(color: AppPallete.neonGrayColor, fontSize: 50.0)
    ));
  }
}
