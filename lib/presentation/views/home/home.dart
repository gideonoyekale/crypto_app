import 'package:crypto_app/presentation/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/cores.dart';
import '../../widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PortfolioCubit, PortfolioState>(
      listener: (context, state) {
        if (state.type == PortfolioStateType.error) {
          context.showError(state.message ?? '');
        }
        if (state.type == PortfolioStateType.watchListItemRemoved) {
          context.showSuccess('Coin removed from watch list');
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
                color: Palette.primary2,
              ),
              child: Column(
                children: [
                  AppRectangle(
                    height: MediaQuery.of(context).viewPadding.top,
                  ),
                  Row(
                    children: [
                      const Stack(
                        clipBehavior: Clip.none,
                        children: [
                          UserAvatar(),
                          Positioned(
                            right: -2,
                            bottom: 0,
                            child: AppRectangle(
                              padding: EdgeInsets.all(4),
                              shape: BoxShape.circle,
                              color: Palette.infraRed,
                              child: AppText(
                                '2',
                                color: Palette.white,
                                fontSize: 8,
                              ),
                            ),
                          )
                        ],
                      ),
                      const Spacing.smallWidth(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppText('Welcome Back'),
                            AppText(
                              'John',
                              style: context.textTheme.medium,
                            ),
                          ],
                        ),
                      ),
                      const Spacing.smallWidth(),
                      const AppBarAction(
                        icon: IconlyLight.wallet,
                        color: Palette.primary,
                      ),
                      const Spacing.smallWidth(),
                      const AppBarAction(
                        icon: IconlyLight.scan,
                        color: Palette.primary,
                      )
                    ],
                  ),
                  const Spacing.mediumHeight(),
                  AppRectangle(
                    radius: 12,
                    color: Palette.primary,
                    height: context.height(0.067),
                    padding: const EdgeInsets.fromLTRB(12, 0, 6, 0),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          IconlyLight.search,
                          color: Palette.grey1,
                        ),
                        Spacing.smallWidth(),
                        Expanded(
                          child: AppTextField(
                            padding: EdgeInsets.zero,
                            hintText: 'Search...',
                            fontSize: 16,
                          ),
                        ),
                        AppBarAction(
                          icon: IconlyLight.filter,
                          size: 40,
                        )
                      ],
                    ),
                  ),
                  Spacing.height(context.height(0.02)),
                  AppRectangle(
                    width: context.width(0.15),
                    height: 4,
                    color: Palette.grey3,
                    radius: 100,
                  ),
                  Spacing.height(context.height(0.02)),
                ],
              ),
            ),
            const Spacing.mediumHeight(),
            Expanded(
              child: SingleChildScrollView(
                child: AppRectangle(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // AppRectangle(
                      //   radius: 16,
                      //   color: Palette.grey3,
                      //   height: context.height(0.2),
                      //   gradient: Palette.addButtonGradient,
                      // ),
                      Stack(
                        children: [
                          AppRectangle(
                            margin: const EdgeInsets.all(1),
                            gradient: Palette.portfolioGradient,
                            width: double.infinity,
                            radius: 12,
                            height: context.height(0.198),
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const AppText(
                                  'Portfolio value',
                                  fontSize: 14,
                                  color: Palette.white,
                                ),
                                const Spacing.smallHeight(),
                                AppText(
                                  '\$47,412.65',
                                  style: context.textTheme.big,
                                ),
                                const Spacing.smallHeight(),
                                Row(
                                  children: [
                                    SvgPicture.asset(AppAssets.arrowUp),
                                    const AppText(
                                      ' \$105 (+1.6%)',
                                      fontSize: 12,
                                      color: Palette.leaf,
                                    ),
                                  ],
                                ),
                                const Spacing.mediumHeight(),
                                const GradientDivider(opacity: 0.2),
                                const Spacing.mediumHeight(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextIconButton(
                                      title: 'See All ',
                                      suffix: const Icon(
                                        Icons.chevron_right,
                                        size: 16,
                                        color: Palette.grey2,
                                      ),
                                      textStyle:
                                          context.textTheme.small?.copyWith(
                                        color: Palette.grey2,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.height(0.2),
                            child: Image.asset(
                              AppAssets.portfolioBorder,
                            ),
                          ),
                          Positioned(
                            right: 1,
                            top: 1,
                            child: Image.asset(
                              AppAssets.portfolioPattern1,
                            ),
                          ),
                          Positioned(
                            left: 1,
                            bottom: 1,
                            child: Image.asset(
                              AppAssets.portfolioPattern2,
                              height: context.height(0.1),
                            ),
                          ),
                        ],
                      ),
                      const Spacing.bigHeight(),
                      AppText(
                        'Watchlist',
                        style: context.textTheme.small?.copyWith(
                          fontSize: 18,
                          color: Palette.white,
                        ),
                      ),
                      // const Spacing.smallHeight(),
                      const AppText(
                        'Long press any of the item to remove it from your watch list',
                        fontSize: 12,
                        color: Palette.grey3,
                      ),
                      const Spacing.mediumHeight(),
                      state.watchList.isEmpty &&
                              state.type != PortfolioStateType.loading
                          ? Center(
                              child: Column(
                                children: [
                                  Spacing.height(context.height(0.1)),
                                  const AppText(
                                    'Watchlist is empty',
                                    fontSize: 16,
                                    alignment: TextAlign.center,
                                  ),
                                  Spacing.height(context.height(0.005)),
                                  const AppText(
                                    'You can go to market\nto add Items',
                                    fontSize: 10,
                                    alignment: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemBuilder: (ctx, i) {
                                return CoinListTile(
                                  data: state.watchList[i],
                                  onLongPress: () {
                                    context
                                        .read<PortfolioCubit>()
                                        .removeFromWatchList(i);
                                  },
                                );
                              },
                              separatorBuilder: (ctx, i) =>
                                  const Spacing.mediumHeight(),
                              itemCount: state.watchList.length,
                            ),
                      Spacing.height(context.height(0.1)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
