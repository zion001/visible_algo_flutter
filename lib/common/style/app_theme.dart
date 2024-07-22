import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'index.dart';

class AppTheme {
  ///亮色
  static ThemeData light = ThemeData(
    colorScheme: MaterialTheme.lightScheme(),
    useMaterial3: false,
    appBarTheme:
        const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
  );

  ///暗色
  //static ThemeData dark = Theme
  static ThemeData dark = ThemeData(
    colorScheme: MaterialTheme.darkScheme(),
    useMaterial3: false,
    appBarTheme:
        const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
  );
}
