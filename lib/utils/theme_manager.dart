import 'package:flutter/material.dart';
import 'package:heynoteapp/utils/themes.dart';

class ThemeManager {
  //light theme
  ThemeData lightTheme = const MaterialTheme(TextTheme()).lightMediumContrast();
  ThemeData darkTheme = const MaterialTheme(TextTheme()).darkMediumContrast();
}
