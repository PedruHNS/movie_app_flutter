import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_db/routing/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                context.pushReplacement(Routes.getStarted);
              },
              child: const Text('Splash Screen')),
        ),
      ),
    );
  }
}
