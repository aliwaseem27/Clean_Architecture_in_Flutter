import 'package:clean_a/src/core/api/api_consumer.dart';
import 'package:clean_a/src/core/api/endpoints.dart';
import 'package:clean_a/src/features/random_quote/data/models/quote_model.dart';

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