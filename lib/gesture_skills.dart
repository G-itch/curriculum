import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SkillsContainer extends StatelessWidget {
  const SkillsContainer({required this.svg, required this.color, super.key});
  final String svg;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        '${svg}',
        color: color,
      ),
    );
  }
}
