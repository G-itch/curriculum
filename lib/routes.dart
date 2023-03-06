import 'package:curriculum/skills.dart';
import 'package:curriculum/space.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => SpaceScreen(),
  ),
  GoRoute(
    path: "skills",
    builder: (context, state) => SkillPage(),
  )
]);
