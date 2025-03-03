abstract interface class LocalStorage {
  Future<void> saveData<T>(String key, T value);
  Future<String?> getData(String key);
  Future<void> removeData(String key);
}
