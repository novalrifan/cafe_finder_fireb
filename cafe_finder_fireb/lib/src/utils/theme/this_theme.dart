import 'package:cafe_finder_fireb/src/constants/color.dart';
import 'package:cafe_finder_fireb/src/utils/theme/widgets_theme/card_themes.dart';
import 'package:cafe_finder_fireb/src/utils/theme/widgets_theme/elevated_button_themes.dart';
import 'package:cafe_finder_fireb/src/utils/theme/widgets_theme/outlined_button_themes.dart';
import 'package:cafe_finder_fireb/src/utils/theme/widgets_theme/text_field_themes.dart';
import 'package:cafe_finder_fireb/src/utils/theme/widgets_theme/text_themes.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: white),
    backgroundColor: white,
    scaffoldBackgroundColor: cardbg,
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    outlinedButtonTheme: TOutLinedButtonTheme.lightOutLinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    cardColor: Colors.white38,
    cardTheme: TCardTheme.lightCardTheme,
  );
  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(color: tSecondary),
    backgroundColor: black,
    scaffoldBackgroundColor: tSecondary,
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    outlinedButtonTheme: TOutLinedButtonTheme.darkOutLinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darktInputDecorationTheme,
    cardTheme: TCardTheme.darkCardTheme,
    cardColor: Colors.black38,
  );
}
