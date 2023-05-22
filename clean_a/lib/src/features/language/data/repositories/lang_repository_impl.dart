import 'package:clean_a/src/core/error/exceptions.dart';
import 'package:clean_a/src/core/error/failures.dart';
import 'package:clean_a/src/features/language/data/datasources/lang_local_data_source.dart';
import 'package:clean_a/src/features/language/domain/repositories/lang_repository.dart';
import 'package:dartz/dartz.dart';

class LangRepositoryImpl implements LangRepository{
  final LangLocalDataSource langLocalDataSource;

  LangRepositoryImpl({required this.langLocalDataSource});
  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final langIsChanged = await langLocalDataSource.changeLang(langCode: langCode);
      return Right(langIsChanged);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langCode = await langLocalDataSource.getSavedLang();
      return Right(langCode!);
    } on CacheException {
    return Left(CacheFailure());
    }
  }
}