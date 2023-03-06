import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SkillIndicators extends StatelessWidget {
  const SkillIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: params.map((i) {
          return Builder(builder: (BuildContext context) {
            return Indicator(asset: i[0], color: i[1], exp: i[2]);
          });
        }).toList(),
        options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 1,
          autoPlayCurve: Curves.easeInOut,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          autoPlayAnimationDuration: const Duration(milliseconds: 1600),
          // clipBehavior: Clip.antiAlias
        ));
  }
}

class Indicator extends StatelessWidget {
  const Indicator(
      {required this.asset, required this.color, required this.exp, super.key});
  final String asset;
  final Color color;
  final double exp;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          asset,
          width: 140,
          height: 140,
        ),
        const SizedBox(
          height: 20,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Container(
            width: 250,
            height: 8,
            child: LinearProgressIndicator(
              value: exp,
              backgroundColor: const Color.fromARGB(79, 255, 255, 255),
              color: color,
            ),
          ),
        )
      ],
    );
  }
}

List params = [
  ["flutter-svgrepo-com.svg", const Color.fromARGB(255, 65, 209, 253), 0.9],
  ["firebase-svgrepo-com.svg", const Color.fromARGB(255, 252, 202, 63), 0.8],
  [
    "google-cloud-svgrepo-com.svg",
    const Color.fromARGB(255, 52, 168, 83),
    0.65
  ],
  ["python.svg", Color.fromARGB(255, 32, 110, 135), 0.7],
  ["Amazon_Web_Services_Logo.svg", Color.fromARGB(255, 240, 134, 21), 0.5]
];
