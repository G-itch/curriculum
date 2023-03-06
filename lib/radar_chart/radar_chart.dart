import 'package:curriculum/radar_chart/radar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SkillsRadar extends StatefulWidget {
  const SkillsRadar({super.key});

  @override
  State<SkillsRadar> createState() => _SkillsRadarState();
}

class _SkillsRadarState extends State<SkillsRadar> {
  @override
  Widget build(BuildContext context) {
    return RadarChart(RadarChartData(
      dataSets: [RadarData().radardata[0]]
          .map(
            (data) => RadarDataSet(
                dataEntries:
                    data.values.map((e) => RadarEntry(value: e)).toList(),
                fillColor: data.fillcolor,
                borderColor: data.bordercolor),
          )
          .toList(),
      radarBorderData: BorderSide(color: Colors.transparent),
      radarShape: RadarShape.circle,
      gridBorderData: BorderSide(color: Colors.transparent),
      tickBorderData: BorderSide(color: Colors.transparent),
    ));
  }
}
