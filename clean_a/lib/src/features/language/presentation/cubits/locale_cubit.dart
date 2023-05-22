import 'package:clean_a/src/core/utils/app_strings.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(ChangeLocaleState(Locale(AppStrings.englishCode)));

// get saved language from shared prefrences

// change Locale
}
