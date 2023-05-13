import 'package:clean_a/src/core/utils/app_colors.dart';
import 'package:clean_a/src/features/random_quote/domain/entities/quote.dart';
import 'package:flutter/material.dart';

class QuoteContent extends StatelessWidget {
  final Quote quote;
  const QuoteContent({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "“" +
                quote.content +
                "”",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.mainText,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            quote.author,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.authorText,
            ),
          ),
        ],
      ),
    );
  }
}
