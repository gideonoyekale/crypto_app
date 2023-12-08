import 'package:collection/collection.dart';
import 'package:crypto_app/core/cores.dart';
import 'package:cryptofont/cryptofont.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../bloc/blocs.dart';
import '../../widgets/widgets.dart';

class MarketView extends StatefulWidget {
  const MarketView({super.key});

  @override
  State<MarketView> createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PortfolioCubit, PortfolioState>(
      listener: (context, state) {
        if (state.type == PortfolioStateType.error) {
          context.showError(state.message ?? '');
        }
        if (state.type == PortfolioStateType.watchListItemAdded) {
          context.showSuccess('Coin added from watch list');
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  AppRectangle(
                    height: MediaQuery.of(context).viewPadding.top,
                  ),
                  Row(
                    children: [
                      AppBarAction(
                        icon: IconlyLight.arrowLeft2,
                        onPressed: () {
                          context.read<AppCubit>().changePageIndex(0);
                        },
                      ),
                      const Spacing.smallWidth(),
                      const Spacer(),
                      const Icon(
                        CryptoFontIcons.eth,
                        color: Colors.blue,
                      ),
                      const Spacing.smallWidth(),
                      AppText(
                        'ETH / USDT',
                        alignment: TextAlign.center,
                        style: context.textTheme.medium,
                      ),
                      const Spacer(),
                      const Spacing.smallWidth(),
                      const AppBarAction(
                        icon: IconlyLight.chart,
                      )
                    ],
                  ),
                ],
              ),
            ),

            ///
            Expanded(
              child: SingleChildScrollView(
                child: AppRectangle(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppRectangle(
                            height: context.height(0.07),
                            width: context.width(0.015),
                            color: Palette.leaf,
                            radius: 100,
                          ),
                          const Spacing.mediumWidth(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                '3,839.65',
                                style: context.textTheme.large,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AppAssets.arrowUp),
                                  const AppText(
                                    ' 105 (%0.8)',
                                    fontSize: 12,
                                    color: Palette.leaf,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacing.bigHeight(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: ['2H', '1W', '1M', '1Y', 'All']
                            .mapIndexed(
                              (i, e) => AppRectangle(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                radius: 4,
                                color: i == 1 ? Palette.grey5 : null,
                                child: AppText(
                                  e,
                                  style: context.textTheme.small?.copyWith(
                                      fontSize: 10, color: Palette.white),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const Spacing.bigHeight(),
                      const SizedBox(
                        height: 270,
                        width: double.infinity,
                        child: CoinMarketGraph(),
                      ),
                      const Spacing.bigHeight(),
                      Row(
                        children: [
                          Spacing.width(context.width(0.07)),
                          Expanded(
                            child: AppButton(
                              height: 44,
                              color: Palette.infraRed,
                              onPressed: () {},
                              title: 'Buy',
                              titleFontSize: 16,
                            ),
                          ),
                          Spacing.width(context.width(0.03)),
                          Expanded(
                            child: AppButton(
                              height: 44,
                              color: Palette.leaf,
                              onPressed: () {},
                              title: 'Sell',
                              titleFontSize: 16,
                            ),
                          ),
                          Spacing.width(context.width(0.07)),
                        ],
                      ),
                      const Spacing.bigHeight(),
                      Row(
                        children: [
                          Expanded(
                            child: AppText(
                              'Quick watch',
                              style: context.textTheme.small?.copyWith(
                                color: Palette.grey2,
                              ),
                            ),
                          ),
                          TextIconButton(
                            title: 'See All ',
                            suffix: const Icon(
                              Icons.chevron_right,
                              size: 16,
                              color: Palette.grey2,
                            ),
                            textStyle: context.textTheme.small?.copyWith(
                              color: Palette.grey2,
                            ),
                          ),
                        ],
                      ),
                      const Spacing.height(4),
                      AppText(
                        'Long press any of the item to add it to your watch list',
                        fontSize: 12,
                        color: Palette.grey2,
                      ),
                      const Spacing.mediumHeight(),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (ctx, i) {
                          return CoinListTile(
                            tileColor: Palette.primary,
                            padding: EdgeInsets.zero,
                            data: DummyData.coins[i],
                            onLongPress: () {
                              context
                                  .read<PortfolioCubit>()
                                  .addToWatchList(DummyData.coins[i]);
                            },
                          );
                        },
                        separatorBuilder: (ctx, i) => const AppRectangle(
                          height: 1,
                          color: Palette.grey4,
                          margin: EdgeInsets.symmetric(vertical: 16),
                        ),
                        itemCount: DummyData.coins.length,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class CoinMarketGraph extends StatelessWidget {
  const CoinMarketGraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: 1,
              getTitlesWidget: (val, d) {
                final date = DateTime.now().add(Duration(days: val.toInt()));
                return Column(
                  children: [
                    const Spacing.height(12),
                    AppText(
                      DateFormat('EEE').format(date),
                      fontSize: 10,
                    ),
                    AppText(
                      date.day.toString(),
                      fontSize: 12,
                      color: Palette.grey3,
                    ),
                  ],
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (val, d) => AppText(
                '${val.toInt()}k',
                fontSize: 10,
              ),
              reservedSize: 20,
            ),
          ),
        ),
        rangeAnnotations: RangeAnnotations(
          horizontalRangeAnnotations: [
            HorizontalRangeAnnotation(
              y1: 0,
              y2: 10,
              color: Colors.transparent,
            ),
          ],
          verticalRangeAnnotations: [
            VerticalRangeAnnotation(
              x1: 0,
              x2: 5,
              color: Colors.transparent,
            ),
          ],
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(
            color: Palette.grey2.withOpacity(.2),
          ),
        ),
        gridData: FlGridData(
          drawVerticalLine: true,
          drawHorizontalLine: true,
          verticalInterval: 1,
          horizontalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Palette.grey2.withOpacity(.2),
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Palette.grey2.withOpacity(.2),
              strokeWidth: 1,
            );
          },
        ),
        lineBarsData: [
          LineChartBarData(
            isStrokeCapRound: true,
            show: true,
            color: Palette.leaf,
            dotData: const FlDotData(show: false),
            spots: [2.0, 3.0, 4.0, 7.0, 8.0, 9.0, 5.0, 4.0, 6.0, 10.0]
                .mapIndexed((i, e) => FlSpot(i * 1.0, e))
                .toList(),
            isCurved: true,
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [Palette.leaf, Palette.transparent]
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
              ),
            ),
            // gradient: secondaryGradient,
          ),
        ],
      ),
    );
  }
}
