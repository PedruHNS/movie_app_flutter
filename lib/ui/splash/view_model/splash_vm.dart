import 'dart:developer';

import 'package:movie_db/data/api/repositories/auth_repository/auth_repository.dart';
import 'package:movie_db/utils/local_storage/local_storage.dart';
import 'package:movie_db/utils/result.dart';
import 'package:signals/signals.dart';

class SplashVm {
  final AuthRepository _authRepository;
  final LocalStorage _localStorage;

  final _isLoading = Signal(false);
  bool get getIsLoading => _isLoading.value;

  SplashVm({
    required AuthRepository authRepository,
    required LocalStorage localStorage,
  })  : _authRepository = authRepository,
        _localStorage = localStorage;

  var isFirstLogin = true;

  Future<void> init() async {
    await _isFirstAccess();
    await _createRequestToken();
    // final teste = await _localStorage.getData('tokenRequest');
    // log(teste.toString());
  }

  Future<void> _isFirstAccess() async {
    _isLoading.value = true;
    isFirstLogin = await _authRepository.isFirstAccess();
    _isLoading.value = false;
  }

  Future<void> _createRequestToken() async {
    _isLoading.value = true;
    final token = await _authRepository.createRequestToken();

    switch (token) {
      case Success<String>():
        await _localStorage.saveData('tokenRequest', token.value);
        break;
      case Error():
        token.error;
        break;
    }
    _isLoading.value = false;
  }
}
