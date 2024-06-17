part of 'profile_bloc.dart';

sealed class ProfileEvent {}

final class ProfileEventStarted extends ProfileEvent {}

final class ProfileEventRequested extends ProfileEvent {}
