import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_car/core/dimens/dimens.dart';
import 'package:rent_a_car/core/themes/app_pallete.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  const PrimaryButton({super.key, required this.text, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimens.screenWidth,
      height: AppDimens.screenHeight! * 0.06,
      decoration: BoxDecoration(
        color: AppPallete.tealGreenColor,
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.transparentColor,
          shadowColor: AppPallete.transparentColor
        ),
        onPressed: callback,
        child: Text(text, style: GoogleFonts.inter(
          textStyle:const TextStyle(color: AppPallete.whiteColor)
        ),),
      ),
    );
  }
}
