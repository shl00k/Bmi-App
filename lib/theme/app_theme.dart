import 'package:bmi_app/theme/app_text_theme.dart';
import 'package:bmi_app/theme/color_tokens.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightModeTheme = ThemeData.dark().copyWith(
    textTheme: AppTextTheme.typography.apply(
      fontFamily: 'FunnelSans',
      displayColor: ColorTokens.secondary05,
      bodyColor: ColorTokens.secondary05,
    ),
    appBarTheme: AppBarTheme(backgroundColor: ColorTokens.secondary90),
    scaffoldBackgroundColor: ColorTokens.secondary80,
  );
  static final darkModeTheme = ThemeData.dark().copyWith(
    textTheme: AppTextTheme.typography.apply(
      fontFamily: 'FunnelSans',
      displayColor: ColorTokens.secondary95,
      bodyColor: ColorTokens.secondary95,
    ),
    appBarTheme: AppBarTheme(backgroundColor: ColorTokens.secondary10),
    scaffoldBackgroundColor: ColorTokens.secondary05,
  );
}
