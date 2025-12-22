import 'package:shared_preferences/shared_preferences.dart';

enum SPKey {
  onboardingCompleted('onboarding_completed');

  const SPKey(this.value);

  final String value;
}

class SPHelper {
  SPHelper._(this._prefs);

  final SharedPreferences _prefs;

  static SPHelper? _instance;

  /// Lazily initializes shared preferences on first access.
  static Future<SPHelper> instance() async {
    if (_instance != null) {
      return _instance!;
    }

    // Double-checked locking to avoid race conditions on first init.
    return Future.sync(() async {
      if (_instance != null) {
        return _instance!;
      }
      return Future(() async {
        return _instance ??= SPHelper._(await SharedPreferences.getInstance());
      });
    });
  }

  T? get<T>(SPKey key) {
    final String prefKey = key.value;
    if (T == bool) {
      return _prefs.getBool(prefKey) as T?;
    }
    if (T == int) {
      return _prefs.getInt(prefKey) as T?;
    }
    if (T == double) {
      return _prefs.getDouble(prefKey) as T?;
    }
    if (T == String) {
      return _prefs.getString(prefKey) as T?;
    }
    if (T == List<String>) {
      return _prefs.getStringList(prefKey) as T?;
    }
    return null;
  }

  Future<bool> set<T>(SPKey key, T value) {
    final String prefKey = key.value;
    if (value is bool) {
      return _prefs.setBool(prefKey, value);
    }
    if (value is int) {
      return _prefs.setInt(prefKey, value);
    }
    if (value is double) {
      return _prefs.setDouble(prefKey, value);
    }
    if (value is String) {
      return _prefs.setString(prefKey, value);
    }
    if (value is List<String>) {
      return _prefs.setStringList(prefKey, value);
    }
    throw UnsupportedError('Type ${value.runtimeType} is not supported');
  }

  Future<bool> remove(SPKey key) => _prefs.remove(key.value);

  Future<bool> clear() => _prefs.clear();
}
