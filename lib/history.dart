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
  bool autoplay = true;
  bool visible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
              child: SingleChildScrollView(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          AnimatedContainer(
                            width: 350,
                            duration: Duration(seconds: 1),
                            height: 2,
                            color: autoplay ? Colors.white : Colors.transparent,
                            curve: Curves.easeInOut,
                          )
                              .animate()
                              .fadeIn(
                                  duration: const Duration(seconds: 4),
                                  delay: const Duration(seconds: 1))
                              .slideY(duration: const Duration(seconds: 2)),
                          GestureDetector(
                            onTap: () {
                              print("tap");
                              if (autoplay == true) {
                                setState(() {
                                  autoplay = false;
                                });
                              } else {
                                setState(() {
                                  autoplay = true;
                                });
                              }
                            },
                            onHorizontalDragEnd: (details) {
                              print("hori");
                              if (autoplay == true) {
                                setState(() {
                                  autoplay = false;
                                });
                              } else {
                                setState(() {
                                  autoplay = true;
                                });
                              }
                            },
                            onVerticalDragEnd: (details) {
                              print("vert");
                              if (autoplay == true) {
                                setState(() {
                                  autoplay = false;
                                });
                              } else {
                                setState(() {
                                  autoplay = true;
                                });
                              }
                            },
                            child: Container(
                              width: 350,
                              child: AbsorbPointer(
                                child: CarouselSlider(
                                    items: texts
                                        .map(
                                          (e) => Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 350,
                                                child: AutoSizeText(
                                                  e[0],
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.grey,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  textAlign: TextAlign.justify,
                                                ).animate().fadeIn(
                                                    duration: const Duration(
                                                        seconds: 4),
                                                    delay: const Duration(
                                                        seconds: 1,
                                                        milliseconds: 400)),
                                              ),
                                            ],
                                          ),
                                        )
                                        .toList(),
                                    options: CarouselOptions(
                                        onPageChanged: (index, reason) async {
                                          print(index);
                                          if (mounted) {
                                            setState(() {
                                              visible = false;
                                            });
                                          }
                                          await Future.delayed(
                                              Duration(seconds: 2));
                                          if (mounted) {
                                            setState(() {
                                              d3d = index;
                                            });
                                          }
                                          await Future.delayed(
                                              Duration(milliseconds: 500));
                                          if (mounted) {
                                            setState(() {
                                              visible = true;
                                            });
                                          }
                                        },
                                        autoPlayInterval: Duration(seconds: 12),
                                        autoPlayAnimationDuration: Duration(
                                            seconds: 1, milliseconds: 800),
                                        autoPlayCurve: Curves.easeInOut,
                                        scrollDirection: Axis.vertical,
                                        height: 250,
                                        viewportFraction: 1,
                                        autoPlay: autoplay)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ResponsiveRowColumnItem(
                      child: AnimatedOpacity(
                    opacity: visible ? 1 : 0,
                    duration: Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    child: IndexedStack(
                      index: d3d,
                      children: the3d.map((e) {
                        return Container(
                          height: 300,
                          width: 300,
                          child: ModelViewer(
                            autoRotate: true,
                            disableZoom: true,
                            src: e,
                          ),
                        );
                      }).toList(),
                    ).animate().fadeIn(
                        duration: const Duration(seconds: 4),
                        delay: const Duration(seconds: 2, milliseconds: 800)),
                  ))
                ]),
          )),
        ],
      ),
    );
  }
}

List<List<String>> texts = [
  [
    " I've always enjoyed creating, and it was in elementary school that I discovered that my passion was programming, the act of studying, practicing, making mistakes, and reproducing until you're satisfied. Through self-study and constant practice, I honed my programming skills and immersed myself in various languages ​​and technologies. ",
    " With each completed project, I felt a sense of accomplishment and satisfaction, knowing that I created something from scratch and that my code is in action, doing its job. The passion for programming continues to grow with each challenge faced and with each new project I tackle.",
  ],
  [
    " Every time I study or write lines of code, I feel a unique excitement and sense of accomplishment. From basic algorithms to complex systems, every step of the programming process brings me joy and satisfaction. I love taking on challenges, solving problems and discovering creative solutions to turn ideas into reality through the power of programming.",
    " Also, every new method or technique I learn fascinates me and inspires me to keep learning and improving my skills. The ever-evolving nature of programming motivates me to stay up-to-date with the latest trends and technologies.",
  ],
  [
    " With each completed project, I felt a sense of accomplishment and satisfaction, knowing that I created something from scratch and that my code is in action, doing its job. The passion for programming continues to grow with each challenge faced and with each new project I tackle. For sure it's a rewarding experience.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante erat, pharetra in vehicula quis, tincidunt in sem. Phasellus nisi sem, ullamcorper tincidunt fringilla eu, dignissim vitae lacus. Donec fringilla libero ut neque consequat, ac aliquet tortor molestie.",
  ],
  [
    " Also, every new method or technique I learn fascinates me and inspires me to keep learning and improving my skills. The ever-evolving nature of programming motivates me to stay up-to-date with the latest trends and technologies. I value the moments when I can dive into a new project, explore different approaches and test new ideas.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante erat, pharetra in vehicula quis, tincidunt in sem. Phasellus nisi sem, ullamcorper tincidunt fringilla eu, dignissim vitae lacus. Donec fringilla libero ut neque consequat, ac aliquet tortor molestie.",
  ]
];

List<String> the3d = [
  "assets/book.glb",
  "assets/macbl.glb",
  "assets/dreamland.glb",
  "assets/phoneblack.glb",
];
