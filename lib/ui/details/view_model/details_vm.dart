import 'package:movie_db/data/models/movie_detail_model.dart';
import 'package:signals/signals.dart';
import 'package:movie_db/data/models/movie_card_model.dart';
import 'package:movie_db/data/repositories/movies_repository.dart';
import 'package:movie_db/utils/result.dart';

class DetailsVm {
  final MoviesRepository _movieRepository;
  DetailsVm(final MoviesRepository movieRepository)
      : _movieRepository = movieRepository;

  final _movie = signal<MovieDetailModel?>(null);
  MovieDetailModel? get movie => _movie.value;
  final message = signal<String>('');
  final _isLoading = signal<bool>(false);
  bool get isLoading => _isLoading.value;

  Future<void> getMovieById(final String id) async {
    _isLoading.value = true;
    final int movieId = int.parse(id);

    final result = await _movieRepository.getMovieDetails(movieId);

    switch (result) {
      case Success<MovieDetailModel>():
        _movie.value = result.value;
        break;
      case Error():
        message.value = result.error.toString();
        break;
    }
    _isLoading.value = false;
  }
}
