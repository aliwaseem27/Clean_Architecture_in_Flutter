import 'package:clean_a/src/core/utils/app_colors.dart';
import 'package:clean_a/src/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black87,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      )
    ),
    // fontFamily: AppStrings.fontFamily,
    textTheme: const TextTheme(),
  );
}
