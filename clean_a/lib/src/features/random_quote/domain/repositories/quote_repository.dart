import 'package:dartz/dartz.dart';

import 'package:clean_a/src/core/error/failures.dart';
import 'package:clean_a/src/features/random_quote/domain/entities/quote.dart';

abstract class QuoteRepository {
  Future<Either<Failure, Quote>> getRandomQuote();
}