import 'package:flutter/material.dart';
import 'package:truysuatnhankhau/main.dart';

class AppRoutes {
  static const String splash = "/";
  static dynamic generateRoute() => {
        AppRoutes.splash: (context) => const MyHomePage(),
      };
  static Route? onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name!.split('/');

    if (pathElements[0] != '' || pathElements.length == 1) return null;
    switch (pathElements[1]) {
      default:
        return null;
    }
  }
}
