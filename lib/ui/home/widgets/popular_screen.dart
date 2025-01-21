import 'package:flutter/material.dart';
import 'package:movie_db/ui/core/widgets/card_movie_widget.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

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
      child: Padding(
        padding: const EdgeInsets.only(top: 32, right: 16, bottom: 0, left: 16),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Text(
                'Populares',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SliverList.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return CardMovieWidget(
                    imageUrl: 'assets/images/testeposter.png',
                    title: 'teste',
                    releaseDate: '11/05/1999');
              },
            )
          ],
        ),
      ),
    );
  }
}
