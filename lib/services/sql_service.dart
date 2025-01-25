import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:insta_dam/bbdd/db.dart';

class SqlService {

  String lastRoute = selectSessionPath().toString();
  
  Future<void> saveSesionPath(String route) async {
    DB.initdb();

    Future<void> insertSession() async {
      final databasesPath = await getDatabasesPath();
      final path = join(databasesPath, 'database.db');
      var db = await openDatabase(path);

      await db.rawInsert(
        'INSERT INTO sessionData (sesion_path) VALUES (?)',
        [route],
      );
    }
    insertSession();
  }

  static Future<String> selectSessionPath() async {
    final databasesPath = await getDatabasesPath();
    final path = await join(databasesPath, 'database.db');
    var db = await openDatabase(path);

    var sessionPath = await db.rawQuery(
        "SELECT sesion_path FROM sessionData ORDER BY ROWID DESC LIMIT 1");

    String ruta = "";

    if (sessionPath.isNotEmpty) {
      
      if (sessionPath.first['sesion_path'] != null) {
      ruta = sessionPath.first['sesion_path'] as String;
      print("function -->"+ ruta);
    }else{
      ruta = "/landing";
    }
    }

    
    
    return ruta;
  }

}
