import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  // Titles
  static TextStyle title1({required Color color}) {
    return GoogleFonts.sourceSerifPro(
      fontSize: 60,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.37,
      color: color,
    );
  }

  static TextStyle title2({required Color color}) {
    return GoogleFonts.sourceSerifPro(
      fontSize: 40,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.6,
      color: color,
    );
  }

  static TextStyle title3({required Color color}) {
    return GoogleFonts.sourceSerifPro(
      fontSize: 34,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.24,
      color: color,
    );
  }

  static TextStyle title4({required Color color}) {
    return GoogleFonts.sourceSerifPro(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle title5({required Color color}) {
    return GoogleFonts.sourceSerifPro(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: color,
    );
  }

  // Headlines
  static TextStyle headline1({required Color color}) {
    return GoogleFonts.ibmPlexSans(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle headline2({required Color color}) {
    return GoogleFonts.ibmPlexSans(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.24,
      color: color,
    );
  }

  static TextStyle headline3({required Color color}) {
    return GoogleFonts.ibmPlexSans(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle headline4({required Color color}) {
    return GoogleFonts.ibmPlexSans(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: color,
    );
  }

  // Body
  static TextStyle body1({required Color color}) {
    return GoogleFonts.ibmPlexSans(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle body2({required Color color}) {
    return GoogleFonts.ibmPlexSans(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      letterSpacing: 0,
      color: color,
    );
  }

  // Captions
  static TextStyle caption1({required Color color}) {
    return GoogleFonts.ibmPlexSans(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle caption2({required Color color}) {
    return GoogleFonts.ibmPlexSans(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle caption3({required Color color}) {
    return GoogleFonts.ibmPlexSans(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      letterSpacing: 0,
      color: color,
    );
  }
}

// Example of using the fonts
// Text(
//   'Title 1',
//   style: AppFonts.title1(color: Colors.black),
// ),
// Text(
//   'Title 2',
//   style: AppFonts.title2(color: Colors.blue),
// ),
// Text(
//   'Headline 1',
//   style: AppFonts.headline1(color: Colors.red),
// ),
// Text(
//   'Body 1',
//   style: AppFonts.body1(color: Colors.green),
// ),
// Text(
//   'Caption 1',
//   style: AppFonts.caption1(color: Colors.orange),
