import 'package:clean_a/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:clean_a/app.dart';
import 'package:clean_a/src/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const QuoteApp());
  Bloc.observer = AppBlocObserver();
}