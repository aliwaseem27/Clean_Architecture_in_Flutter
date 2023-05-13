import 'package:clean_a/src/core/network/network_info.dart';
import 'package:clean_a/src/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:clean_a/src/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:clean_a/src/features/random_quote/data/repositories/quote_repository_impl.dart';
import 'package:clean_a/src/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:clean_a/src/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:clean_a/src/features/random_quote/presentation/cubits/random_quote_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // Features
  // Blocs
  sl.registerFactory(() => RandomQuoteCubit(getRandomQuoteUseCase: sl()));

  // Usecases
  sl.registerLazySingleton(() => GetRandomQuote(quoteRepository: sl()));

  // Repositories
  sl.registerLazySingleton<QuoteRepository>(
    () => QuoteRepositoryImpl(
        networkInfo: sl(),
        randomQuoteRemoteDataSource: sl(),
        randomQuoteLocalDataSource: sl()),
  );

  //Datasource
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSourceImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
