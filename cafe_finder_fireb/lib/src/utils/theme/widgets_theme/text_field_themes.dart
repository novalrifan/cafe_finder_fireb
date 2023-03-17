import 'package:cafe_finder_fireb/src/constants/color.dart';
import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();
  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
          border: OutlineInputBorder(),
          prefixIconColor: tSecondary,
          floatingLabelStyle: TextStyle(color: tSecondary),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: tSecondary),
          ));

  static InputDecorationTheme darktInputDecorationTheme =
      const InputDecorationTheme(
          border: OutlineInputBorder(),
          prefixIconColor: white,
          floatingLabelStyle: TextStyle(color: white),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: white),
          ));
}
