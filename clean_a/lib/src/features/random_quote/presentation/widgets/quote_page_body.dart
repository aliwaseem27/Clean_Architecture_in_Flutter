import 'package:clean_a/src/core/utils/app_colors.dart';
import 'package:clean_a/src/core/utils/media_query_values.dart';
import 'package:clean_a/src/features/random_quote/presentation/cubits/random_quote_cubit.dart';
import 'package:clean_a/src/features/random_quote/presentation/widgets/more_button.dart';
import 'package:clean_a/src/features/random_quote/presentation/widgets/quote_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuotePageBody extends StatefulWidget {
  const QuotePageBody({Key? key}) : super(key: key);

  @override
  State<QuotePageBody> createState() => _QuotePageBodyState();
}

class _QuotePageBodyState extends State<QuotePageBody> {

  _getRandomQuote() =>BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();

  @override
  void initState(){
    super.initState();
    _getRandomQuote();
  }

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
          child: BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
            builder: (context, state){
              if (state is RandomQuoteIsLoading){
                return Center(child: Text("Loading ... "),);
              } else if (state is RandomQuoteError) {
                return Center(child: Column(
                  children: [
                    Text("Error !!! "),
                    MoreButton(onPressed: _getRandomQuote,),
                  ],
                ),);
              } else if (state is RandomQuoteLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QuoteContent(quote: state.quote,),
                    MoreButton(onPressed: _getRandomQuote,),
                  ],
                );
              } else {
                return Center(child: Column(
                  children: [
                    Text("Something went wrong !!"),
                    MoreButton(onPressed: _getRandomQuote,),
                  ],
                ),);
              }
            },
          ),
        ),
      ),
    );
  }
}
