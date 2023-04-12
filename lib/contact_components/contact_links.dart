import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactLinks extends StatelessWidget {
  const ContactLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        child: CarouselSlider(
            items: links,
            options: CarouselOptions(
                height: 400,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 8),
                autoPlayCurve: Curves.easeInOut,
                autoPlayAnimationDuration: Duration(seconds: 1))));
  }
}

List<Widget> links = [
  GestureDetector(
    onTap: () async {
      final Uri url = Uri.parse('https://www.linkedin.com/in/enzo-furtini/');
      if (await canLaunchUrl(url)) {
        launchUrl(url);
      }
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 19, 58, 232).withAlpha(60),
                blurRadius: 20.0,
                spreadRadius: 0,
                offset: Offset(
                  0.0,
                  0.0,
                ),
              ),
            ]),
            height: 300,
            width: 200,
            child: Image.network(
              "https://storage.googleapis.com/profile-5d517.appspot.com/The_Great_Wave_off_Kanagawa.jpg",
              fit: BoxFit.cover,
            )),
        SizedBox(
          height: 10,
        ),
        FaIcon(
          FontAwesomeIcons.linkedin,
          size: 40,
          color: Colors.white,
        )
      ],
    ),
  ),
  GestureDetector(
    onTap: () async {
      final Uri url = Uri.parse('https://twitter.com/Ka0_sz');
      if (await canLaunchUrl(url)) {
        launchUrl(url);
      }
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 103, 240, 137).withAlpha(60),
                blurRadius: 20.0,
                spreadRadius: 0,
                offset: Offset(
                  0.0,
                  0.0,
                ),
              ),
            ]),
            height: 300,
            width: 200,
            child: Image.network(
              "https://storage.googleapis.com/profile-5d517.appspot.com/ghibli.jpg",
              fit: BoxFit.cover,
            )),
        SizedBox(
          height: 10,
        ),
        FaIcon(
          FontAwesomeIcons.twitter,
          size: 40,
          color: Colors.white,
        )
      ],
    ),
  ),
  GestureDetector(
    onTap: () async {
      final Uri url = Uri.parse('https://github.com/G-itch');
      if (await canLaunchUrl(url)) {
        launchUrl(url);
      }
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 232, 218, 19).withAlpha(60),
                blurRadius: 20.0,
                spreadRadius: 0,
                offset: Offset(
                  0.0,
                  0.0,
                ),
              ),
            ]),
            height: 300,
            width: 200,
            child: Image.network(
              "https://storage.googleapis.com/profile-5d517.appspot.com/flowers.jpg",
              fit: BoxFit.cover,
            )),
        SizedBox(
          height: 10,
        ),
        FaIcon(
          FontAwesomeIcons.github,
          size: 40,
          color: Colors.white,
        )
      ],
    ),
  ),
];
