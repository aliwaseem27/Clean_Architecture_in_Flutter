import 'package:clean_a/src/core/utils/app_colors.dart';
import 'package:clean_a/src/core/utils/app_strings.dart';
import 'package:clean_a/src/core/utils/constants.dart';
import 'package:clean_a/src/features/favorite_quote/presentation/screens/favorite_quote_screen.dart';
import 'package:clean_a/src/features/random_quote/presentation/widgets/quote_page_body.dart';
import 'package:flutter/material.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);
  static const String route = "/";

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(AppStrings.appName),

    );
    return Scaffold(
      // appBar: appBar,
      body: QuotePageBody(),
      // backgroundColor: AppColors.primary,
    );
  }
}
