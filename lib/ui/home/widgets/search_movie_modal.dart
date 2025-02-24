import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_db/data/models/movie_card_model.dart';
import 'package:movie_db/routing/routes.dart';
import 'package:movie_db/ui/core/widgets/card_movie_widget.dart';

class SearchMovieModal extends StatefulWidget {
  final List<MovieCardModel> movies;
  final bool isLoading;
  final Future<void> Function() onComplete;
  final TextEditingController textEditingController;
  const SearchMovieModal({
    super.key,
    required this.onComplete,
    required this.textEditingController,
    required this.movies,
    required this.isLoading,
  });

  @override
  State<SearchMovieModal> createState() => _SearchModalState();
}

class _SearchModalState extends State<SearchMovieModal> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _focusNode.unfocus();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: widget.movies.isNotEmpty
            ? MediaQuery.of(context).size.height
            : MediaQuery.of(context).size.height * .30,
        decoration: const BoxDecoration(
          color: Color(0xFF1c1b1d),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Buscar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  focusNode: _focusNode,
                  controller: widget.textEditingController,
                  onEditingComplete: () async {
                    await widget.onComplete();
                    _focusNode.unfocus();
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF2c2b2e),
                    hintText: 'Digite o nome do filme',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Visibility(
                        visible: widget.movies.isEmpty && !widget.isLoading,
                        child: Center(
                          child: Text(' nenhum resultado encontrado'),
                        ),
                      ),
                    ),
                    widget.isLoading
                        ? SliverToBoxAdapter(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : SliverList.builder(
                            itemCount: widget.movies.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  _focusNode.unfocus();
                                  context.push(Routes.details,
                                      extra:
                                          widget.movies[index].id.toString());
                                },
                                child: CardMovieWidget(
                                    imageUrl:
                                        widget.movies[index].imagePoster(),
                                    title: widget.movies[index].title,
                                    releaseDate:
                                        widget.movies[index].releaseDate),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
