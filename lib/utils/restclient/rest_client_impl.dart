import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_db/utils/constants.dart';
import 'package:movie_db/utils/restclient/rest_client_response.dart';

import './rest_client.dart';

class RestClientImpl implements RestClient {
  late final Dio _dio;

  final _baseOptions = BaseOptions(
      baseUrl: Constants.getBaseUrl,
      connectTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 60000),
      headers: {
        'accept': 'application/json',
        'authorization': 'Bearer ${dotenv.env['API_KEY']}'
      });

  RestClientImpl() {
    _dio = Dio(_baseOptions);
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  @override
  Future<RestClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final result = await _dio.get(path,
        queryParameters: queryParameters, options: Options(headers: headers));
    return _dioResponseConverter(result);
  }

  @override
  Future<RestClientResponse<T>> post<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      body}) async {
    final result = await _dio.post(path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        data: body);
    return _dioResponseConverter(result);
  }

  RestClientResponse<T> _dioResponseConverter<T>(Response<dynamic> result) {
    return RestClientResponse(
      data: result.data,
      statusCode: result.statusCode,
      message: result.statusMessage,
    );
  }
}
