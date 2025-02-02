import 'package:movie_db/data/models/movie_card_model.dart';
import 'package:movie_db/data/repositories/movies_repository.dart';
import 'package:movie_db/utils/result.dart';
import 'package:signals/signals.dart';

class TrendingVm {
  final MoviesRepository _moviesRepository;

  TrendingVm({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;

  final isLoading = signal(false);
  bool get getIsLoading => isLoading.value;
  final message = signal<String?>(null);

  final _movies = signal<List<MovieCardModel>>([]);
  List<MovieCardModel> get movies => _movies.value;

  Future<void> getMoviesTrending() async {
    isLoading.value = true;
    final result = await _moviesRepository.getTrendingMovies();
    switch (result) {
      case Success<List<MovieCardModel>>():
        _movies.value.clear();
        _movies.value.addAll(result.value);
        break;
      case Error():
        message.value = result.error.toString();
        break;
    }
    isLoading.value = false;
  }
}
