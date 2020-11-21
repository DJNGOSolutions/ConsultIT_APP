class User {
  String username;
  String email;
  String password;
  String tipo;
  String id;

  User({this.username, this.email, this.password, this.tipo, this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['user']['email'].toString() ?? '',
        password: json['user']['hashedPassword'].toString() ?? '',
        username: json['user']['username'].toString() ?? '',
        id: json['user']['_id'].toString(),
        tipo: json['user']['type'].toString() ?? '');
  }
}
