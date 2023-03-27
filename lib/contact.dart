import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:video_player/video_player.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreen();
}

class _ContactScreen extends State<ContactScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("sea.mp4")
      ..initialize().then((value) {
        _controller.addListener(() {
          if (_controller.value.position == _controller.value.duration) {
            _controller.seekTo(Duration.zero);
            _controller.play();
          }
          setState(() {
            _controller.play();
          });
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
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
          color: Colors.black,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 19, 58, 232).withAlpha(60),
                      blurRadius: 120.0,
                      spreadRadius: 0,
                      offset: Offset(
                        0.0,
                        0.0,
                      ),
                    ),
                  ]),
                  height: 300,
                  width: 200,
                  child: FittedBox(
                    clipBehavior: Clip.hardEdge,
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                ),
              ),
              ResponsiveRowColumnItem(
                child: SizedBox(height: 30, width: 20),
              ),
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
                            color: Colors.grey,
                            fontSize: ResponsiveWrapper.of(context)
                                    .isSmallerThan(DESKTOP)
                                ? 18
                                : 16,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.justify,
                      ).animate().fadeIn(
                          duration: const Duration(seconds: 3),
                          delay: const Duration(seconds: 1, milliseconds: 800)),
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
            ]));
  }
}
