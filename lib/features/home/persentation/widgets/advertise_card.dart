import 'package:flutter/material.dart';
import 'package:rent_a_car/core/dimens/dimens.dart';

import '../../../../core/themes/app_pallete.dart';

class AdvertiseCard extends StatelessWidget {
  final String title;
  final MaterialColor mColor ;

  const AdvertiseCard({super.key, required this.title, required this.mColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
          width: AppDimens.screenWidth,
          height: 160.0,
          decoration: BoxDecoration(
              color: mColor,
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          child: Center(
            child: Text(
              title,style: const TextStyle(color: AppPallete.whiteColor, fontSize: 30.0),
            ),
          )),
    );
  }
}
