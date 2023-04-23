import 'package:clean_a/src/core/error/failures.dart';
import 'package:clean_a/src/core/network/network_info.dart';
import 'package:clean_a/src/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:clean_a/src/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:clean_a/src/features/random_quote/domain/entities/quote.dart';
import 'package:clean_a/src/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:dartz/dartz.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  QuoteRepositoryImpl(
    this.networkInfo,
    this.randomQuoteRemoteDataSource,
    this.randomQuoteLocalDataSource,
  );

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected){

    } else {

    }
    /*
    * if (is connected){
    *   gets quote from api
    * } else {
    *   gets quote from cache
    * }
    *  */
  }
}
