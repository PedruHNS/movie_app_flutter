import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_db/routing/routes.dart';
import 'package:movie_db/ui/core/widgets/bottom_nav_bar/bottom_nav.dart';
import 'package:movie_db/ui/core/widgets/card_movie_widget.dart';
import 'package:movie_db/ui/home/widgets/search_movie_modal.dart';
import 'package:movie_db/ui/home/view_model/home_vm.dart';
import 'package:signals/signals_flutter.dart';

class HomeScreen extends StatefulWidget {
  final HomeVm controller;
  const HomeScreen({super.key, required this.controller});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textEditingSearch = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget.controller.fetchPopularMovies();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            return Stack(
              children: [
                Ink(
                  child: Column(
                    children: [
                      Text(widget.controller.getTitlePage,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )),
                      Expanded(
                          child: widget.controller.getIsLoading
                              ? Center(child: CircularProgressIndicator())
                              : CustomScrollView(slivers: [
                                  SliverList.builder(
                                    itemCount:
                                        widget.controller.moviesList.length,
                                    itemBuilder: (context, index) {
                                      return CardMovieWidget(
                                          imageUrl: widget
                                              .controller.moviesList[index]
                                              .imagePoster(),
                                          title: widget.controller
                                              .moviesList[index].title,
                                          releaseDate: widget.controller
                                              .moviesList[index].releaseDate,
                                          onTap: () {
                                            context.push(Routes.details,
                                                extra: widget.controller
                                                    .moviesList[index].id
                                                    .toString());
                                          });
                                    },
                                  ),
                                ])),
                    ],
                  ),
                ),
                BottomNav(
                  controller: widget.controller,
                  onSearchTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      useSafeArea: true,
                      builder: (context) {
                        return Watch((context) {
                          return SearchMovieModal(
                            isLoading: widget.controller.isLoading.value,
                            movies: widget.controller.moviesSearch,
                            textEditingController: textEditingSearch,
                            onComplete: () async {
                              await widget.controller
                                  .searchMovies(textEditingSearch.text);
                            },
                          );
                        });
                      },
                    ).whenComplete(() {
                      widget.controller.moviesSearch.clear();
                      textEditingSearch.clear();
                    });
                  },
                  itemSelected: widget.controller.selectedScreenIndex.value,
                  onItemTap: widget.controller.onTapScreen,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
