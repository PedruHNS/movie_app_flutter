import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:movie_db/data/models/movie_card_model.dart';
import 'package:movie_db/ui/core/widgets/bottom_nav_bar/bottom_nav.dart';
import 'package:movie_db/ui/core/widgets/card_movie_widget.dart';
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
          return Stack(
            children: [
              widget
                  .controller.page[widget.controller.selectedScreenIndex.value],
              BottomNav(
                  onSearchTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Watch((context) {
                          return SearchModal(
                            isLoading: widget.controller.isLoading.value,
                            movies: widget.controller.movies,
                            textEditingController: textEditingSearch,
                            onComplete: () async {
                              widget.controller.movies.clear();
                              await widget.controller
                                  .searchMovies(textEditingSearch.text);
                              textEditingSearch.clear();
                            },
                          );
                        });
                      },
                    );
                  },
                  itemSelected: widget.controller.selectedScreenIndex.value,
                  items: [
                    MenuItem(icon: MdiIcons.movie),
                    MenuItem(icon: MdiIcons.movieRoll),
                    MenuItem(icon: MdiIcons.videoVintage),
                    MenuItem(icon: MdiIcons.heart),
                  ],
                  onItemTap: widget.controller.onTapScreen)
            ],
          );
        }),
      ),
    );
  }
}

class SearchModal extends StatefulWidget {
  final List<MovieCardModel> movies;
  final bool isLoading;
  final Future<void> Function() onComplete;
  final TextEditingController textEditingController;
  const SearchModal({
    super.key,
    required this.onComplete,
    required this.textEditingController,
    required this.movies,
    required this.isLoading,
  });

  @override
  State<SearchModal> createState() => _SearchModalState();
}

class _SearchModalState extends State<SearchModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .9,
      decoration: const BoxDecoration(
        color: Color(0xFF1c1b1d),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
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
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  controller: widget.textEditingController,
                  onEditingComplete: () async {
                    await widget.onComplete();
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF2c2b2e),
                    hintText: 'Digite o nome do filme',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Visibility(
                    visible: widget.movies.isEmpty && !widget.isLoading,
                    child:
                        Center(child: Text(' nenhum resultado encontrado')))),
            widget.isLoading
                ? SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()))
                : SliverList.builder(
                    itemCount: widget.movies.length,
                    itemBuilder: (context, index) {
                      return CardMovieWidget(
                          imageUrl: widget.movies[index].imagePoster(),
                          title: widget.movies[index].title,
                          releaseDate: widget.movies[index].releaseDate);
                    }),
          ],
        ),
      ),
    );
  }
}
