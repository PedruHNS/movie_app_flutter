import 'package:movie_db/utils/restclient/rest_client.dart';

import 'auth_service.dart';

class AuthServiceImpl implements AuthService {
  final RestClient _client;

  AuthServiceImpl({required RestClient client}) : _client = client;
}
