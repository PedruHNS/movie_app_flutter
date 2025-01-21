import 'package:flutter/material.dart';
import 'package:movie_db/ui/home/widgets/favorite_screen.dart';
import 'package:movie_db/ui/home/widgets/popular_screen.dart';
import 'package:movie_db/ui/home/widgets/release_screen.dart';
import 'package:movie_db/ui/home/widgets/search_screen.dart';
import 'package:movie_db/ui/home/widgets/top_rated_screen.dart';
import 'package:signals/signals.dart';

class HomeVm {
  final selectedScreenIndex = Signal(0);

  final List<Widget> _page = [
    PopularScreen(),
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
