import 'package:movie_db/utils/restclient/rest_client_response.dart';

abstract interface class RestClient {
  Future<RestClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
