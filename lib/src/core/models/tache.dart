import 'dart:convert';

class Tache {
  int id;
  String libelle;
  String description;
  DateTime date;
  int idCategorie;

  Tache(this.id, this.libelle, this.description, this.date, this.idCategorie);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'libelle': libelle,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'idCategorie': idCategorie,
    };
  }

  factory Tache.fromMap(Map<String, dynamic> map) {
    return Tache(
      map['id']?.toInt() ?? 0,
      map['libelle'] ?? '',
      map['description'] ?? '',
      DateTime.fromMillisecondsSinceEpoch(map['date']),
      map['idCategorie']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tache.fromJson(String source) => Tache.fromMap(json.decode(source));
}
