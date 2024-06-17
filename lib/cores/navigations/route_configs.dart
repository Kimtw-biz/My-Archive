import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../modules/a_home/home_page.dart';

sealed class RouteConfigs {
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shallNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter configs = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: "/",
    routes: [
      ShellRoute(
        navigatorKey: _shallNavigatorKey,
        builder: (context, state, child) => child,
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomePage(),
          ),
        ],
      ),
    ],
  );
}
