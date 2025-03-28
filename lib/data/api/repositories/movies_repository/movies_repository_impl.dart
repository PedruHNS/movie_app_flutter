import 'package:movie_db/data/api/models/movie_card_model.dart';
import 'package:movie_db/data/api/models/movie_detail_model.dart';
import 'package:movie_db/data/api/services/movies_service/movies_service.dart';

import 'package:movie_db/utils/result.dart';

import 'movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesService _moviesService;

  MoviesRepositoryImpl({required MoviesService movieService})
      : _moviesService = movieService;
  @override
  Future<Result<List<MovieCardModel>>> getPopularMovies({int page = 1}) async {
    final result = await _moviesService.getPopularMoviesAPI(page: page);

    return switch (result) {
      Success() => Result.success(result.value),
      Error() => Result.error(result.error),
    };
  }

  @override
  Future<Result<MovieDetailModel>> getMovieDetails(int id) async {
    final result = await _moviesService.getMovieDetailsAPI(id);

    return switch (result) {
      Success<MovieDetailModel>() => Result.success(result.value),
      Error<MovieDetailModel>() => Result.error(result.error),
    };
  }

  @override
  Future<Result<List<MovieCardModel>>> searchMovies(String title,
      {int page = 1}) async {
    title = title.replaceAll(' ', '%20');

    final result = await _moviesService.searchMoviesAPI(title, page: page);

    return switch (result) {
      Success<List<MovieCardModel>>() => Result.success(result.value),
      Error() => Result.error(result.error),
    };
  }

  @override
  Future<Result<List<MovieCardModel>>> getTrendingMovies({int page = 1}) async {
    final result = await _moviesService.getTrendingMoviesAPI(page: page);

    return switch (result) {
      Success<List<MovieCardModel>>() => Result.success(result.value),
      Error() => Result.error(result.error),
    };
  }

  @override
  Future<Result<List<MovieCardModel>>> getTopRatedMovies({int page = 1}) async {
    final result = await _moviesService.getTopRatedMoviesAPI(page: page);

    return switch (result) {
      Success<List<MovieCardModel>>() => Result.success(result.value),
      Error<List<MovieCardModel>>() => Result.error(result.error),
    };
  }
}
