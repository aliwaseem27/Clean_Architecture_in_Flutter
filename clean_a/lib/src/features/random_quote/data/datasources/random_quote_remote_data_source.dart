import 'dart:convert';

import 'package:clean_a/src/core/api/endpoints.dart';
import 'package:clean_a/src/core/error/exceptions.dart';
import 'package:clean_a/src/core/utils/app_strings.dart';
import 'package:clean_a/src/features/random_quote/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource{
  final http.Client client;
  RandomQuoteRemoteDataSourceImpl({required this.client});
  
  @override
  Future<QuoteModel> getRandomQuote() async {
    final randomQuoteUrl = Uri.parse(EndPoints.randomQuote);
    final response = await client.get(randomQuoteUrl, headers: {
      AppStrings.contentType:AppStrings.applicationJson,
    });
    if (response.statusCode == 200) {
      return QuoteModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
  
}