import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_car/core/drawables/drawable.dart';
import 'package:rent_a_car/core/themes/app_pallete.dart';
import 'package:rent_a_car/features/home/domain/models/car_item.dart';

class CarItemView extends StatelessWidget {
  final CarItem item;

  const CarItemView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
            decoration: BoxDecoration(
              color: AppPallete.whiteColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
                children: <Widget>[
                  Expanded(child: Image.asset(Drawable.lamborghini_car)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              item.price.toString(),
                              style: GoogleFonts.ptSans(
                                  textStyle: const TextStyle(
                                      fontSize: 18.0,
                                      color: AppPallete.tealGreenColor)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0,),
                        Row(
                          children: [
                            RichText(
                                text: TextSpan(
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                    children: <TextSpan>[
                                  TextSpan(
                                    text: '\$${item.price}',
                                    style: GoogleFonts.ptSans(
                                      textStyle: const TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextSpan(
                                    text: '/-',
                                    style: GoogleFonts.ptSans(
                                      textStyle: const TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black38,

                                          fontWeight: FontWeight.normal),
                                    ),
                                  )
                                ])),
                          ],
                        ),
                        const SizedBox(height: 2.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(Drawable.favorite_icon, width: 25.0, height: 25.0,),
                            const SizedBox(width: 8.0,),
                            Image.asset(Drawable.option_more_circular_bg_icon, width: 25.0, height: 25.0,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ])),
      ),
    );
  }
}
