import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageManager {
  static final StorageManager _singleton = StorageManager._internal();
  StorageManager._internal();

  static StorageManager get instance => _singleton;

  late FlutterSecureStorage storage;

  void create() {
    storage = FlutterSecureStorage(
      aOptions: AndroidOptions.defaultOptions.copyWith(encryptedSharedPreferences: true)
    );
  }

  void setString(final String key, final String value) async => await storage.write(key: key, value: value);

  Future<String> getString(final String key) async => await storage.read(key: key) ?? '';

  void clear() async => await storage.deleteAll();

  void remove(final String key) async => await storage.delete(key: key);
}
