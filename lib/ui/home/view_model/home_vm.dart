import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_db/data/models/movie_card_model.dart';

import 'package:movie_db/data/repositories/movies_repository/movies_repository.dart';

import 'package:movie_db/utils/result.dart';
import 'package:signals/signals.dart';

class HomeVm {
  final MoviesRepository _moviesRepository;
  final textControllerSearch = TextEditingController();
  final scrollController = ScrollController();

  HomeVm({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;

  final _moviesSearch = signal<List<MovieCardModel>>([]);
  List<MovieCardModel> get moviesSearch => _moviesSearch.value;

  final _moviesList = signal<List<MovieCardModel>>([]);
  List<MovieCardModel> get moviesList => _moviesList.value;

  final _titlePage = signal('');
  String get getTitlePage => _titlePage.value;

  final _isLoadingMovies = signal(false);
  bool get getIsLoadingMovies => _isLoadingMovies.value;

  final _isLoadingSearch = signal(false);
  bool get getIsLoadingSearch => _isLoadingSearch.value;

  final _showBottomNav = signal(true);
  bool get showBottomNav => _showBottomNav.value;

  void dispose() {
    textControllerSearch.dispose();
    scrollController.dispose();
  }

  void disableBottomBar() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        _showBottomNav.value = false;
      } else {
        _showBottomNav.value = true;
      }
    });
  }

  Future<void> searchMovies() async {
    _isLoadingSearch.value = true;
    final result =
        await _moviesRepository.searchMovies(textControllerSearch.text);

    switch (result) {
      case Success<List<MovieCardModel>>():
        _moviesSearch.value.clear();
        _moviesSearch.value.addAll(result.value);
        break;
      case Error():
        _moviesSearch.value.clear();
        break;
    }
    _isLoadingSearch.value = false;
  }

  Future<void> fetchPopularMovies() async {
    _isLoadingMovies.value = true;
    _titlePage.value = 'POPULARES';
    final result = await _moviesRepository.getPopularMovies();

    switch (result) {
      case Success<List<MovieCardModel>>():
        _moviesList.value = result.value;
        break;
      case Error():
        result.error;
    }
    _isLoadingMovies.value = false;
  }

  Future<void> fetchTrendingMovies() async {
    _isLoadingMovies.value = true;
    _titlePage.value = 'TENDÊNCIAS';
    final result = await _moviesRepository.getTrendingMovies();

    switch (result) {
      case Success<List<MovieCardModel>>():
        _moviesList.value = result.value;
        break;
      case Error():
        result.error;
    }
    _isLoadingMovies.value = false;
  }

  Future<void> fetchTopRatedMovies() async {
    _isLoadingMovies.value = true;
    _titlePage.value = 'MELHORES AVALIADOS';
    final result = await _moviesRepository.getTopRatedMovies();

    switch (result) {
      case Success<List<MovieCardModel>>():
        _moviesList.value = result.value;
        break;
      case Error():
        result.error;
    }
    _isLoadingMovies.value = false;
  }

  Future<void> fetchFavoriteMovies() async {
    _isLoadingMovies.value = true;
    _titlePage.value = 'FAVORITOS';
    _moviesList.value = [];
    _isLoadingMovies.value = false;
  }
}
