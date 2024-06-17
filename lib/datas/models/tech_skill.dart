import 'dart:convert';

import 'package:equatable/equatable.dart';

class TechSkill extends Equatable {
  final String name;
  final String imageUrl;

  const TechSkill(
    this.name,
    this.imageUrl,
  );

  TechSkill.fromMap(Map<String, dynamic> source)
      : this(
          source[_Key.name],
          source[_Key.imageUrl],
        );

  TechSkill.fromJson(String source) : this.fromMap(jsonDecode(source));

  static List<TechSkill> fromIterable(Iterable<dynamic> source) {
    return source.map<TechSkill>((e) => TechSkill.fromMap(e)).toList();
  }

  @override
  List<Object?> get props => [
        name,
        imageUrl,
      ];

  TechSkill copyWith({
    String? name,
    String? imageUrl,
  }) =>
      TechSkill(
        name ?? this.name,
        imageUrl ?? this.imageUrl,
      );
}

extension _Key on TechSkill {
  static const String name = "name";
  static const String imageUrl = "image_url";
}
