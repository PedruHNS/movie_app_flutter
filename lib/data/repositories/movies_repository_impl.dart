import 'dart:developer';

import 'package:movie_db/data/models/movie_card_model.dart';
import 'package:movie_db/data/models/movie_detail_model.dart';
import 'package:movie_db/data/services/movies_service.dart';

import 'package:movie_db/utils/result.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesService _moviesService;

  MoviesRepositoryImpl({required MoviesService movieService})
      : _moviesService = movieService;
  @override
  Future<Result<List<MovieCardModel>>> getPopularMovies() async {
    try {
      final result = await _moviesService.getPopularMoviesAPI();

      return switch (result) {
        Success<List<MovieCardModel>>() => Result.success(result.value),
        Error<List<MovieCardModel>>() => Result.error(result.error),
      };
    } on Exception catch (e) {
      return Result.error(e);
    }
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
  Future<Result<List<MovieCardModel>>> searchMovies(String title) async {
    title = title.replaceAll(' ', '%20');

    final result = await _moviesService.searchMoviesAPI(title);

    return switch (result) {
      Success<List<MovieCardModel>>() => Result.success(result.value),
      Error<List<MovieCardModel>>() => Result.error(result.error),
    };
  }
}
