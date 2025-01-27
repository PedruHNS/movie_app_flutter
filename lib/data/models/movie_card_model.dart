
import 'package:movie_db/utils/constants.dart';

class MovieCardModel {
  final int id;
  final String title;
  final String posterPath;
  final String releaseDate;

  MovieCardModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
  });

  factory MovieCardModel.fromMap(Map<String, dynamic> map) {
    return MovieCardModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      posterPath: map['poster_path'] ?? '',
      releaseDate: map['release_date'] ?? '',
    );
  }

  String imagePoster() => Constants.getImageUrl + posterPath;

  @override
  String toString() {
    return 'MovieCardModel(id: $id, title: $title, posterPath: $posterPath, releaseDate: $releaseDate)';
  }
}
