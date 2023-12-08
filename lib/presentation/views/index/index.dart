import 'dart:ui';

import 'package:crypto_app/core/cores.dart';
import 'package:crypto_app/data/data.dart';
import 'package:crypto_app/presentation/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../widgets/widgets.dart';
import '../home/home.dart';
import '../market/market.dart';

class AppIndex extends StatefulWidget {
  const AppIndex({super.key});

  @override
  State<AppIndex> createState() => _AppIndexState();
}

class _AppIndexState extends State<AppIndex> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => PortfolioCubit(context.read<PortfolioRepository>()),
      child: BlocProvider(
        create: (c) => AppCubit(),
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return Scaffold(
              body: Stack(
                alignment: Alignment.bottomCenter,
                fit: StackFit.loose,
                children: [
                  state.pageIndex == 0 ? const HomeView() : const MarketView(),
                  if (state.pageIndex == 0) ...[
                    Positioned(
                      // bottom: 0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppRectangle(
                            height: 1,
                            width: double.infinity,
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.white.withOpacity(0.5),
                                Colors.transparent
                              ],
                            ),
                          ),
                          ClipRRect(
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                              child: AppRectangle(
                                // padding: const EdgeInsets.all(16),
                                height: context.height(0.1),
                                color: Palette.primary.withOpacity(0.1),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BottomBarItem(
                                      selected: state.pageIndex == 0,
                                      selectedIcon: IconlyBold.home,
                                      unselectedIcon: IconlyLight.home,
                                      onPressed: () => context
                                          .read<AppCubit>()
                                          .changePageIndex(0),
                                    ),
                                    BottomBarItem(
                                      selected: state.pageIndex == 1,
                                      selectedIcon: IconlyBold.activity,
                                      unselectedIcon: IconlyLight.activity,
                                      onPressed: () => context
                                          .read<AppCubit>()
                                          .changePageIndex(1),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: context.height(0.05),
                      child: AppRectangle(
                        shape: BoxShape.circle,
                        height: context.height(0.1),
                        width: context.height(0.1),
                        gradient: Palette.addButtonGradient,
                        child: Icon(
                          Icons.add_rounded,
                          color: Palette.white,
                          size: context.height(0.05),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final bool selected;
  final IconData selectedIcon;
  final IconData unselectedIcon;
  final Function() onPressed;

  const BottomBarItem({
    super.key,
    required this.selected,
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppButton(
        padding: EdgeInsets.all(12),
        onPressed: onPressed,
        child: AppRectangle(
          child: Icon(
            selected ? selectedIcon : unselectedIcon,
            size: selected ? 36 : 32,
            color: Palette.white,
          ),
        ),
      ),
    );
  }
}
