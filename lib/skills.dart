import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curriculum/gesture_skills.dart';
import 'package:curriculum/listgestures.dart';
import 'package:curriculum/skill_%20indicators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:transparent_image/transparent_image.dart';

import 'radar_chart/radar_chart.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({super.key});

  @override
  State<SkillPage> createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage> {
  int indexskill = 0;
  int? lastindex;
  Color skillscolor = Colors.white;
  String stack = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://storage.googleapis.com/profile-5d517.appspot.com/stars.png",
              )),
          gradient: LinearGradient(
              begin: Alignment(-5.5, -5.5),
              end: Alignment(6.5, 6.5),
              colors: [
                Color.fromARGB(255, 11, 24, 61),
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 194, 118, 31)
              ])),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        Align(
            alignment: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                ? const Alignment(1.9, 0.8)
                : const Alignment(1.2, 0.9),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image:
                  "https://storage.googleapis.com/profile-5d517.appspot.com/yellow.png",
              fadeInDuration: const Duration(milliseconds: 2000),
              height: 250,
              width: 250,
            ).animate().fadeIn(
                duration: const Duration(seconds: 3),
                delay: const Duration(seconds: 2, milliseconds: 500))),
        Align(
          alignment: Alignment(0, -.1),
          child: Image.network(
            "https://storage.googleapis.com/profile-5d517.appspot.com/chair.gif",
            height: 300,
            width: 190,
          ).animate().fadeIn(
              duration: const Duration(seconds: 3),
              delay: const Duration(seconds: 1, milliseconds: 700)),
        ),
        Center(
          child: SingleChildScrollView(
            child: ResponsiveRowColumn(
                columnVerticalDirection: VerticalDirection.up,
                rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
                columnCrossAxisAlignment: CrossAxisAlignment.center,
                columnMainAxisAlignment: MainAxisAlignment.center,
                layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                children: [
                  ResponsiveRowColumnItem(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Container(
                                height: 200,
                                width: 300,
                                child: SkillsRadar(
                                  radarcolor: skillscolor,
                                  indexskill: indexskill,
                                  stack: stack,
                                )
                                //
                                )),
                        // .animate(
                        //   onPlay: (controller) => controller.repeat(),
                        // )
                        // .shimmer(duration: Duration(seconds: 3))
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 20,
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: Listskills().skills(skillscolor).length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  if (indexskill != index + 1) {
                                    setState(() {
                                      skillscolor = colors[index];
                                      indexskill = index + 1;
                                      stack = stacks[index];
                                      lastindex = indexskill;
                                    });
                                  }
                                },
                                child: Container(
                                    height: 50,
                                    width: 50,
                                    child: Listskills()
                                        .skills(skillscolor)[index]),
                              );
                            },
                          ),
                        )
                      ],
                    ).animate().fadeIn(
                        duration: const Duration(seconds: 3),
                        delay: const Duration(seconds: 2, milliseconds: 500)),
                  ),
                  const ResponsiveRowColumnItem(
                      child: SizedBox(
                    height: 16,
                  )),
                  ResponsiveRowColumnItem(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          "Passion for learning",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )
                            .animate()
                            .fadeIn(
                                duration: const Duration(seconds: 2),
                                delay: const Duration(seconds: 1))
                            .slideY(
                                begin: 0.5,
                                duration: const Duration(milliseconds: 500)),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: 350,
                          child: AutoSizeText(
                            " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante erat, pharetra in vehicula quis, tincidunt in sem. Phasellus nisi sem, ullamcorper tincidunt fringilla eu, dignissim vitae lacus. Donec fringilla libero ut neque consequat, ac aliquet tortor molestie.",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: ResponsiveWrapper.of(context)
                                        .isSmallerThan(DESKTOP)
                                    ? 18
                                    : 16,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.justify,
                          ).animate().fadeIn(
                              duration: const Duration(seconds: 3),
                              delay: const Duration(
                                  seconds: 1, milliseconds: 400)),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: 350,
                          child: AutoSizeText(
                            " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante erat, pharetra in vehicula quis, tincidunt in sem. Phasellus nisi sem, ullamcorper tincidunt fringilla eu, dignissim vitae lacus. Donec fringilla libero ut neque consequat, ac aliquet tortor molestie.",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: ResponsiveWrapper.of(context)
                                        .isSmallerThan(DESKTOP)
                                    ? 18
                                    : 16,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.justify,
                          ).animate().fadeIn(
                              duration: const Duration(seconds: 3),
                              delay: const Duration(
                                  seconds: 1, milliseconds: 800)),
                        ),
                        // Container(
                        //   height: 400,
                        //   width: 400,
                        //   child: ModelViewer(
                        //     autoRotate: true,
                        //     ar: true,
                        //     disableZoom: true,
                        //     src: "assets/macbl.glb",
                        //   ),
                        // ).animate().fadeIn(
                        //     duration: const Duration(seconds: 7),
                        //     delay:
                        //         const Duration(seconds: 2, milliseconds: 200))
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ]),
    );
  }
}

List<Color> colors = [
  Color.fromARGB(255, 33, 72, 243),
  Color.fromARGB(255, 54, 243, 33),
  Color.fromARGB(255, 229, 243, 33),
  Color.fromARGB(255, 243, 33, 33),
  Color.fromARGB(255, 121, 33, 243),
];

List<String> stacks = ["Flutter", "Firebase", "Python", "AWS", "Javascript"];
