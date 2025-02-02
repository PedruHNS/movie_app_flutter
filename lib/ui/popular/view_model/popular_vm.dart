import 'package:movie_db/data/models/movie_card_model.dart';
import 'package:movie_db/data/repositories/movies_repository.dart';
import 'package:movie_db/utils/result.dart';
import 'package:signals/signals.dart';

class PopularVm {
  final MoviesRepository _moviesRepository;

  final movies = Signal(<MovieCardModel>[]);
  final messagem = Signal<String>('');
  final isLoading = Signal<bool>(false);
  bool get getIsLoading => isLoading.value;

  PopularVm(final MoviesRepository moviesRepository)
      : _moviesRepository = moviesRepository;

  Future<void> fetchPopularMovies() async {
    isLoading.value = true;
    final result = await _moviesRepository.getPopularMovies();

    switch (result) {
      case Success<List<MovieCardModel>>():
        movies.value = result.value;
        break;
      case Error():
        result.error;
    }
    isLoading.value = false;
  }
}
