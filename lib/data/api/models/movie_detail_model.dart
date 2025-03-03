import 'package:movie_db/data/api/models/genre_model.dart';
import 'package:movie_db/utils/constants.dart';

class MovieDetailModel {
  final String title;
  final String overview;
  final String posterPath;
  final int runtime;
  final String backdropPath;
  final List<GenreModel> genres;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;

  MovieDetailModel({
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.genres,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.runtime,
  });

  factory MovieDetailModel.fromMap(Map<String, dynamic> map) {
    return MovieDetailModel(
      title: map['title'] ?? '',
      overview: map['overview'] ?? '',
      posterPath: Constants.getImageUrl + (map['poster_path'] ?? ''),
      runtime: map['runtime']?.toInt() ?? 0,
      backdropPath: Constants.getImageUrl + (map['backdrop_path'] ?? ''),
      genres: List<GenreModel>.from(
          map['genres']?.map((x) => GenreModel.fromMap(x))),
      releaseDate: map['release_date'] ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      voteCount: map['vote_count']?.toInt() ?? 0,
    );
  }

  @override
  String toString() {
    return 'MovieDetailModel(title: $title, overview: $overview, posterPath: $posterPath, runtime: $runtime, backdropPath: $backdropPath, genres: $genres, releaseDate: $releaseDate, voteAverage: $voteAverage, voteCount: $voteCount)';
  }
}
