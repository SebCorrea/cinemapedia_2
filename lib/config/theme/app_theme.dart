import 'package:flutter/material.dart';

class AppTheme {
  AppTheme();

  ThemeData getTheme() =>
      ThemeData(useMaterial3: true, colorSchemeSeed: const Color(0xff2865f5));
}
