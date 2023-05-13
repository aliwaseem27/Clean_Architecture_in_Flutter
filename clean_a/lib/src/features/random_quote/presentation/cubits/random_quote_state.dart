part of 'random_quote_cubit.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();
}

class RandomQuoteInitial extends RandomQuoteState {
  @override
  List<Object> get props => [];
}

class RandomQuoteIsLoading extends RandomQuoteState {
  @override
  List<Object?> get props => [];
}

class RandomQuoteLoaded extends RandomQuoteState {
  final Quote quote;

  const RandomQuoteLoaded({required this.quote});
  @override
  List<Object> get props => [quote];
}

class RandomQuoteError extends RandomQuoteState {
  final String msg;

  const RandomQuoteError({required this.msg});
  @override
  List<Object> get props => [msg];
}