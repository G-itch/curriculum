import 'package:curriculum/bar_chart/bar_data.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkillsBar extends StatefulWidget {
  const SkillsBar({super.key});

  @override
  State<SkillsBar> createState() => _SkillsBarState();
}

class _SkillsBarState extends State<SkillsBar> {
  int? ytouch = -1;
  @override
  Widget build(BuildContext context) {
    double? x = ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? 2 : 0;
    return BarChart(
      BarChartData(
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: false),
        // backgroundColor: Colors.red,
        groupsSpace: 6,
        minY: 0,
        maxY: 100,
        barTouchData: BarTouchData(
            handleBuiltInTouches: true,
            longPressDuration: Duration(seconds: 3),
            touchCallback: (p0, p1) {
              dynamic touch = p1?.spot?.touchedBarGroupIndex;
              if (touch is int) {
                setState(
                  () {
                    ytouch = touch;
                  },
                );
              } else {
                setState(() {
                  ytouch = -1;
                });
              }
              print(touch);
            },
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.transparent,
                getTooltipItem: (group, groupIndex, rod, rodIndex) =>
                    BarTooltipItem(
                        BarData()
                            .barData
                            .firstWhere((element) => element.id == group.x)
                            .name!,
                        GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: BarData()
                                .barData
                                .firstWhere((element) => element.id == group.x)
                                .color!)))),
        titlesData: FlTitlesData(show: false),
        barGroups: BarData()
            .barData
            .map((data) => BarChartGroupData(x: data.id!, barRods: [
                  BarChartRodData(
                      toY: ytouch == data.id! ? data.y! + 5 : data.y!,
                      gradient: LinearGradient(
                          begin: Alignment(-1, -1),
                          end: Alignment(1, 1),
                          colors: [
                            // Color.fromARGB(255, 236, 71, 60),
                            data.color!,
                            // BarData()
                            //     .barData
                            //     .firstWhere((element) =>
                            //         BarData().barData.length - 1 == data.id!
                            //             ? element.id == 0
                            //             : element.id == data.id! + 1)
                            //     .color!,
                            Color.fromARGB(255, 226, 215, 60)
                          ]),
                      // color: data.color,
                      width: ytouch == data.id! ? 18 + x : 16 + x,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(4), bottom: Radius.circular(4)))
                ]))
            .toList(),
      ),
      swapAnimationDuration: Duration(milliseconds: 300),
    );
  }
}
