import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_db/routing/routes.dart';
import 'package:movie_db/ui/core/widgets/card_movie_widget.dart';
import 'package:movie_db/ui/trending/view_model/trending_vm.dart';
import 'package:signals/signals_flutter.dart';

class TrendingScreen extends StatefulWidget {
  final TrendingVm trendingVm;
  const TrendingScreen({super.key, required this.trendingVm});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.trendingVm.getMoviesTrending();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, right: 16, bottom: 0, left: 16),
      child: Column(
        children: [
          Text(
            'TENDÊNCIAS DA SEMANA',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Watch((context) {
            return Expanded(
                child: widget.trendingVm.getIsLoading
                    ? Center(child: CircularProgressIndicator())
                    : CustomScrollView(
                        slivers: [
                          SliverList.builder(
                            itemCount: widget.trendingVm.movies.length,
                            itemBuilder: (context, index) {
                              return CardMovieWidget(
                                imageUrl: widget.trendingVm.movies[index]
                                    .imagePoster(),
                                title: widget.trendingVm.movies[index].title,
                                releaseDate:
                                    widget.trendingVm.movies[index].releaseDate,
                                onTap: () {
                                  context.push(Routes.details,
                                      extra: widget.trendingVm.movies[index].id
                                          .toString());
                                },
                              );
                            },
                          )
                        ],
                      ));
          })
        ],
      ),
    );
  }
}
