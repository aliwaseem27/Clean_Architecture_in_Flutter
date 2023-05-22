import 'package:clean_a/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LangRepository {
  Future<Either<Failure, bool>> changeLang({required String langCode});

  Future<Either<Failure, String?>> getSavedLang();
}
