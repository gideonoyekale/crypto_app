import 'package:crypto_app/core/cores.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'app/bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Palette.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  Bloc.observer = AppBlocObserver();
  final localStorage = LocalStorageService.instance;
  await localStorage.init();
  runApp(
    MultiProvider(
      providers: AppProviders.providers(localStorage),
      child: const App(),
    ),
  );
}
