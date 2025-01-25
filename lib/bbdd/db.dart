import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> initdb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'database.db');

    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
                CREATE TABLE sessionData (
          sesion_path TEXT
        )
      ''');
    });
  }
}


// CREATE TABLE userInteractions (
//           id_interaction INTEGER PRIMARY KEY AUTO_INCREMENT, 
//           interaction_date DATE,
//           /** PON AQUI LAS TABLAS QUE FALTEN **/
//         )