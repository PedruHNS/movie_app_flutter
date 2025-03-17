import 'package:movie_db/data/api/services/auth_service/auth_service.dart';
import 'package:movie_db/utils/result.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl({required AuthService authService})
      : _authService = authService;

  @override
  Future<bool> isFirstAccess() async {
    return await _authService.isFirstAccess();
  }

  @override
  Future<Result<String>> createRequestToken() async {
    final result = await _authService.createRequestToken();

    return switch (result) {
      Success() => result,
      Error() => Result.error(result.error),
    };
  }
}
