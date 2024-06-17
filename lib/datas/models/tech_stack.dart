import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../enums/tech_category.dart';
import 'tech_skill.dart';

class TechStack extends Equatable {
  final TechCategory category;
  final List<TechSkill> skills;

  const TechStack(
    this.category,
    this.skills,
  );

  TechStack.fromMap(Map<String, dynamic> source)
      : this(
          TechCategory.parse(source[_Key.category]),
          TechSkill.fromIterable(source[_Key.skills]),
        );

  TechStack.fromJson(String source) : this.fromMap(jsonDecode(source));

  @override
  List<Object?> get props => [category, skills];
}

extension _Key on TechStack {
  static const String category = "category";
  static const String skills = "skills";
}
