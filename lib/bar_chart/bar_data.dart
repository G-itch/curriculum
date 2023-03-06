import 'package:curriculum/bar_chart/bar_data_class.dart';
import 'package:flutter/material.dart';

class BarData {
  int interval = 5;

  List<BarDataClass> barData = [
    BarDataClass(
        id: 0, name: "Python", y: 80, color: Color.fromARGB(255, 29, 109, 239)),
    BarDataClass(
        id: 1,
        name: "JavaScript",
        y: 50,
        color: Color.fromARGB(255, 239, 214, 29)),
    BarDataClass(
        id: 2,
        name: "Flutter",
        y: 90,
        color: Color.fromARGB(255, 29, 200, 239)),
    BarDataClass(
        id: 3,
        name: "Firebase",
        y: 85,
        color: Color.fromARGB(255, 240, 190, 23)),
    BarDataClass(
        id: 4, name: "GCP", y: 70, color: Color.fromARGB(255, 29, 239, 60)),
    BarDataClass(
        id: 5, name: "AWS", y: 65, color: Color.fromARGB(255, 239, 172, 29))
  ];
}
