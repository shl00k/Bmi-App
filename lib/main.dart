import 'package:bmi_app/presentation/pages/home_page.dart';
import 'package:bmi_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true;

  void onThemeChange(bool themeStatus) {
    setState(() {
      isDarkMode = themeStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: isDarkMode ? AppTheme.darkModeTheme : AppTheme.lightModeTheme,
      home: HomePage(isDarkMode: isDarkMode, onThemeChange: onThemeChange),
    );
  }
}
