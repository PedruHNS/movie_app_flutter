import 'package:movie_db/data/api/models/movie_card_model.dart';
import 'package:movie_db/data/api/models/movie_detail_model.dart';
import 'package:movie_db/utils/result.dart';

abstract interface class MoviesRepository {
  Future<Result<List<MovieCardModel>>> getPopularMovies({int page = 1});
  Future<Result<List<MovieCardModel>>> getTrendingMovies({int page = 1});
  Future<Result<List<MovieCardModel>>> getTopRatedMovies({int page = 1});
  Future<Result<MovieDetailModel>> getMovieDetails(int id);
  Future<Result<List<MovieCardModel>>> searchMovies(String title, {int page = 1});
}
