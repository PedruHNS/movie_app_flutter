import 'package:flutter/material.dart';
import 'package:movie_db/config/dependencies.dart';
import 'package:movie_db/data/models/movie_card_model.dart';
import 'package:movie_db/data/repositories/movies_repository.dart';
import 'package:movie_db/ui/favorite/favorite_screen.dart';
import 'package:movie_db/ui/popular/view_model/popular_vm.dart';
import 'package:movie_db/ui/popular/widget/popular_screen.dart';
import 'package:movie_db/ui/release/release_screen.dart';
import 'package:movie_db/ui/trending/view_model/trending_vm.dart';

import 'package:movie_db/ui/trending/widget/trending_screen.dart';
import 'package:movie_db/utils/result.dart';
import 'package:signals/signals.dart';

class HomeVm {
  final MoviesRepository _moviesRepository;

  HomeVm({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;
  final selectedScreenIndex = Signal(0);

  final List<Widget> _page = [
    PopularScreen(popularVm: getIt<PopularVm>()),
    TrendingScreen(trendingVm: getIt<TrendingVm>()),
    ReleaseScreen(),
    FavoriteScreen(),
  ];

  final _movies = signal<List<MovieCardModel>>([]);
  List<MovieCardModel> get movies => _movies.value;
  final isLoading = signal(false);

  List<Widget> get page => _page;

  void onTapScreen(int index) {
    selectedScreenIndex.value = index;
  }

  Future<void> searchMovies(String title) async {
    isLoading.value = true;
    final result = await _moviesRepository.searchMovies(title);

    switch (result) {
      case Success<List<MovieCardModel>>():
        _movies.value.clear();
        _movies.value.addAll(result.value);
        break;
      case Error():
        _movies.value.clear();
        break;
    }
    isLoading.value = false;
  }
}
