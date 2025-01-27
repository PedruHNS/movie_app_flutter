import 'package:flutter/material.dart';

class ReleaseScreen extends StatelessWidget {
  const ReleaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 0, 0, 0),
            Color(0xFF7100cd),
          ],
        ),
      ),
    );
  }
}
