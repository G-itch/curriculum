import 'dart:async';

import 'package:curriculum/history.dart';
import 'package:curriculum/skills.dart';
import 'package:curriculum/space.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  // Animate.restartOnHotReload = true;
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
}

bool _time = true;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scrollBehavior: MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        debugShowCheckedModeBanner: false,
        builder: (context, child) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, child!),
            maxWidth: 1200,
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(480, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(1700, name: "XL"),
            ],
            background: Container(color: const Color(0xFFF5F5F5))),
        initialRoute: "/",
        theme: ThemeData(textTheme: TextTheme(), primaryColor: Colors.black
            // primarySwatch: Colors.p,
            ),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  bool scroll = true;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _pageController.animateTo(_pageController.offset,
    //     duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Listener(
        onPointerSignal: (event) {
          if (scroll) {
            setState(() {
              scroll = false;
            });
            Timer(Duration(seconds: 3), () {
              setState(() {
                scroll = true;
              });
            });
            if (event is PointerScrollEvent) {
              if (event.scrollDelta.dy >= 0) {
                _pageController.nextPage(
                    duration: const Duration(milliseconds: 1200),
                    curve: Curves.easeInOut);
              } else {
                _pageController.previousPage(
                    duration: const Duration(milliseconds: 1200),
                    curve: Curves.easeInOut);
              }
            }
          }
        },
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          // // scrollBehavior: MaterialScrollBehavior().copyWith(
          // //   dragDevices: {
          // //     PointerDeviceKind.mouse,
          // //     PointerDeviceKind.touch,
          // //     PointerDeviceKind.stylus,
          // //     PointerDeviceKind.unknown
          // //   },
          // // ),
          scrollDirection: Axis.vertical,
          // pageSnapping: false,
          children: [
            Center(child: SpaceScreen()),
            Center(child: SkillPage()),
            Center(
              child: HistoryScreen(),
            )
          ],
        ),
      ),
    );
  }
}
