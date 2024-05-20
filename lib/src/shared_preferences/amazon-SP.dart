import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  void saveData({
    required String type,
    required String key,
    required final value,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (type == 'Int') {
      await prefs.setInt(key, value);
    }
    if (type == 'Double') {
      await prefs.setDouble(key, value);
    }

    if (type == 'String') {
      await prefs.setString(key, value);
    }
  }

  Future<double?> readDouble({
    required String key,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final double? data = prefs.getDouble(key);
    if (data != null) {
      return data;
    }
    return 0.0;
  }

  Future<int?> readInt({
    required String key,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? data = prefs.getInt(key);
    if (data != null) {
      return data;
    }
    return 0;
  }

    Future<String?> readString({
    required String key,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString(key);
    if (data != null) {
      return data;
    }
    return '';
  }
}
