import 'package:movie_db/data/api/services/auth_service/auth_service.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl({required AuthService authService})
      : _authService = authService;

  @override
  Future<bool> isFirstAccess() async {
    return await _authService.isFirstAccess();
  }
}
