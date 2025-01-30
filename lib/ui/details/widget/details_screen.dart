import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/data/models/movie_detail_model.dart';
import 'package:movie_db/utils/formatter_string.dart';
import 'package:signals/signals_flutter.dart';

import 'package:movie_db/ui/details/view_model/details_vm.dart';

class DetailsScreen extends StatefulWidget {
  final String id;
  final DetailsVm _controller;

  const DetailsScreen(
      {super.key, required this.id, required DetailsVm controller})
      : _controller = controller;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget._controller.getMovieById(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Watch((context) {
          return widget._controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Watch((context) {
                  return widget._controller.movie != null
                      ? CustomScrollView(
                          slivers: [
                            SliverAppBar(
                              backgroundColor: Colors.transparent,
                            ),
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.all(18),
                                child: CardMovieDetail(
                                  rating: widget._controller.movie!.voteAverage,
                                  title: widget._controller.movie!.title,
                                  duration: Formatter.formatIntToHour(
                                      widget._controller.movie!.runtime),
                                  date: Formatter.formatDate(
                                      widget._controller.movie!.releaseDate),
                                  urlBackDrop:
                                      widget._controller.movie!.backdropPath,
                                  urlPoster:
                                      widget._controller.movie!.posterPath,
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Wrap(
                                children: List.generate(
                                    widget._controller.movie!.genres.length,
                                    (index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Chip(
                                      label: Text(widget._controller.movie!
                                          .genres[index].name),
                                    ),
                                  );
                                }),
                              ),
                            ),
                            SliverToBoxAdapter(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 10, bottom: 0),
                              child: Column(
                                children: [
                                  Text('Sinopse',
                                      style: const TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                      widget._controller.movie!.overview != ""
                                          ? widget._controller.movie!.overview
                                          : "Sem descrição",
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(fontSize: 16)),
                                ],
                              ),
                            )),
                          ],
                        )
                      : Center(
                          child: Text(widget._controller.message.value,
                              style: const TextStyle(fontSize: 18)));
                });
        }),
      ),
    );
  }
}

class CardMovieDetail extends StatelessWidget {
  final String urlBackDrop;
  final String title;
  final String date;
  final String urlPoster;
  final double rating;
  final String duration;
  const CardMovieDetail({
    super.key,
    required this.urlBackDrop,
    required this.urlPoster,
    required this.title,
    required this.duration,
    required this.date,
    required this.rating,
  });
  Color get _getColorRating {
    if (rating > 7) {
      return Colors.green;
    }
    if (rating > 5) {
      return Colors.orange;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Blur(
            borderRadius: BorderRadius.circular(10),
            blur: 2,
            blurColor: Colors.black,
            child: SizedBox(
                height: 400,
                child: Image.network(urlBackDrop, fit: BoxFit.cover))),
        Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(urlPoster),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 4),
                child: Text(
                  'Duração: $duration',
                  style: const TextStyle(fontSize: 17),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: Text(
                  'Lançamento: $date',
                  style: const TextStyle(fontSize: 17),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: _getColorRating,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                )
              ],
            ),
            child: Center(child: Text(rating.toStringAsFixed(1))),
          ),
        )
      ],
    );
  }
}
