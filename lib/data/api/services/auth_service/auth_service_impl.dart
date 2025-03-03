import 'package:movie_db/utils/local_storage/local_storage.dart';
import 'package:movie_db/utils/restclient/rest_client.dart';

import 'auth_service.dart';

class AuthServiceImpl implements AuthService {
  final RestClient _client;
  final LocalStorage _localStorage;

  AuthServiceImpl(
      {required RestClient client, required LocalStorage localStorage})
      : _client = client,
        _localStorage = localStorage;

  @override
  Future<bool> isFirstAccess() async {
    final result = await _localStorage.getData('isFirstLogin');
    final isFirst = result == null;
    await _localStorage.saveData('isFirstLogin', isFirst.toString());
    return isFirst;
  }
}
