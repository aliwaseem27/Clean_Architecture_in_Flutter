import 'package:clean_a/src/config/routes/app_routes.dart';
import 'package:clean_a/src/config/themes/app_theme.dart';
import 'package:clean_a/src/core/utils/app_strings.dart';
import 'package:clean_a/src/features/random_quote/presentation/screens/quote_screen.dart';
import 'package:flutter/material.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: appTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}