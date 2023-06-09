import 'dart:convert';

import 'package:clean_a/src/core/error/exceptions.dart';
import 'package:clean_a/src/core/utils/app_strings.dart';
import 'package:clean_a/src/features/random_quote/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();
  Future<void> cacheQuote(QuoteModel quoteModel);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheQuote(QuoteModel quoteModel) {
    return sharedPreferences.setString(AppStrings.cachedRandomQuote, json.encode(quoteModel.toJson()));
  }

  @override
  Future<QuoteModel> getLastRandomQuote() {
    final jsonString = sharedPreferences.getString(AppStrings.cachedRandomQuote);
    if (jsonString != null){
      final cachedRandomQuote =  Future.value(QuoteModel.fromJson(json.decode(jsonString)));
      return cachedRandomQuote;
    } else {
      throw CacheException();
    }
  }

}