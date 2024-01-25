import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heynoteapp/utils/themes.dart';

class ThemeManager {
  //light theme
  ThemeData lightTheme = MaterialTheme(const TextTheme()
          .copyWith(
            bodyLarge: const TextStyle(),
            bodyMedium: const TextStyle(),
            bodySmall: const TextStyle(),
            titleLarge: const TextStyle(),
            titleMedium: const TextStyle(),
            titleSmall: const TextStyle(),
          )
          .apply(fontFamily: GoogleFonts.robotoSerif().fontFamily))
      .darkMediumContrast()
      .copyWith(
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(fontFamily: GoogleFonts.lora().fontFamily)))));

  //darkTheme
  ThemeData darkTheme = MaterialTheme(const TextTheme()
          .copyWith(
            bodyLarge: const TextStyle(),
            bodyMedium: const TextStyle(),
            bodySmall: const TextStyle(),
            titleLarge: const TextStyle(),
            titleMedium: const TextStyle(),
            titleSmall: const TextStyle(),
          )
          .apply(fontFamily: GoogleFonts.robotoSerif().fontFamily))
      .darkMediumContrast()
      .copyWith(
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(fontFamily: GoogleFonts.lora().fontFamily)))));
}
