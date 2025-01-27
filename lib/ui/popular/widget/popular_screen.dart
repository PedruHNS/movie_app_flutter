import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_db/routing/routes.dart';

import 'package:movie_db/ui/core/widgets/card_movie_widget.dart';
import 'package:movie_db/ui/popular/view_model/popular_vm.dart';
import 'package:signals/signals_flutter.dart';

class PopularScreen extends StatefulWidget {
  final PopularVm _controller;
  const PopularScreen({super.key, required PopularVm popularVm})
      : _controller = popularVm;

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  @override
  initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget._controller.fetchPopularMovies();
    });
  }

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
            Watch((context) {
              return SliverList.builder(
                itemCount: widget._controller.movies.value.length,
                itemBuilder: (context, index) {
                  return CardMovieWidget(
                    imageUrl:
                        widget._controller.movies.value[index].imagePoster(),
                    title: widget._controller.movies.value[index].title,
                    releaseDate:
                        widget._controller.movies.value[index].releaseDate,
                    onTap: () {
                      context.push(Routes.details,
                          extra: widget._controller.movies.value[index].id
                              .toString());
                    },
                  );
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
