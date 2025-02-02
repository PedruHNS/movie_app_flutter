import 'package:movie_db/data/models/movie_card_model.dart';
import 'package:movie_db/data/repositories/movies_repository.dart';
import 'package:movie_db/utils/result.dart';
import 'package:signals/signals_flutter.dart';

class TopRatedVm {
  final MoviesRepository _moviesRepository;

  TopRatedVm({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;

  final _isLoading = Signal(false);
  bool get getIsLoading => _isLoading.value;

  final _movies = Signal<List<MovieCardModel>>([]);
  List<MovieCardModel> get movies => _movies.value;

  final _message = Signal<String?>(null);
  String? get message => _message.value;

  Future<void> getTopRatedMovies() async {
    _isLoading.value = true;
    final result = await _moviesRepository.getTopRatedMovies();

    switch (result) {
      case Success<List<MovieCardModel>>():
        _movies.value.clear();
        _movies.value.addAll(result.value);
        break;
      case Error():
        _movies.value.clear();
        _message.value = result.error.toString();
    }
    _isLoading.value = false;
  }
}
