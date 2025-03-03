import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import './local_storage.dart';

class LocalStorageImpl implements LocalStorage {
  late final FlutterSecureStorage _secureStorage;
  LocalStorageImpl() {
    _secureStorage = FlutterSecureStorage();
  }

  @override
  Future<void> removeData(String key) async {
    try {
      await _secureStorage.delete(key: key);
    } on Exception catch (_) {
      throw Exception('Failed to remove data');
    }
  }

  @override
  Future<String?> getData(String key) async {
    try {
      return await _secureStorage.read(key: key);
    } on Exception catch (_) {
      throw Exception('Failed to get data');
    }
  }

  @override
  Future<void> saveData<T>(String key, T value) async {
    try {
      await _secureStorage.write(key: key, value: value.toString());
    } on Exception catch (_) {
      throw Exception('Failed to save data');
    }
  }
}
