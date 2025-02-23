import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:movie_db/ui/home/view_model/home_vm.dart';

class BottomNav extends StatelessWidget {
  final int itemSelected;
  final void Function(int) onItemTap;
  final void Function() onSearchTap;
  final HomeVm controller;

  const BottomNav({
    super.key,
    required this.itemSelected,
    required this.onItemTap,
    required this.onSearchTap,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 7,
                  spreadRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: controller.fetchPopularMovies,
                    icon: Icon(
                      MdiIcons.movie,
                      color: controller.getTitlePage == 'POPULARES'
                          ? Color(0xFF7100cd)
                          : Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  IconButton(
                    onPressed: controller.fetchTopRatedMovies,
                    icon: Icon(
                      MdiIcons.movieRoll,
                      color: controller.getTitlePage == 'MELHORES AVALIADOS'
                          ? Color(0xFF7100cd)
                          : Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  IconButton(
                    onPressed: onSearchTap,
                    icon: Icon(MdiIcons.movieSearch,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  IconButton(
                    onPressed: controller.fetchTrendingMovies,
                    icon: Icon(MdiIcons.videoVintage,
                        color: controller.getTitlePage == 'TENDÊNCIAS'
                            ? Color(0xFF7100cd)
                            : Color.fromARGB(255, 0, 0, 0)),
                  ),
                  IconButton(
                    onPressed: controller.fetchFavoriteMovies,
                    icon: Icon(MdiIcons.heart,
                        color: controller.getTitlePage == 'FAVORITOS'
                            ? Color(0xFF7100cd)
                            : Color.fromARGB(255, 0, 0, 0)),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  final String? title;
  final IconData icon;
  const MenuItem({this.title, required this.icon});
}
