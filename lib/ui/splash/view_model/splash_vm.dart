import 'dart:developer';

import 'package:movie_db/data/api/repositories/auth_repository/auth_repository.dart';

class SplashVm {
  final AuthRepository _authRepository;

  SplashVm({required AuthRepository authRepository})
      : _authRepository = authRepository;

  var isFirstLogin = true;

  Future<void> init() async {
    await _isFirstAccess();
  }

  Future<void> _isFirstAccess() async {
    isFirstLogin = await _authRepository.isFirstAccess();
    log(isFirstLogin.toString());
  }
}
