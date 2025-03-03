import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movie_db/data/api/repositories/auth_repository/auth_repository.dart';
import 'package:movie_db/utils/local_storage/local_storage.dart';
import 'package:movie_db/utils/local_storage/local_storage_impl.dart';
import 'package:signals/signals.dart';

class SplashVm {
  final AuthRepository _authRepository;
  final LocalStorage _localStorage = LocalStorageImpl(FlutterSecureStorage());

  SplashVm({required AuthRepository authRepository})
      : _authRepository = authRepository;

  var isFirstLogin = true;

  Future<void> init() async {
    await _isFirstAccess();
  }

  Future<void> _isFirstAccess() async {
    final result = await _localStorage.getData('isFirstLogin');
    final isFirst = result == null;
    await _localStorage.saveData('isFirstLogin', isFirst.toString());
    isFirstLogin = isFirst;
  }
}
