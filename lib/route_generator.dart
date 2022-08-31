import 'package:flutter/material.dart';
import 'package:newsapp/ui/views/home.dart';
import 'package:newsapp/ui/views/news_details.dart';
import 'package:newsapp/ui/views/page_not_found.dart';

class RouteGenerator {
  static Route<dynamic> routeGenerator(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const HomeView());
      case "/news_details":
        return MaterialPageRoute(builder: (_) => const HomeView());
    }
    return MaterialPageRoute(builder: (_) => const PageNotFound());
  }
}
