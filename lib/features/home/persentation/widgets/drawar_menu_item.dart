import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_car/core/themes/app_pallete.dart';

import '../../domain/models/drawer_menu_item.dart';

class DrawerMenuItem extends StatelessWidget {
  final MenuItem item;

  const DrawerMenuItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
      child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: AppPallete.lightGrayColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  item.image,
                  width: 25.0,
                  height: 25.0,
                ),
                Text(
                  item.title,
                  style: GoogleFonts.redHatText(
                      textStyle: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: AppPallete.tealGreenColor)),
                ),
                const Icon(Icons.arrow_forward_ios_rounded),
              ])),
    );
  }
}
