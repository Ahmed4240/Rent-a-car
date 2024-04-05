import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_car/core/themes/app_pallete.dart';

class StartedButton extends StatelessWidget {
final VoidCallback callback;
  const StartedButton({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shadowColor: Colors.white,
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppPallete.errorColor,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppPallete.transparentColor,
                shadowColor: AppPallete.transparentColor,
            fixedSize: const Size(250.0, 38.0)),
            onPressed: callback,
            child: Text(
              'Get started >',
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(color: AppPallete.whiteColor, fontSize: 20.0)),
            )),
      ),
    );
  }
}
