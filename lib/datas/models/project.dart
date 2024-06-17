import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../enums/project_platform.dart';
import '../enums/project_category.dart';

class Project extends Equatable {
  const Project(
    this.name,
    this.category,
    this.platforms,
    this.roles,
    this.startsAt,
    this.endsAt,
  );

  Project.fromMap(Map<String, dynamic> source)
      : this(
          source[_Key.name],
          ProjectCategory.parse(source[_Key.category]),
          ProjectPlatform.parseAll(List<int>.from(source[_Key.platforms])),
          List<String>.from(source[_Key.roles]),
          DateTime.fromMillisecondsSinceEpoch(source[_Key.startsAt]),
          DateTime.fromMillisecondsSinceEpoch(source[_Key.endsAt]),
        );

  Project.fromJson(String source) : this.fromMap(jsonDecode(source));

  static List<Project> fromIterable(Iterable<dynamic> source) {
    return source.map<Project>((e) => Project.fromMap(e)).toList();
  }

  final String name;
  final ProjectCategory category;
  final List<ProjectPlatform> platforms;
  final List<String> roles;
  final DateTime startsAt;
  final DateTime endsAt;

  String get formattedProjectWorkPeriod {
    if (category == ProjectCategory.other) {
      return "";
    } else if (startsAt.isAtSameMomentAs(endsAt)) {
      return "(${startsAt.year})";
    } else {
      return "(${startsAt.year} - ${endsAt.year})";
    }
  }

  @override
  List<Object?> get props => [
        name,
        category,
        roles,
        startsAt,
        endsAt,
      ];

  Project copyWith({
    String? name,
    ProjectCategory? category,
    List<ProjectPlatform>? platforms,
    List<String>? roles,
    DateTime? startsAt,
    DateTime? endsAt,
  }) =>
      Project(
        name ?? this.name,
        category ?? this.category,
        platforms ?? this.platforms,
        roles ?? this.roles,
        startsAt ?? this.startsAt,
        endsAt ?? this.endsAt,
      );
}

extension _Key on Project {
  static const String name = "name";
  static const String category = "category";
  static const String platforms = "platforms";
  static const String roles = "roles";
  static const String startsAt = "starts_at";
  static const String endsAt = "ends_at";
}
