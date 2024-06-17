part of 'tech_stack_bloc.dart';

sealed class TechStackState extends Equatable {
  const TechStackState(this.techStacks);

  final List<TechStack>? techStacks;

  @override
  List<Object?> get props => [techStacks];
}

final class TechStackStateInitial extends TechStackState {
  const TechStackStateInitial(List<TechStack>? techStacks) : super(techStacks);
}

final class TechStackStateSuccess extends TechStackState {
  const TechStackStateSuccess(List<TechStack>? techStacks) : super(techStacks);

  @override
  List<TechStack> get techStacks => super.techStacks!;
}

final class TechStackStateFailure extends TechStackState {
  const TechStackStateFailure(List<TechStack>? techStacks) : super(techStacks);
}
