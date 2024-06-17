part of 'tech_stack_bloc.dart';

sealed class TechStackEvent {}

class TechStackEventStarted extends TechStackEvent {}

class TechStackEventRequested extends TechStackEvent {}
