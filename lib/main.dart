import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/weather_home.dart';
import 'screens/weather_search_add.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/weather_home',
  routes: [
    GoRoute(
      path: '/weather_home',
      builder: (context, state) => const WeatherHome(),
    ),
    GoRoute(
      path: '/weather_search_add',
      builder: (context, state) => const WeatherSearchAdd(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
