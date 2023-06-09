import 'package:clean_a/src/core/error/exceptions.dart';
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

  QuoteRepositoryImpl({
    required this.networkInfo,
    required this.randomQuoteRemoteDataSource,
    required this.randomQuoteLocalDataSource,
  });

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRandomQuote =
            await randomQuoteRemoteDataSource.getRandomQuote();
        randomQuoteLocalDataSource.cacheQuote(remoteRandomQuote);
        return Right(remoteRandomQuote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cacheRandomQuote =
            await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(cacheRandomQuote);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
