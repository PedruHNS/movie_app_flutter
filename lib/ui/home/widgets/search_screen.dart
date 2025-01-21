import 'package:flutter/material.dart';
import 'package:movie_db/ui/core/widgets/input_custom.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
      child: Center(child: InputCustom()),
    );
  }
}
