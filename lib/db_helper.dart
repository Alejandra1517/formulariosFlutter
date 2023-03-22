import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._instance();

  DbHelper._instance();

  static Database? _db;

  Future<Database> get db async {
    _db ??= await initDb();
    return _db!;
  }

  static Future<Database> initDb() async {
    final db = openDatabase(
      join(await getDatabasesPath(), 'cliente_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE cliente(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, lastName TEXT, email TEXT, phone TEXT, adress TEXT state INTEGER)',
        );
      },
      version: 1,
    );
    return db;
  }
}



