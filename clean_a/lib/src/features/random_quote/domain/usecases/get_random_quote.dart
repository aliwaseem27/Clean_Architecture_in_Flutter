import 'package:clean_a/src/core/error/failures.dart';
import 'package:clean_a/src/core/usecases/usecase.dart';
import 'package:clean_a/src/features/random_quote/domain/entities/quote.dart';
import 'package:clean_a/src/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:dartz/dartz.dart';

class GetRandomQuote implements UseCase<Quote, NoParams> {
  final QuoteRepository quoteRepository;

  GetRandomQuote({ required this.quoteRepository});
  @override
  Future<Either<Failure, Quote>> call(NoParams params){
    return quoteRepository.getRandomQuote();
  }
}

