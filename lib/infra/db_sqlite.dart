import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBSQLite {
  Database _instance;
  final VERSION_DB = 11;

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
    final pathDB = await getDatabasesPath();
    final sqlite = openDatabase(
      join(pathDB, 'crud_users.db'),
      version: VERSION_DB,
      onCreate: (db, version) {
        print('onCreate $version');

        return db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            age INTEGER,
            document TEXT,
            email TEXT,
            active INTEGER,
            image TEXT
          );

          CREATE TABLE address(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            address TEXT
          );

          CREATE TABLE products(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
          );
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        print('oldVersion $oldVersion');
        print('newVersion $newVersion');

        if (newVersion == 6) {
          db.execute('''
          CREATE TABLE address(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            address TEXT
          )
        ''');
        }

        if (newVersion == 11) {
          db.execute('''
          CREATE TABLE products(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
          )
        ''');
        }
      },
    );

    return sqlite;
  }
}
