import 'package:flutter/material.dart';
import 'package:newsapp/core/locator.dart';
import 'package:newsapp/route_generator.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: RouteGenerator.routeGenerator,
      debugShowCheckedModeBanner: false,
    );
  }
}
