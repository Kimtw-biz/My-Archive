part of 'career_bloc.dart';

sealed class CareerState extends Equatable {
  const CareerState(this.careers);

  final List<Career>? careers;

  @override
  List<Object?> get props => [careers];
}

final class CareerStateInitial extends CareerState {
  const CareerStateInitial(List<Career>? careers) : super(careers);
}

final class CareerStateSuccess extends CareerState {
  const CareerStateSuccess(List<Career>? careers) : super(careers);

  @override
  List<Career> get careers => super.careers!;
}

final class CareerStateFailure extends CareerState {
  const CareerStateFailure(List<Career>? careers) : super(careers);
}
