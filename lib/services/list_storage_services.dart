import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefList {
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
  
  // Obtiene un valor de una lista por su índice (ID)
  Future<String?> getDataById(String key, int id) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? list = prefs.getStringList(key);

    
    if (list != null && id >= 0 && id < list.length) {
      return list[id]; 
    } else {
      return null;
    }
  }
}
