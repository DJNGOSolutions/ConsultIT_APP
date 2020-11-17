class User {
  String username;
  String email;
  String password;
  String tipo;

  User({this.username, this.email, this.password, this.tipo});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['user']['email'],
        password: json['user']['hashedPassword'],
        username: json['user']['username'],
        tipo: json['user']['type']);
  }
}
