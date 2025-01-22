import 'package:movie_db/data/models/movie_model.dart';
import 'package:movie_db/utils/result.dart';

abstract interface class MoviesRepository {
  Future<Result<List<MovieModel>>> getPopularMovies();
}
