
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_car/core/drawables/drawable.dart';

import '../../../../core/dimens/dimens.dart';
import '../../../../core/themes/app_pallete.dart';

class SocialSignInButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  final String logo;
  const SocialSignInButton({super.key, required this.text, required this.callback, required this.logo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimens.screenWidth,
      height: AppDimens.screenHeight! * 0.06,
      decoration: BoxDecoration(
          color: AppPallete.whiteColor,
          borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: AppPallete.cinereousColor)
      ),
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
            backgroundColor: AppPallete.whiteColor,
            shadowColor: AppPallete.transparentColor
        ),
        onPressed: callback,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 20.0,),
            Image.asset(logo, width: 25.0, height: 25.0,),
            const SizedBox(width: 20.0,),
            Text(text, style: GoogleFonts.inter(
                textStyle:const TextStyle(color: AppPallete.tealGreenColor, fontSize: 18.0)
            ),),
          ],
        ),
      ),
    );
  }
}
