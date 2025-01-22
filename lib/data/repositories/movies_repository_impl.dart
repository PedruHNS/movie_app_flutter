import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_db/data/models/movie_model.dart';
import 'package:movie_db/utils/constants.dart';
import 'package:movie_db/utils/result.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final dio = Dio();
  @override
  Future<Result<List<MovieModel>>> getPopularMovies() async {
    try {
      final result = await dio.get(
        Constants.getPopular(),
        options: Options(
          headers: {
            'accept': 'application/json',
            'authorization':
                'Bearer '
          },
        ),
      );
      log('Response: ${result.data}');

      final results = result.data['results'] as List;
      final List<MovieModel> movies = results.map((e) {
        return MovieModel.fromMap(e);
      }).toList();
      return Result.success(movies);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
