import 'package:movie_db/data/api/models/movie_card_model.dart';
import 'package:movie_db/data/api/models/movie_detail_model.dart';
import 'package:movie_db/utils/result.dart';

abstract interface class MoviesService {
  Future<Result<List<MovieCardModel>>> getPopularMoviesAPI({int page = 1});
  Future<Result<List<MovieCardModel>>> getTrendingMoviesAPI({int page = 1});
  Future<Result<List<MovieCardModel>>> getTopRatedMoviesAPI({int page = 1});
  Future<Result<MovieDetailModel>> getMovieDetailsAPI(int id);
  Future<Result<List<MovieCardModel>>> searchMoviesAPI(String title,
      {int page = 1});
}
