import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'radar_data_class.dart';

class RadarData {
  List<RadarClass> radardata = [
    RadarClass(values: []),
    RadarClass(
      values: [1, 0.7, 0.8, 0.8, 0.7],
    ),
    RadarClass(
      values: [0.9, 0.7, 1, 0.8, 0.5],
    ),
    RadarClass(
      values: [0.7, 0.8, 0.6, 0.7, 1],
    ),
    RadarClass(
      values: [0.6, 0.6, 1, 0.4, 0.7],
    ),
    RadarClass(
      values: [0.3, 0.6, 0.8, 0.4, 0.2],
    ),
  ];
}
