part of 'career_bloc.dart';

sealed class CareerEvent {}

class CareerEventStarted extends CareerEvent {}

class CareerEventRequested extends CareerEvent {}
