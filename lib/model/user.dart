class User {
  int id;
  String userName;
  String profession;

  User({required this.id, required this.userName, required this.profession});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': userName,
      'profession': profession,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      userName: map['username'],
      profession: map['profession'],
    );
  }

}
