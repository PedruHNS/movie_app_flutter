class Constants {
  static const String _baseUrl = 'https://api.themoviedb.org/3/movie';
  static const String _popular = '/popular?language=pt-BR&page=1';

  static String getPopular() => '$_baseUrl$_popular';

  static String getBaseUrl() => _baseUrl;
}
