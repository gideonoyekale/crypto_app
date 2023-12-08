import 'package:crypto_app/core/cores.dart';
import 'package:crypto_app/data/data.dart';
import 'package:crypto_app/presentation/bloc/app/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AppProviders {
  AppProviders();

  static List<Provider> providers(LocalStorageService sl) => [
        Provider<NavigationService>(
          create: (_) => NavigationService(),
        ),
        Provider<SnackbarService>(
          create: (c) => SnackbarService(),
        ),
        Provider<NetworkService>(
          create: (c) => NetworkService(),
        ),
        Provider<LocalStorageService>(
          create: (c) => sl,
        ),
        Provider<PortfolioLocalStorage>(
          create: (c) => PortfolioLocalStorage(
            c.read<LocalStorageService>(),
          ),
        ),
        Provider<PortfolioRepository>(
          create: (c) => PortfolioRepository(
            c.read<PortfolioLocalStorage>(),
          ),
        ),
      ];

  static final List<BlocProvider> blocProviders = [
    BlocProvider(
      create: (context) => AppCubit(),
    ),
  ];
}
