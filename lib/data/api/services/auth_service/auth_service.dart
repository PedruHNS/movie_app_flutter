import 'package:movie_db/utils/result.dart';

abstract interface class AuthService {
  Future<bool> isFirstAccess();
  Future<Result<String>> createRequestToken();
  Future<void> authWithLogin(String username, String password);
  Future<Result<String>> createSessionID(String token);
}
