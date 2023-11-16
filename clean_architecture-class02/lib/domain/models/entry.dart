import 'dart:convert';

import 'package:floor/floor.dart';

@entity
class Entry {
  @primaryKey
  int id;
  String name;
  String image;
  String description;
  String commonLocations;
  String category;

  Entry({
    this.id = 0,
    this.name = '',
    this.image = '',
    this.description = '',
    this.commonLocations = '',
    this.category = '',
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'image': image});
    result.addAll({'description': description});
    result.addAll({'commonLocations': commonLocations});
    result.addAll({'category': category});

    return result;
  }

  factory Entry.fromMap(Map<String, dynamic> map) {
    return Entry(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      description: map['description'] ?? '',
      commonLocations:
          jsonEncode(map['common_locations'] ?? ['Sem localizacao']),
      category: map['category'] ?? '',
    );
  }

  List<String> commonLocationConverter() {
    return (jsonDecode(commonLocations) as List<dynamic>)
        .map((e) => e as String)
        .toList();
  }

  String toJson() => json.encode(toMap());

  factory Entry.fromJson(String source) => Entry.fromMap(json.decode(source));
}
