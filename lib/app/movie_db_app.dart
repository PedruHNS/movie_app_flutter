import 'package:flutter/material.dart';
import 'package:movie_db/routing/router.dart';
import 'package:movie_db/ui/core/themes/theme_app.dart';

class MovieDBApp extends StatelessWidget {
  const MovieDBApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeApp.themeData,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
