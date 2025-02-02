import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_db/routing/routes.dart';
import 'package:movie_db/ui/core/widgets/card_movie_widget.dart';
import 'package:movie_db/ui/top_rated/view_model/top_rated_vm.dart';
import 'package:signals/signals_flutter.dart';

class TopRatedScreen extends StatefulWidget {
  final TopRatedVm _topRatedVm;
  const TopRatedScreen({super.key, required topRatedVm})
      : _topRatedVm = topRatedVm;

  @override
  State<TopRatedScreen> createState() => _TopRatedScreenState();
}

class _TopRatedScreenState extends State<TopRatedScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget._topRatedVm.getTopRatedMovies();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, right: 16, bottom: 0, left: 16),
      child: Column(children: [
        Text(
          'melhores avaliações',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Watch((context) {
          return Expanded(
              child: widget._topRatedVm.getIsLoading
                  ? Center(child: Center(child: CircularProgressIndicator()))
                  : CustomScrollView(
                      slivers: [
                        SliverList.builder(
                          itemCount: widget._topRatedVm.movies.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: CardMovieWidget(
                                imageUrl: widget._topRatedVm.movies[index]
                                    .imagePoster(),
                                title: widget._topRatedVm.movies[index].title,
                                releaseDate: widget
                                    ._topRatedVm.movies[index].releaseDate,
                                onTap: () {
                                  context.push(
                                    Routes.details,
                                    extra: widget._topRatedVm.movies[index].id
                                        .toString(),
                                  );
                                },
                              ),
                            );
                          },
                        )
                      ],
                    ));
        })
      ]),
    );
  }
}
