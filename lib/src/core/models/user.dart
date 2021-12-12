import 'dart:convert';

class User {
  int id;
  String nom;
  String prenom;
  String username;
  String password;

  User(this.id, this.nom, this.prenom, this.username, this.password);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'username': username,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['id']?.toInt() ?? 0,
      map['nom'] ?? '',
      map['prenom'] ?? '',
      map['username'] ?? '',
      map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
