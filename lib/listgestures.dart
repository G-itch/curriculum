import 'package:curriculum/gesture_skills.dart';
import 'package:flutter/material.dart';

class Listskills {
  List<SkillsContainer> skills(Color colors) {
    List<SkillsContainer> skills = [
      SkillsContainer(
        svg: "flutter.svg",
        color: colors,
      ),
      SkillsContainer(
        svg: "Firebase.svg",
        color: colors,
      ),
      SkillsContainer(
        svg: "Python.svg",
        color: colors,
      ),
      SkillsContainer(
        svg: "AWS.svg",
        color: colors,
      ),
      SkillsContainer(
        svg: "JavaScript.svg",
        color: colors,
      ),
    ];
    return skills;
  }
}
