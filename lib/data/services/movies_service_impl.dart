import 'package:movie_db/data/models/movie_card_model.dart';
import 'package:movie_db/data/models/movie_detail_model.dart';
import 'package:movie_db/utils/constants.dart';
import 'package:movie_db/utils/restclient/rest_client.dart';

import 'package:movie_db/utils/result.dart';

import 'movies_service.dart';

class MoviesServiceImpl implements MoviesService {
  final RestClient _client;

  MoviesServiceImpl({required RestClient client}) : _client = client;
  @override
  Future<Result<List<MovieCardModel>>> getPopularMoviesAPI() async {
    try {
      final result = await _client.get(Constants.getPopular);

      if (result.statusCode == 200) {
        final results = result.data['results'] as List;
        final List<MovieCardModel> movies = results.map((e) {
          return MovieCardModel.fromMap(e);
        }).toList();
        return Result.success(movies);
      }
      return Result.error(Exception('reponse invalida!'));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<MovieDetailModel>> getMovieDetailsAPI(int id) async {
    try {
      final result = await _client.get(Constants.details(id));

      if (result.statusCode == 200) {
        final movie = MovieDetailModel.fromMap(result.data);
        return Result.success(movie);
      }
      return Result.error(Exception('reponse invalida!'));
    } on Exception catch (_) {
      return Result.error(Exception('reponse invalida!'));
    }
  }
}
