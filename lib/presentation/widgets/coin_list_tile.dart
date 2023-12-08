import 'package:collection/collection.dart';
import 'package:crypto_app/data/models/coin.dart';
import 'package:cryptofont/cryptofont.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/cores.dart';
import 'widgets.dart';

class CoinListTile extends StatelessWidget {
  final Color tileColor;
  final EdgeInsets? padding;
  final Coin data;
  final Function()? onLongPress;
  const CoinListTile({
    super.key,
    this.tileColor = Palette.primary4,
    this.padding,
    required this.data,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      radius: 12,
      splashColor: Palette.transparent,
      highlightColor: Palette.transparent,
      child: AppRectangle(
        color: tileColor,
        radius: 16,
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
        child: Row(
          children: [
            AppRectangle(
              color: Palette.primary2,
              height: 42,
              width: 42,
              radius: 10,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Icon(
                CryptoFontIcons.fromSymbol(data.code!) ?? IconlyLight.activity,
                size: 42 / 2,
                color: Colors.white,
              ),
            ),
            const Spacing.smallWidth(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    data.name!,
                    style: context.textTheme.medium?.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const Spacing.smallHeight(),
                  AppText(
                    data.code!,
                    fontSize: 12,
                    color: Palette.grey2,
                  ),
                ],
              ),
            ),
            const Spacing.smallWidth(),
            Expanded(
              child: SizedBox(
                height: 32,
                child: IgnorePointer(
                  child: CoinTimeSeriesGraph(
                    color: (data.sign!) > 0 ? Palette.leaf : Palette.infraRed,
                  ),
                ),
              ),
            ),
            const Spacing.mediumWidth(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText(
                  (data.price).currencyFormat,
                  style: context.textTheme.medium?.copyWith(
                    fontSize: 16,
                  ),
                ),
                const Spacing.smallHeight(),
                Row(
                  children: [
                    SvgPicture.asset(
                      data.sign! > 0
                          ? AppAssets.arrowUp
                          : AppAssets.arrowBottom,
                    ),
                    AppText(
                      '${data.sign.toString()}%',
                      fontSize: 12,
                      color: data.sign! > 0 ? Palette.leaf : Palette.infraRed,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CoinTimeSeriesGraph extends StatelessWidget {
  final Color? color;
  const CoinTimeSeriesGraph({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: const FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
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
            color: Palette.transparent,
          ),
        ),
        gridData: FlGridData(
          drawVerticalLine: false,
          drawHorizontalLine: false,
          verticalInterval: 1,
          horizontalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return const FlLine(
              color: Palette.transparent,
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return const FlLine(
              color: Palette.transparent,
              strokeWidth: 1,
            );
          },
        ),
        lineBarsData: [
          LineChartBarData(
            isStrokeCapRound: true,
            show: true,
            barWidth: 0.5,
            color: color ?? Palette.leaf,
            dotData: const FlDotData(show: false),
            spots: [
              1.0,
              0.0,
              2.0,
              1.0,
              3.0,
              4.0,
              7.0,
              8.0,
              9.0,
              5.0,
              4.0,
              3.0,
              6.0,
              10.0,
              4.0,
              2.0,
              1.0
            ].mapIndexed((i, e) => FlSpot(i * 1.0, e)).toList(),
            isCurved: true,
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [color ?? Palette.leaf, Palette.transparent]
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
