import 'package:clean_a/src/core/error/failures.dart';
import 'package:clean_a/src/core/usecases/usecase.dart';
import 'package:clean_a/src/features/language/domain/repositories/lang_repository.dart';
import 'package:dartz/dartz.dart';

class GetSavedLangUseCase implements UseCase<String, NoParams>{
  final LangRepository langRepository;

  GetSavedLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, String>> call(NoParams params) async => await langRepository.getSavedLang();
}