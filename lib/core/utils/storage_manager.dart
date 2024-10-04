import 'package:flutter_secure_storage/flutter_secure_storage.dart';


/// A singleton class to manage secure storage operations.
///
/// This class provides methods to securely store, retrieve, and delete
/// data using [FlutterSecureStorage]. It ensures that sensitive information
/// is stored securely and is accessible only through this manager.
class StorageManager {
  static final StorageManager _singleton = StorageManager._internal();

  /// Private constructor to create a singleton instance of [StorageManager].
  StorageManager._internal();

  /// Provides access to the singleton instance of [StorageManager].
  static StorageManager get instance => _singleton;

  /// [FlutterSecureStorage] instance
  late FlutterSecureStorage storage;

  /// Initializes the [FlutterSecureStorage] instance with default options.
  void create() {
    storage = FlutterSecureStorage(
      aOptions: AndroidOptions.defaultOptions.copyWith(encryptedSharedPreferences: true),
    );
  }

  /// Stores a string value associated with a specified key.
  ///
  /// [key]: The key under which the value is stored.
  /// [value]: The string value to be stored.
  void setString(final String key, final String value) async =>
      await storage.write(key: key, value: value);

  /// Retrieves a string value associated with a specified key.
  ///
  /// Returns an empty string if the key does not exist.
  ///
  /// [key]: The key associated with the desired value.
  Future<String> getString(final String key) async =>
      await storage.read(key: key) ?? '';

  /// Clears all stored values in secure storage.
  void clear() async => await storage.deleteAll();

  /// Removes the value associated with a specified key.
  ///
  /// [key]: The key of the value to be removed.
  void remove(final String key) async => await storage.delete(key: key);
}
