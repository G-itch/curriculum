import 'package:auto_size_text/auto_size_text.dart';
import 'package:curriculum/contact_components/contact_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreen();
}

class _ContactScreen extends State<ContactScreen> {
  bool load = false;
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment(-5.5, 5.5),
            end: Alignment(6.5, -6.5),
            colors: [
              Color.fromARGB(255, 61, 11, 55),
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 0, 0, 0),
            ]),
        image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://storage.googleapis.com/profile-5d517.appspot.com/stars.png",
            )),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: SingleChildScrollView(
          child: ResponsiveRowColumn(
              columnVerticalDirection: VerticalDirection.up,
              rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
              rowCrossAxisAlignment: CrossAxisAlignment.center,
              columnCrossAxisAlignment: CrossAxisAlignment.center,
              columnMainAxisAlignment: MainAxisAlignment.center,
              layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              children: [
                ResponsiveRowColumnItem(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ContactLinks().animate().fadeIn(
                      duration: const Duration(seconds: 2),
                      delay: const Duration(seconds: 2, milliseconds: 400)),
                )),
                ResponsiveRowColumnItem(
                  child: SizedBox(height: 30, width: 20),
                ),
                ResponsiveRowColumnItem(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        "Contact me",
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
                          "I am always open to new challenges and opportunities to collaborate on interesting projects. I have an open mind and am willing to face complex challenges, looking for innovative and efficient solutions. If anyone has questions or wants to discuss ideas, I'm always available to chat and share knowledge. I believe that programming is an area that greatly benefits from collaboration and idea sharing, and I look forward to contributing as best I can to any project I may be involved in.",
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
                            delay:
                                const Duration(seconds: 1, milliseconds: 400)),
                      ),
                      // const SizedBox(
                      //   height: 8,
                      // ),
                      // Container(
                      //   width: 350,
                      //   child: AutoSizeText(
                      //     " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante erat, pharetra in vehicula quis, tincidunt in sem. Phasellus nisi sem, ullamcorper tincidunt fringilla eu, dignissim vitae lacus. Donec fringilla libero ut neque consequat, ac aliquet tortor molestie.",
                      //     style: GoogleFonts.poppins(
                      //         color: Colors.grey,
                      //         fontSize: ResponsiveWrapper.of(context)
                      //                 .isSmallerThan(DESKTOP)
                      //             ? 18
                      //             : 16,
                      //         fontWeight: FontWeight.w600),
                      //     textAlign: TextAlign.justify,
                      //   ).animate().fadeIn(
                      //       duration: const Duration(seconds: 3),
                      //       delay:
                      //           const Duration(seconds: 1, milliseconds: 800)),
                      // ),
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
    );
  }
}
