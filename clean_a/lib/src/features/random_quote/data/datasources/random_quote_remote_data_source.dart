import 'dart:convert';

import 'package:clean_a/src/core/api/api_consumer.dart';
import 'package:clean_a/src/core/api/endpoints.dart';
import 'package:clean_a/src/core/error/exceptions.dart';
import 'package:clean_a/src/core/utils/app_strings.dart';
import 'package:clean_a/src/features/random_quote/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource{
  ApiConsumer apiConsumer;
  RandomQuoteRemoteDataSourceImpl({required this.apiConsumer});
  
  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await apiConsumer.get(EndPoints.randomQuote);
    return QuoteModel.fromJson(response);
  }
  
}