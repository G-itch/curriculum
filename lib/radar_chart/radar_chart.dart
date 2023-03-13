import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:curriculum/radar_chart/radar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SkillsRadar extends StatefulWidget {
  const SkillsRadar(
      {required this.radarcolor,
      required this.indexskill,
      required this.stack,
      super.key});
  final int indexskill;
  final Color radarcolor;
  final String stack;
  @override
  State<SkillsRadar> createState() => _SkillsRadarState();
}

class _SkillsRadarState extends State<SkillsRadar> {
  int? last;
  late AnimationController effecttext;

  @override
  Widget build(BuildContext context) {
    String item = widget.stack;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          item,
          style: TextStyle(
              fontFamily: "nasalization",
              color: widget.radarcolor,
              fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: RadarChart(
            RadarChartData(
                dataSets: [RadarData().radardata[widget.indexskill]]
                    .map(
                      (data) => RadarDataSet(
                          dataEntries: data.values.isEmpty
                              ? [
                                  RadarEntry(value: 0),
                                  RadarEntry(value: 0),
                                  RadarEntry(value: 0),
                                  RadarEntry(value: 0),
                                  RadarEntry(value: 0)
                                ]
                              : data.values
                                  .map((e) => RadarEntry(value: e))
                                  .toList(),
                          fillColor: Colors.transparent,
                          borderColor: widget.radarcolor,
                          borderWidth: 2,
                          entryRadius: data.values.isEmpty ? 0 : 5),
                    )
                    .toList(),
                radarBorderData: BorderSide(color: widget.radarcolor),
                radarShape: RadarShape.circle,
                gridBorderData: BorderSide(color: Colors.transparent),
                tickBorderData: BorderSide(color: Colors.transparent),
                titleTextStyle: TextStyle(
                    fontFamily: "nasalization", color: widget.radarcolor),
                getTitle: (index, angle) {
                  switch (index) {
                    case 0:
                      return RadarChartTitle(text: sk[index]);
                    case 1:
                      return RadarChartTitle(
                          text: sk[index], positionPercentageOffset: 0.32);
                    case 2:
                      return RadarChartTitle(text: sk[index]);
                    case 3:
                      return RadarChartTitle(text: sk[index]);
                    case 4:
                      return RadarChartTitle(
                          text: sk[index], positionPercentageOffset: 0.5);
                    default:
                      return RadarChartTitle(text: "");
                  }
                }),
            swapAnimationDuration: Duration(milliseconds: 800),
            swapAnimationCurve: Curves.easeInOut,
          ),
        ),
      ],
    );
  }
}

List<String> sk = ["Development", "Docs", "Sintax", "Work", "Semantic"];
