class Constants {
  //base url
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static const String _popular = '/movie/popular';
  static const String _topRated = '/movie/top_rated';
  static const String _searchByName = '/search/movie';
  static const String _trending = '/trending/movie/week';

  //querys
  static const Map<String, String> _gueryLanguage = {'language': 'pt-BR'};

  //getters
  static String get getPopular => _popular;
  static String get getBaseUrl => _baseUrl;
  static String get getImageUrl => _imageBaseUrl;
  static Map<String, String> get gueryLanguage => _gueryLanguage;
  static String get getByNames => _searchByName;
  static String get getTrending => _trending;
  static String get getTopRated => _topRated;

  //paths
  static String details(String id) => '/movie/$id';
}
