class User {
  int id;
  String name;
  String document;
  String email;
  int age;
  bool active;

  User({
    this.id,
    this.name,
    this.document,
    this.email,
    this.age,
    this.active = false,
  });

  factory User.fromDB(Map<String, dynamic> user) {
    return User(
      id: user['id'] as int,
      name: user['name'],
      email: user['email'],
      document: user['document'],
      age: user['age'] as int,
      active: (user['active'] as int) == 1,
    );
  }

  Map<String, dynamic> toDB() {
    var userMap = {
      'name': this.name,
      'document': this.document,
      'email': this.email,
      'age': this.age,
      'active': this.active ? 1 : 0,
    };

    return userMap;
  }
}
