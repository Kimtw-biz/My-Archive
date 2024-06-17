import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import '../enums/working_state.dart';

class Profile extends Equatable {
  const Profile(
    this.name,
    this.nameEn,
    this.email,
    this.contact,
    this.imageUrl,
    this.workingArea,
    this.currentState,
    this.dateOfBirth,
    this.introduction,
    this.philosophy,
    this.educations,
    this.certificates,
    this.interests,
    this.activities,
    this.updatedAt,
    this.figmaUrl,
    this.githubUrl,
    this.resumeUrl,
  );

  Profile.fromMap(Map<String, dynamic> source)
      : this(
          source[_Key.name],
          source[_Key.nameEn],
          source[_Key.email],
          source[_Key.contact],
          source[_Key.imageUrl],
          List<String>.from(source[_Key.workingArea]),
          WorkingState.parse(source[_Key.currentState]),
          DateTime.fromMillisecondsSinceEpoch(source[_Key.dateOfBirth]),
          source[_Key.introduction],
          source[_Key.philosophy],
          List<String>.from(source[_Key.educations]).reversed.toList(),
          List<String>.from(source[_Key.certificates]).reversed.toList(),
          List<String>.from(source[_Key.interests]),
          List<String>.from(source[_Key.activities]),
          DateTime.fromMillisecondsSinceEpoch(source[_Key.updateAt]),
          source[_Key.figmaUrl],
          source[_Key.githubUrl],
          source[_Key.resumeUrl],
        );

  Profile.fromJson(String source) : this.fromMap(jsonDecode(source));

  final String name;
  final String nameEn;
  final String email;
  final String contact;
  final String imageUrl;
  final List<String> workingArea;
  final WorkingState currentState;
  final DateTime dateOfBirth;
  final String introduction;
  final String philosophy;
  final List<String> educations;
  final List<String> certificates;
  final List<String> interests;
  final List<String> activities;
  final DateTime updatedAt;

  final String figmaUrl;
  final String githubUrl;
  final String resumeUrl;

  String get formattedIntroduction => introduction.replaceAll("\\n", "\n");
  String get formattedWorkingArea => workingArea.join(", ");
  String get formattedDateOfBirth => DateFormat("yyyy.MM.dd").format(dateOfBirth);
  String get formattedDateOfBirthAge => "(${(DateTime.now().difference(dateOfBirth).inDays / 365).floor()})";
  String get formattedUpdatedAt => DateFormat("yyyy.MM").format(updatedAt);
  String get formattedContact => "+82 ${contact.substring(1)}";

  @override
  List<Object?> get props => [
        name,
        nameEn,
        email,
        contact,
        imageUrl,
        workingArea,
        currentState,
        dateOfBirth,
        introduction,
        philosophy,
        educations,
        certificates,
        interests,
        activities,
        updatedAt,
        resumeUrl,
        figmaUrl,
        githubUrl,
      ];

  Profile copyWith({
    String? name,
    String? nameEn,
    String? email,
    String? contact,
    String? imageUrl,
    List<String>? workingArea,
    WorkingState? currentState,
    DateTime? dateOfBirth,
    String? introduction,
    String? philosophy,
    List<String>? educations,
    List<String>? certificates,
    List<String>? interests,
    List<String>? activities,
    DateTime? updatedAt,
    String? figmaUrl,
    String? githubUrl,
    String? resumeUrl,
  }) =>
      Profile(
        name ?? this.name,
        nameEn ?? this.nameEn,
        email ?? this.email,
        contact ?? this.contact,
        imageUrl ?? this.imageUrl,
        workingArea ?? this.workingArea,
        currentState ?? this.currentState,
        dateOfBirth ?? this.dateOfBirth,
        introduction ?? this.introduction,
        philosophy ?? this.philosophy,
        educations ?? this.educations,
        certificates ?? this.certificates,
        interests ?? this.interests,
        activities ?? this.activities,
        updatedAt ?? this.updatedAt,
        resumeUrl ?? this.resumeUrl,
        figmaUrl ?? this.figmaUrl,
        githubUrl ?? this.githubUrl,
      );
}

extension _Key on Profile {
  static const String name = "name";
  static const String nameEn = "name_en";
  static const String email = "email";
  static const String contact = "contact";
  static const String imageUrl = "image_url";
  static const String workingArea = "working_area";
  static const String currentState = "current_state";
  static const String dateOfBirth = "date_of_birth";
  static const String introduction = "introduction";
  static const String philosophy = "philosophy";
  static const String educations = "educations";
  static const String certificates = "certificates";
  static const String interests = "interests";
  static const String activities = "activities";
  static const String updateAt = "updated_at";
  static const String resumeUrl = "resume_url";
  static const String figmaUrl = "figma_url";
  static const String githubUrl = "github_url";
}
