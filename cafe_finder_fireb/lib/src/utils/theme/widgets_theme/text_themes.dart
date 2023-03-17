import 'package:cafe_finder_fireb/src/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  TTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
      headline1: GoogleFonts.montserrat(
          fontSize: 28.0, fontWeight: FontWeight.bold, color: tSecondary),
      headline2: GoogleFonts.montserrat(
          color: tSecondary, fontSize: 24.0, fontWeight: FontWeight.w700),
      headline3: GoogleFonts.poppins(
          fontSize: 24.0, fontWeight: FontWeight.w700, color: tSecondary),
      headline5: GoogleFonts.aBeeZee(
          fontSize: 13.0, fontWeight: FontWeight.w600, color: tSecondary),
      headline4: GoogleFonts.poppins(
          fontSize: 16.0, fontWeight: FontWeight.w600, color: tSecondary),
      headline6: GoogleFonts.poppins(
          fontSize: 14.0, fontWeight: FontWeight.w600, color: tSecondary),
      bodyText1: GoogleFonts.poppins(
          fontSize: 14.0, fontWeight: FontWeight.normal, color: tSecondary),
      bodyText2: GoogleFonts.poppins(
          fontSize: 11.0, fontWeight: FontWeight.normal, color: tSecondary),
      subtitle2: GoogleFonts.poppins(
        color: Colors.black54,
        fontSize: 24,
      ));
  static TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
        fontSize: 28.0, fontWeight: FontWeight.bold, color: white),
    headline2: GoogleFonts.montserrat(
        color: white, fontSize: 24.0, fontWeight: FontWeight.w700),
    headline3: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.w700, color: white),
    headline4: GoogleFonts.poppins(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: white),
    headline5: GoogleFonts.aBeeZee(
        fontSize: 13.0, fontWeight: FontWeight.w600, color: white),
    headline6: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.w600, color: white),
    bodyText1: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: white),
    bodyText2: GoogleFonts.poppins(
        fontSize: 11.0, fontWeight: FontWeight.normal, color: white),
    subtitle2: GoogleFonts.poppins(
      color: Colors.white60,
      fontSize: 24,
    ),
  );
}
