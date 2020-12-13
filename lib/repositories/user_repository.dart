import 'package:flutter_exemplos/infra/db_sqlite.dart';
import 'package:flutter_exemplos/models/user.dart';

class UserRepository {
  final DBSQLite _db;

  UserRepository(this._db);

  Future<List<User>> getUsers() async {
    var instance = await _db.getInstance();
    print('getUsers');

    await Future.delayed(Duration(seconds: 2));
    var usersDB = await instance.query('users');
    var users = usersDB.map<User>((user) => User.fromDB(user)).toList();
    return users;
  }

  Future<int> saveUser(User user) async {
    var instance = await _db.getInstance();

    final idUser = await instance.insert('users', user.toDB());

    return idUser;
  }

  Future<bool> updateUser(User user) async {
    var instance = await _db.getInstance();

    final effects = await instance.update(
      'users',
      user.toDB(),
      where: 'id = ?',
      whereArgs: [user.id],
    );

    print('idUserBanco $effects');
    print('userid ${user.id}');

    return effects > 0;
  }

  Future<bool> deleteUser(int id) async {
    var instance = await _db.getInstance();
    var effects =
        await instance.delete('users', where: 'id = ?', whereArgs: [id]);
    return effects > 0;
  }
}
