import 'package:movie_db/data/models/movie_card_model.dart';
import 'package:movie_db/data/repositories/movies_repository.dart';

import 'package:movie_db/utils/result.dart';
import 'package:signals/signals.dart';

class HomeVm {
  final MoviesRepository _moviesRepository;

  HomeVm({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;
  final selectedScreenIndex = Signal(0);

  final _moviesSearch = signal<List<MovieCardModel>>([]);
  List<MovieCardModel> get moviesSearch => _moviesSearch.value;

  final _moviesList = signal<List<MovieCardModel>>([]);
  List<MovieCardModel> get moviesList => _moviesList.value;

  final _titlePage = signal('');
  String get getTitlePage => _titlePage.value;

  final isLoading = signal(false);
  bool get getIsLoading => isLoading.value;

  void onTapScreen(int index) {
    selectedScreenIndex.value = index;
  }

  Future<void> searchMovies(String title) async {
    isLoading.value = true;
    final result = await _moviesRepository.searchMovies(title);

    switch (result) {
      case Success<List<MovieCardModel>>():
        _moviesSearch.value.clear();
        _moviesSearch.value.addAll(result.value);
        break;
      case Error():
        _moviesSearch.value.clear();
        break;
    }
    isLoading.value = false;
  }

  Future<void> fetchPopularMovies() async {
    isLoading.value = true;
    _titlePage.value = 'POPULARES';
    final result = await _moviesRepository.getPopularMovies();

    switch (result) {
      case Success<List<MovieCardModel>>():
        _moviesList.value = result.value;
        break;
      case Error():
        result.error;
    }
    isLoading.value = false;
  }

  Future<void> fetchTrendingMovies() async {
    isLoading.value = true;
    _titlePage.value = 'TENDÊNCIAS';
    final result = await _moviesRepository.getTrendingMovies();

    switch (result) {
      case Success<List<MovieCardModel>>():
        _moviesList.value = result.value;
        break;
      case Error():
        result.error;
    }
    isLoading.value = false;
  }

  Future<void> fetchTopRatedMovies() async {
    isLoading.value = true;
    _titlePage.value = 'MELHORES AVALIADOS';
    final result = await _moviesRepository.getTopRatedMovies();

    switch (result) {
      case Success<List<MovieCardModel>>():
        _moviesList.value = result.value;
        break;
      case Error():
        result.error;
    }
    isLoading.value = false;
  }

  Future<void> fetchFavoriteMovies() async {}
}
