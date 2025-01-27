import 'package:flutter/material.dart';
import 'package:movie_db/config/dependencies.dart';
import 'package:movie_db/ui/favorite/favorite_screen.dart';
import 'package:movie_db/ui/popular/view_model/popular_vm.dart';
import 'package:movie_db/ui/popular/widget/popular_screen.dart';
import 'package:movie_db/ui/release/release_screen.dart';
import 'package:movie_db/ui/search/search_screen.dart';
import 'package:movie_db/ui/top_rated/top_rated_screen.dart';
import 'package:signals/signals.dart';

class HomeVm {
  final selectedScreenIndex = Signal(0);

  final List<Widget> _page = [
    PopularScreen(popularVm: getIt<PopularVm>()),
    ReleaseScreen(),
    SearchScreen(),
    TopRatedScreen(),
    FavoriteScreen(),
  ];

  List<Widget> get page => _page;

  void onTapScreen(int index) {
    selectedScreenIndex.value = index;
  }
}
