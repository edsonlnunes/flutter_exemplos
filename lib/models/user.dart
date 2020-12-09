class User {
  String name;
  String age;
  String email;
  String document;
  bool active;

  static final users = <User>[
    User(
      name: 'User 1',
      age: '21',
      email: 'user@teste.com',
      active: true,
      document: '00011122233',
    ),
    User(
      name: 'User 2',
      age: '21',
      email: 'user2@teste.com',
      active: false,
      document: '00011122233',
    ),
  ];

  User({
    this.name,
    this.age,
    this.email,
    this.document,
    this.active = false,
  });
}
