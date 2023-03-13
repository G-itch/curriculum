import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:timelines/timelines.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int d3d = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(6.5, -6.5),
              end: Alignment(-5.5, 5.5),
              colors: [
            Color.fromARGB(255, 194, 118, 31),
            Color.fromARGB(255, 0, 0, 0),
            Color.fromARGB(255, 61, 11, 55),
          ])),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Center(
            child: ResponsiveRowColumn(
                rowCrossAxisAlignment: CrossAxisAlignment.center,
                rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
                columnCrossAxisAlignment: CrossAxisAlignment.center,
                columnMainAxisAlignment: MainAxisAlignment.center,
                layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                children: [
                  ResponsiveRowColumnItem(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          AutoSizeText(
                            "The journey",
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
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            width: 400,
                            child: CarouselSlider(
                                items: texts,
                                options: CarouselOptions(
                                    autoPlayInterval: Duration(seconds: 8),
                                    autoPlayAnimationDuration:
                                        Duration(seconds: 1, milliseconds: 800),
                                    autoPlayCurve: Curves.easeInOut,
                                    scrollDirection: Axis.vertical,
                                    height: 400,
                                    viewportFraction: 1,
                                    autoPlay: true)),
                          ),
                        ],
                      )
                          // Column(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: [
                          //     AutoSizeText(
                          //       "The journey",
                          //       textAlign: TextAlign.center,
                          //       style: GoogleFonts.montserrat(
                          //           color: Colors.white,
                          //           fontSize: 30,
                          //           fontWeight: FontWeight.bold),
                          //     )
                          //         .animate()
                          //         .fadeIn(
                          //             duration: const Duration(seconds: 2),
                          //             delay: const Duration(seconds: 1))
                          //         .slideY(
                          //             begin: 0.5,
                          //             duration:
                          //                 const Duration(milliseconds: 500)),
                          //     const SizedBox(
                          //       height: 8,
                          //     ),
                          //     Container(
                          //       width: 200,
                          //       height: 100,
                          //       child: Timeline.tileBuilder(
                          //         builder: TimelineTileBuilder.fromStyle(
                          //           contentsAlign: ContentsAlign.alternating,
                          //           contentsBuilder: (context, index) => Padding(
                          //             padding: const EdgeInsets.all(24.0),
                          //             child: Text('Timeline Event $index'),
                          //           ),
                          //           itemCount: 10,
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       width: 350,
                          //       child: AutoSizeText(
                          //         " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante erat, pharetra in vehicula quis, tincidunt in sem. Phasellus nisi sem, ullamcorper tincidunt fringilla eu, dignissim vitae lacus. Donec fringilla libero ut neque consequat, ac aliquet tortor molestie.",
                          //         style: GoogleFonts.poppins(
                          //             color: Colors.grey,
                          //             fontSize: ResponsiveWrapper.of(context)
                          //                     .isSmallerThan(DESKTOP)
                          //                 ? 18
                          //                 : 16,
                          //             fontWeight: FontWeight.w600),
                          //         textAlign: TextAlign.justify,
                          //       ).animate().fadeIn(
                          //           duration: const Duration(seconds: 2),
                          //           delay: const Duration(
                          //               seconds: 1, milliseconds: 400)),
                          //     ),
                          //     const SizedBox(
                          //       height: 8,
                          //     ),
                          //     Container(
                          //         width: 350,
                          //         child: AutoSizeText(
                          //           " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante erat, pharetra in vehicula quis, tincidunt in sem. Phasellus nisi sem, ullamcorper tincidunt fringilla eu, dignissim vitae lacus. Donec fringilla libero ut neque consequat, ac aliquet tortor molestie.",
                          //           style: GoogleFonts.poppins(
                          //               color: Colors.grey,
                          //               fontSize: ResponsiveWrapper.of(context)
                          //                       .isSmallerThan(DESKTOP)
                          //                   ? 18
                          //                   : 16,
                          //               fontWeight: FontWeight.w600),
                          //           textAlign: TextAlign.justify,
                          //         ).animate().fadeIn(
                          //             duration: const Duration(seconds: 2),
                          //             delay: const Duration(
                          //                 seconds: 1, milliseconds: 800)))
                          //   ],
                          // ),
                          ),
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: Container(
                      height: 300,
                      width: 340,
                      child: ModelViewer(
                        autoRotate: true,
                        ar: true,
                        disableZoom: true,
                        src: the3d[d3d],
                      ),
                    ).animate().fadeIn(
                        duration: const Duration(seconds: 7),
                        delay: const Duration(seconds: 2, milliseconds: 200)),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}

