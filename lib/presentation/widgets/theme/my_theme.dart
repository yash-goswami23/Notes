import 'package:flutter/material.dart';
import 'package:todolist_bloc/presentation/widgets/theme/app_colors.dart';

class MyTheme {
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    hintColor: AppColors.accentColor,
    scaffoldBackgroundColor: AppColors.lightBackground,
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(AppColors.lightPrimaryText),
    ),
    navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: AppColors.accentColor,
        indicatorColor: AppColors.lightPrimaryCard),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightPrimaryText)),
      focusColor: AppColors.lightPrimaryText,
    ),
    textTheme: const TextTheme(
        titleMedium: TextStyle(color: AppColors.lightPrimaryText),
        bodyMedium: TextStyle(color: AppColors.lightPrimaryCard),
        labelLarge: TextStyle(
            color: AppColors.accentColor,
            decoration: TextDecoration.lineThrough,
            decorationColor: AppColors.accentColor)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.accentColor,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.accentColor,
    ),
  );

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(AppColors.darkPrimaryText),
    ),
    hintColor: AppColors.accentColor,
    navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.black38,
        indicatorColor: AppColors.primaryColor),
    scaffoldBackgroundColor: AppColors.darkBackground,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkPrimaryText)),
      focusColor: AppColors.darkPrimaryText,
    ),
    textTheme: const TextTheme(
        titleMedium: TextStyle(color: AppColors.darkPrimaryText),
        bodyMedium: TextStyle(color: AppColors.darkPrimaryCard),
        labelLarge: TextStyle(
            color: AppColors.accentColor,
            decoration: TextDecoration.lineThrough,
            decorationColor: AppColors.accentColor)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.primaryColor,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
    ),
  );
}
