import 'dart:convert';

class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final String voteCount;
  final String releaseDate;
  final List<int> genreIds;
  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
    required this.genreIds,
  });

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      overview: map['overview'] ?? '',
      posterPath: map['posterPath'] ?? '',
      backdropPath: map['backdropPath'] ?? '',
      voteAverage: map['voteAverage']?.toDouble() ?? 0.0,
      voteCount: map['voteCount'] ?? '',
      releaseDate: map['releaseDate'] ?? '',
      genreIds: List<int>.from(map['genreIds']),
    );
  }

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));
}
