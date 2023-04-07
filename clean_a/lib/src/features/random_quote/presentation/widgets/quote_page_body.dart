import 'package:clean_a/src/core/utils/app_colors.dart';
import 'package:clean_a/src/core/utils/media_query_values.dart';
import 'package:clean_a/src/features/random_quote/presentation/widgets/more_button.dart';
import 'package:flutter/material.dart';

class QuotePageBody extends StatelessWidget {
  const QuotePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      color: AppColors.primary,
      child: FractionallySizedBox(
        widthFactor: 0.8,
        heightFactor: 0.65,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.backGround,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "“" +
                          "Respect yourself enough to walk away from anything that no longer serves you, grows you, or makes you happy." +
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
                      "Robert Tew",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.authorText,
                      ),
                    ),
                  ],
                ),
              ),
              MoreButton(),
            ],
          ),
        ),
      ),
    );
  }
}
