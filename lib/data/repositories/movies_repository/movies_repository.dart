import 'package:movie_db/data/models/movie_card_model.dart';
import 'package:movie_db/data/models/movie_detail_model.dart';
import 'package:movie_db/utils/result.dart';

abstract interface class MoviesRepository {
  Future<Result<List<MovieCardModel>>> getPopularMovies();
  Future<Result<List<MovieCardModel>>> getTrendingMovies();
  Future<Result<List<MovieCardModel>>> getTopRatedMovies();
  Future<Result<MovieDetailModel>> getMovieDetails(int id);
  Future<Result<List<MovieCardModel>>> searchMovies(String title);
}
