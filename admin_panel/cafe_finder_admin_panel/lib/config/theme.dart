import 'package:flutter/material.dart';

// ignore: long-method
ThemeData theme() {
  return ThemeData(
    colorScheme: const ColorScheme.highContrastLight()
        .copyWith(primary: const Color(0xFF003A33).withOpacity(0.67)),
    primaryColor: const Color(0xFF006A61),
    primaryColorDark: const Color(0xFF003A33).withOpacity(0.59),
    primaryColorLight: const Color(0xFF5BD6CA),
    //  const Color(0xFF009F94),
    scaffoldBackgroundColor: const Color.fromARGB(255, 230, 230, 230),
    backgroundColor: const Color.fromARGB(255, 230, 230, 230),
    fontFamily: 'Futura',
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(0xFF000006),
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      headline2: TextStyle(
        color: Color(0xFF000006),
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headline3: TextStyle(
        color: Color(0xFF000006),
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      headline4: TextStyle(
        color: Color(0xFF000006),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headline5: TextStyle(
        color: Color(0xFF000006),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      headline6: TextStyle(
        color: Color(0xFF000006),
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyText1: TextStyle(
        color: Color(0xFF000006),
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyText2: TextStyle(
        color: Color(0xFF000006),
        fontWeight: FontWeight.normal,
        fontSize: 10,
      ),
    ),
  );
}
