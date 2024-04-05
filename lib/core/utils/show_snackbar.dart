import 'package:flutter/material.dart';
import '../themes/app_pallete.dart';

void showSnackBar(BuildContext context, String content,
    {bool isError = false}) {
  Color backgroundColor = isError ? AppPallete.errorColor : AppPallete.successColor;
  Color textColor = isError ? AppPallete.whiteColor : AppPallete.whiteColor;
  var snackBar = SnackBar(
    content: Text(content,
        style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600, color: textColor)),
    backgroundColor: backgroundColor,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(milliseconds: 3000),
    padding: const EdgeInsets.only(left: 20.0, right: 5.0),
    margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
    elevation: 30.0,
    action: SnackBarAction(
      label: 'Dismiss',
      disabledTextColor: Colors.white,
      textColor: textColor,
      onPressed: () {
        //Do whatever you want
      },
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
