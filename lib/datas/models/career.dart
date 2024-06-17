import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'project.dart';

class Career extends Equatable {
  const Career(
    this.name,
    this.roles,
    this.projects,
    this.firstDayOfWork,
    this.lastDayOfWork,
  );

  Career.fromMap(Map<String, dynamic> source)
      : this(
          source[_Key.name],
          List<String>.from(source[_Key.roles]),
          Project.fromIterable(source[_Key.projects]),
          DateTime.fromMillisecondsSinceEpoch(source[_Key.firstDayOfWork]),
          DateTime.fromMillisecondsSinceEpoch(source[_Key.lastDayOfWork]),
        );

  Career.fromJson(String source) : this.fromMap(jsonDecode(source));

  final String name;
  final List<String> roles;
  final List<Project> projects;
  final DateTime firstDayOfWork;
  final DateTime lastDayOfWork;

  String get formattedDayOfWork => "(${firstDayOfWork.year} - ${lastDayOfWork.year})";

  @override
  List<Object?> get props => [
        name,
        roles,
        projects,
        firstDayOfWork,
        lastDayOfWork,
      ];
}

extension _Key on Career {
  static const String name = "name";
  static const String roles = "roles";
  static const String projects = "projects";
  static const String firstDayOfWork = "first_day_of_work";
  static const String lastDayOfWork = "last_day_of_work";
}
