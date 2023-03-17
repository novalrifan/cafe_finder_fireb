import 'package:cafe_finder_fireb/src/constants/color.dart';
import 'package:cafe_finder_fireb/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      foregroundColor: white,
      backgroundColor: tEals,
      side: BorderSide(color: tEals),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      foregroundColor: tSecondary,
      backgroundColor: white,
      side: const BorderSide(color: white),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
}
