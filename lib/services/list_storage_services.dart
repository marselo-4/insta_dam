import 'package:shared_preferences/shared_preferences.dart';

class PostList {
  // Guarda una lista de strings en SharedPreferences
  Future<void> setList(String key, List<String> list) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, list);
  }

  // Recupera una lista de strings desde SharedPreferences
  Future<List<String>?> getList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }
}
