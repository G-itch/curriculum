import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import 'package:responsive_framework/responsive_wrapper.dart';
import 'dart:math' as math;
import 'package:ditredi/ditredi.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

class SpaceScreen extends StatelessWidget {
  const SpaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool already = false;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(6, -6),
              end: Alignment(-5, 5),
              colors: [
            Color.fromARGB(255, 202, 19, 19),
            Color.fromARGB(255, 0, 0, 0),
            Color.fromARGB(255, 11, 24, 61)
          ])),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(-.6, -1.3),
            child: Image.network(
              "https://storage.googleapis.com/profile-5d517.appspot.com/moon.png",
              height: 160,
              width: 160,
            ).animate().fadeIn(
                duration: const Duration(seconds: 3),
                delay: const Duration(seconds: 1)),
          ),
          // Align(
          //   alignment: const Alignment(0.5, -.3),
          //   child: Container(
          //     height: 300,
          //     width: 300,
          //     child: ModelViewer(
          //       ar: true,
          //       autoRotate: true,
          //       disableZoom: true,
          //       src: "assets/phone12.glb",
          //     ),
          //   ),
          // ),
          Align(
            alignment: const Alignment(1.3, -1.3),
            child: Image.network(
              "https://storage.googleapis.com/profile-5d517.appspot.com/red%20planet.png",
              height: 300,
              width: 300,
            ).animate().fadeIn(
                duration: const Duration(seconds: 3),
                delay: const Duration(seconds: 3, milliseconds: 500)),
          ),
          Align(
            alignment: const Alignment(-1.3, 1),
            child: Image.network(
              "https://storage.googleapis.com/profile-5d517.appspot.com/blue%20planet.png",
              height: 250,
              width: 250,
            ).animate().fadeIn(
                duration: const Duration(seconds: 3),
                delay: const Duration(milliseconds: 500)),
          ),
          Stack(
            children: [
              Align(
                  alignment: const Alignment(-1, -1),
                  child: Image.network(
                    "https://storage.googleapis.com/profile-5d517.appspot.com/pnglap.png%20-%20Timeline%201%20(1).gif",
                    height: 325,
                    width: 325,
                  ).animate().fadeIn(
                      duration: const Duration(seconds: 3),
                      delay: const Duration(seconds: 1, milliseconds: 800))),
              Align(
                alignment: const Alignment(.6, .6),
                child: Transform.rotate(
                  angle: -math.pi / 8,
                  child: Image.network(
                    "https://storage.googleapis.com/profile-5d517.appspot.com/astronaut.gif",
                    height: 250,
                    width: 250,
                  ).animate().fadeIn(
                      duration: const Duration(seconds: 2),
                      delay: const Duration(seconds: 3)),
                ),
              ),
              Align(
                alignment: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                    ? const Alignment(0, -.2)
                    : const Alignment(-0.6, -.2),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: AutoSizeText(
                            "About me and my work",
                            textAlign: TextAlign.center,
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
                              duration: const Duration(seconds: 2),
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
                                duration: const Duration(seconds: 2),
                                delay: const Duration(
                                    seconds: 1, milliseconds: 800)))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
