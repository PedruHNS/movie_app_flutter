import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:movie_db/ui/core/widgets/bottom_nav_bar/bottom_nav.dart';
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
                  onSearchTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      useSafeArea: true,
                      builder: (context) {
                        return Watch((context) {
                          return SearchMovieModal(
                            isLoading: widget.controller.isLoading.value,
                            movies: widget.controller.movies,
                            textEditingController: textEditingSearch,
                            onComplete: () async {
                              await widget.controller
                                  .searchMovies(textEditingSearch.text);
                            },
                          );
                        });
                      },
                    ).whenComplete(() {
                      widget.controller.movies.clear();
                      textEditingSearch.clear();
                    });
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
