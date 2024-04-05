import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rent_a_car/core/dimens/dimens.dart';
import 'package:rent_a_car/core/drawables/drawable.dart';

class CarAppBar extends StatelessWidget {
  final VoidCallback onMenuOptionClick;
  const CarAppBar({super.key, required this.onMenuOptionClick});

  @override
  Widget build(BuildContext context) {
    AppDimens().init(context);
    return SizedBox(
        height: AppDimens.appBarHeight,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(onTap: onMenuOptionClick , child: Image.asset(Drawable.menu_icon)),
              Image.asset(Drawable.cart_icon),
            ],
          ),
        ));
  }
}
