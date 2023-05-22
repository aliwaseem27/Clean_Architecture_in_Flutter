import 'package:clean_a/src/core/error/failures.dart';
import 'package:clean_a/src/core/usecases/usecase.dart';
import 'package:clean_a/src/features/language/domain/repositories/lang_repository.dart';
import 'package:dartz/dartz.dart';

class ChangeLangUseCase implements UseCase<bool, String> {
  final LangRepository langRepository;

  ChangeLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, bool>> call(String langCode) async =>
      await langRepository.changeLang(langCode: langCode);
}
