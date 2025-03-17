import 'package:movie_db/utils/constants.dart';
import 'package:movie_db/utils/local_storage/local_storage.dart';
import 'package:movie_db/utils/restclient/rest_client.dart';
import 'package:movie_db/utils/result.dart';

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

  @override
  Future<Result<String>> createRequestToken() async {
    try {
      final result = await _client.get(Constants.getAuthentication);

      if (result.statusCode == 200) {
        final requestToken = result.data['request_token'];
        return Result.success(requestToken);
      }
      return Result.error(Exception('reponse invalida!'));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<void> authWithLogin(String username, String password) {
    // TODO: implement authWithLogin
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> createSessionID(String token) {
    // TODO: implement createSessionID
    throw UnimplementedError();
  }
}