List<Widget> texts = [
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 350,
        child: AutoSizeText(
          " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante erat, pharetra in vehicula quis, tincidunt in sem. Phasellus nisi sem, ullamcorper tincidunt fringilla eu, dignissim vitae lacus. Donec fringilla libero ut neque consequat, ac aliquet tortor molestie.",
          style: GoogleFonts.poppins(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
          textAlign: TextAlign.justify,
        ).animate().fadeIn(
            duration: const Duration(seconds: 2),
            delay: const Duration(seconds: 1, milliseconds: 400)),
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
          width: 350,
          child: AutoSizeText(
            " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante erat, pharetra in vehicula quis, tincidunt in sem. Phasellus nisi sem, ullamcorper tincidunt fringilla eu, dignissim vitae lacus. Donec fringilla libero ut neque consequat, ac aliquet tortor molestie.",
            style: GoogleFonts.poppins(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
            textAlign: TextAlign.justify,
          ).animate().fadeIn(
              duration: const Duration(seconds: 2),
              delay: const Duration(seconds: 1, milliseconds: 800))),
    ],
  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 350,
        child: AutoSizeText(
          " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante erat, pharetra in vehicula quis, tincidunt in sem. Phasellus nisi sem, ullamcorper tincidunt fringilla eu, dignissim vitae lacus. Donec fringilla libero ut neque consequat, ac aliquet tortor molestie.",
          style: GoogleFonts.poppins(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
          textAlign: TextAlign.justify,
        ).animate().fadeIn(
            duration: const Duration(seconds: 2),
            delay: const Duration(seconds: 1, milliseconds: 400)),
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
          width: 350,
          child: AutoSizeText(
            " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante erat, pharetra in vehicula quis, tincidunt in sem. Phasellus nisi sem, ullamcorper tincidunt fringilla eu, dignissim vitae lacus. Donec fringilla libero ut neque consequat, ac aliquet tortor molestie.",
            style: GoogleFonts.poppins(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
            textAlign: TextAlign.justify,
          ).animate().fadeIn(
              duration: const Duration(seconds: 2),
              delay: const Duration(seconds: 1, milliseconds: 800))),
    ],
  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 350,
        child: AutoSizeText(
          " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante erat, pharetra in vehicula quis, tincidunt in sem. Phasellus nisi sem, ullamcorper tincidunt fringilla eu, dignissim vitae lacus. Donec fringilla libero ut neque consequat, ac aliquet tortor molestie.",
          style: GoogleFonts.poppins(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
          textAlign: TextAlign.justify,
        ).animate().fadeIn(
            duration: const Duration(seconds: 2),
            delay: const Duration(seconds: 1, milliseconds: 400)),
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
          width: 350,
          child: AutoSizeText(
            " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante erat, pharetra in vehicula quis, tincidunt in sem. Phasellus nisi sem, ullamcorper tincidunt fringilla eu, dignissim vitae lacus. Donec fringilla libero ut neque consequat, ac aliquet tortor molestie.",
            style: GoogleFonts.poppins(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
            textAlign: TextAlign.justify,
          ).animate().fadeIn(
              duration: const Duration(seconds: 2),
              delay: const Duration(seconds: 1, milliseconds: 800))),
    ],
  ),
];
List<String> the3d = ["assets/phoneblack.glb", "assets/macbl.glb"];
