import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                                  height: 200,
                                  width: 400,
                                  child: const SkillsRadar())
                              .animate()
                              .fadeIn(
                                  duration: const Duration(seconds: 3),
                                  delay: const Duration(
                                      seconds: 2, milliseconds: 500)),
                        )
                        // SvgPicture.asset(
                        //   "flutter-svgrepo-com.svg",
                        //   width: 140,
                        //   height: 140,
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(30),
                        //   child: Container(
                        //     width: 250,
                        //     height: 8,
                        //     child: LinearProgressIndicator(
                        //       value: 0.8,
                        //       backgroundColor:
                        //           Color.fromARGB(79, 255, 255, 255),
                        //       color: Color.fromARGB(255, 65, 209, 253),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
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
