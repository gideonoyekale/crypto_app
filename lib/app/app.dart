import 'package:bot_toast/bot_toast.dart';
import 'package:crypto_app/presentation/bloc/app/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';

import '../core/cores.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MultiBlocProvider(
        providers: AppProviders.blocProviders,
        child: MaterialApp(
          title: 'AFEX Crypto App',
          // themeMode: appState.themeMode,
          builder: BotToastInit(),
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            scaffoldBackgroundColor: Palette.primary,
            extensions: <ThemeExtension<dynamic>>[
              AppThemeData.light(),
            ],
          ),
          darkTheme: ThemeData(
            scaffoldBackgroundColor: Palette.primary,
            extensions: <ThemeExtension<dynamic>>[
              AppThemeData.dark(),
            ],
          ),
          onGenerateRoute: Routes.generateRoute,
          initialRoute: Routes.index,
          debugShowCheckedModeBanner: false,
          navigatorObservers: [
            BotToastNavigatorObserver(),
          ],
          // home: child!,
        ),
      ),
    );
  }
}
