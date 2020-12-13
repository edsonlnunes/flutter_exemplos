import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBSQLite {
  Database _instance;
  final versionDB = 5;

  static final DBSQLite _db = DBSQLite._internal();

  DBSQLite._internal();

  factory DBSQLite() {
    return _db;
  }

  Future<Database> getInstance() async {
    if (_instance == null) _instance = await _openDatabase();

    return _instance;
  }

  Future<Database> _openDatabase() async {
    var pathDB = await getDatabasesPath();

    var sqlite = openDatabase(join(pathDB, 'crud_user.db'), version: versionDB,
        onCreate: (db, version) {
      // é executado sempre que o banco precisa ser criado,
      // ou seja, sempre que o app é iniciado pela primeira vez,
      // ou os dados são apagados na configuração
      print('onCreate $version');

      return db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            age INTEGER,
            document TEXT,
            email TEXT,
            active INTEGER
          );

          CREATE TABLE products(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
          );

          CREATE TABLE categories(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
          );
        ''');
    }, onUpgrade: (db, oldVersion, newVersion) {
      print('upgrade old version $oldVersion');
      print('upgrade new version $newVersion');

      if (newVersion == 5) {
        db.execute('''
          CREATE TABLE categories(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
          )
        ''');
      }
    });

    return sqlite;
  }
}
