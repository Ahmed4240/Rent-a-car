
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_car/core/themes/app_pallete.dart';

import '../../../../core/dimens/dimens.dart';

class MultiColorText extends StatelessWidget {
  const MultiColorText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 50.0,
          color: Colors.black,
          fontWeight: FontWeight.normal
        ),
        children: <TextSpan>[
          TextSpan(text: 'T', style: GoogleFonts.iceberg(textStyle: const TextStyle(color: AppPallete.whiteColor),)),
          TextSpan(text: 'I', style: GoogleFonts.iceberg(textStyle: const TextStyle(color: AppPallete.tealGreenColor),)),
          TextSpan(text: 'I', style: GoogleFonts.iceberg(textStyle: const TextStyle(color: AppPallete.tealGreenColor),)),
          TextSpan(text: 'R', style: GoogleFonts.iceberg(textStyle: const TextStyle(color: AppPallete.whiteColor),)),
          TextSpan(text: 'A', style: GoogleFonts.iceberg(textStyle: const TextStyle(color: AppPallete.whiteColor),)),
        ],
      ),
    );;
  }
}
