import 'dart:io';

class User {
  int id;
  String name;
  int age;
  String email;
  String document;
  bool active;
  File image;

  User({
    this.name,
    this.age,
    this.email,
    this.document,
    this.active = false,
    this.id,
  });

  User.fromDB(Map<String, dynamic> value) {
    this.name = value['nome'];
    this.age = value['age'] as int;
    this.email = value['email'];
    this.document = value['document'];
    this.active = (value['active'] as int) == 1;
    this.id = value['id'];
    this.image = value['image'] != null ? File(value['image']) : null;
  }

  Map<String, dynamic> toDB() {
    final map = {
      'nome': this.name,
      'email': this.email,
      'document': this.document,
      'age': this.age,
      'active': this.active ? 1 : 0,
      'image': this.image?.path,
    };
    return map;
  }
}
