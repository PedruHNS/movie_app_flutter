class Constants {
  static const String _baseUrl = 'https://api.themoviedb.org/3/movie';
  static const String _imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  static const String _popular = '/popular?language=pt-BR&page=1';

  static String get getPopular => _popular;
  static String get getBaseUrl => _baseUrl;
  static String get getImageUrl => _imageBaseUrl;
  static String getByNames(String title) =>
      'https://api.themoviedb.org/3/search/movie?query=$title&include_adult=true&language=pt-BR&page=1';
  static String details(int id) => '/$id?language=pt-BR';
}
