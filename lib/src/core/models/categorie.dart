import 'dart:convert';

class Categorie {
  int id;
  String libelle;
  int idUser;

  Categorie(this.id, this.libelle, this.idUser);

  Map<String, dynamic> toMap() {
    return {'id': id, 'libelle': libelle, 'idUser': idUser};
  }

  factory Categorie.fromMap(Map map) {
    return Categorie(
      map['id']?.toInt() ?? 0,
      map['libelle'] ?? '',
      map['idUser']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Categorie.fromJson(String source) =>
      Categorie.fromMap(json.decode(source));
}
